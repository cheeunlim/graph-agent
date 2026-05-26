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
PROJECT_ID = os.environ.get("SPANNER_PROJECT_ID") or os.environ.get("GOOGLE_CLOUD_PROJECT")
INSTANCE_ID = os.environ.get("SPANNER_INSTANCE_ID")
DATABASE_ID = os.environ.get("SPANNER_DATABASE_ID")

if not PROJECT_ID or not INSTANCE_ID or not DATABASE_ID:
    missing_vars = [
        var_name for var_name, var_val in [
            ("SPANNER_PROJECT_ID or GOOGLE_CLOUD_PROJECT", PROJECT_ID),
            ("SPANNER_INSTANCE_ID", INSTANCE_ID),
            ("SPANNER_DATABASE_ID", DATABASE_ID)
        ] if not var_val
    ]
    raise ValueError(
        f"Missing required environment variable(s): {', '.join(missing_vars)}. "
        "Please set them in your environment or .env file."
    )

class GlobalGemini(Gemini):
    @cached_property
    def api_client(self) -> Client:
        # Initialize GenAI Client using Vertex AI backend with user project and global endpoint
        return Client(vertexai=True, project=PROJECT_ID, location="global")

def get_spanner_ddl():
    dir_path = os.path.dirname(os.path.realpath(__file__))
    cache_file = os.path.join(dir_path, "schema.ddl")
    
    # 1. ALWAYS prioritize fetching fresh, live DDL from Spanner database to guarantee 100% dynamic correctness
    try:
        print("Fetching fresh, live DDL from Spanner database...")
        from .tools import get_spanner_client_and_db
        _, database = get_spanner_client_and_db()
        database.reload()
        ddl_statements = database.ddl_statements
        ddl_text = ";\n".join(ddl_statements)
        
        # Update local backup file for offline/fallback use
        try:
            with open(cache_file, "w", encoding="utf-8") as f:
                f.write(ddl_text)
            print(f"Successfully updated local schema backup: {cache_file}")
        except Exception as cache_err:
            print(f"Warning: Could not write schema backup: {cache_err}")
            
        return ddl_text
    except Exception as e:
        print(f"Spanner database connection failed: {e}")
        # 2. Offline fallback ONLY when Spanner cannot be reached (e.g., during headless deployment builds)
        if os.path.exists(cache_file):
            print(f"Falling back to local schema backup: {cache_file}")
            with open(cache_file, "r", encoding="utf-8") as f:
                content = f.read()
                if len(content.strip()) > 100 and "PROPERTY GRAPH" in content:
                    return content
        raise ValueError(
            f"Could not fetch Spanner DDL and no valid local backup exists. Error: {e}"
        )

# 1. 스패너에서 실제 DDL 가져오기 (자동 업데이트 및 로컬 캐시 사용)
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
