import logging
logging.getLogger('google.cloud.spanner').setLevel(logging.CRITICAL)
import os
import subprocess
from functools import cached_property
from google.adk.agents import Agent
from google.adk.models import Gemini
from google.genai import Client
from .tools import execute_spanner_query
from .prompts import get_instruction

# Dynamically load GCP resources via environment variables
PROJECT_ID = os.environ.get("GOOGLE_CLOUD_PROJECT", "krkg-demo")
INSTANCE_ID = os.environ.get("SPANNER_INSTANCE_ID", "kg-changseop")
DATABASE_ID = os.environ.get("SPANNER_DATABASE_ID", "ecommerce2")

class GlobalGemini(Gemini):
    @cached_property
    def api_client(self) -> Client:
        # Initialize GenAI Client using Vertex AI backend with user project and global endpoint
        return Client(vertexai=True, project=PROJECT_ID, location="global")

def get_spanner_ddl():
    dir_path = os.path.dirname(os.path.realpath(__file__))
    cache_file = os.path.join(dir_path, "schema.ddl")
    if os.path.exists(cache_file):
        print(f"Loading DDL from cache file: {cache_file}")
        with open(cache_file, "r", encoding="utf-8") as f:
            return f.read()
            
    print("Fetching DDL from Spanner (this may take a while)...")
    cmd = [
        "gcloud", "spanner", "databases", "ddl", "describe", DATABASE_ID,
        f"--instance={INSTANCE_ID}", f"--project={PROJECT_ID}"
    ]
    result = subprocess.run(cmd, capture_output=True, text=True, check=True)
    
    # Save to cache
    with open(cache_file, "w", encoding="utf-8") as f:
        f.write(result.stdout)
        
    return result.stdout

# 1. 스패너에서 실제 DDL 가져오기 (로컬 캐시파일 사용 권장)
ddl = get_spanner_ddl()

# 2. 동적 스키마가 반영된 인스트럭션 생성
instruction = get_instruction(dynamic_schema=ddl)

# 3. ADK 에이전트 정의
root_agent = Agent(
    model=GlobalGemini(model="gemini-2.5-pro"),
    name="graph_agent",
    description="Graph Query Agent for The Look E-commerce. Generates and executes GQL on Spanner.",
    instruction=instruction,
    tools=[execute_spanner_query]
)

if __name__ == "__main__":
    # 인터랙티브 테스트 루프
    print("=" * 50)
    print("Graph Agent (ADK) Interactive Test")
    print("=" * 50)
    print("(종료하시려면 'exit' 또는 'q'를 입력하세요.)")
    
    while True:
        query = input("\n질문을 입력하세요: ").strip()
        if not query:
            continue
        if query.lower() in ['exit', 'q']:
            print("종료합니다.")
            break
            
        try:
            response = root_agent.run(query)
            print(f"\n[답변]\n{response}")
        except Exception as e:
            print(f"에러 발생: {e}")
            print("ADK 라이브러리가 설치되어 있고 `run` 메서드가 지원되는지 확인해주세요.")
