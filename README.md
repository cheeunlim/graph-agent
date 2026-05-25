# The Look E-Commerce: Spanner Graph ADK Agent

이 저장소는 Google의 에이전트 개발 프레임워크인 **ADK (Agent Development Kit) 2.0**을 사용하여 구현한 **Spanner Graph Agent**입니다.

이 에이전트는 Google Cloud의 지식그래프 데이터베이스인 **Cloud Spanner Graph**를 기반으로 작동합니다. 사용자가 입력한 자연어 질문을 효율적인 GQL/SQL 쿼리로 자동 변환하고 실행하여, 복잡한 다대다(N:M) 관계 데이터를 깊이 있게 분석하고 정확한 답변을 찾아냅니다.

GCP 프로젝트 정보와 Spanner 리소스 경로만 환경 변수로 간단히 등록하면, 로컬 테스트부터 Google Cloud의 완전 관리형 에이전트 호스팅 서비스인 **Vertex AI Agent Engine** 배포까지 한 번에 완료할 수 있습니다.

---

## 📂 프로젝트 구조 (Repository Structure)

에이전트의 비즈니스 로직과 배포 설정을 깔끔하게 분리하여 가벼운 패키지 형태로 구성했습니다.

```text
.
├── .gitignore                   # 가상 환경 및 로컬 환경 설정 파일(.env) 배제
├── README.md                    # 사용 방법 및 배포 가이드
│
└── graph_agent/                 # Spanner Graph 에이전트 메인 디렉터리
    ├── __init__.py              # 패키지 진입점 (root_agent 정의)
    ├── agent.py                 # 에이전트 정의 및 동적 DDL 주입 로직
    ├── tools.py                 # Spanner Graph 연결 및 GQL/SQL 실행 도구
    ├── instructions.py          # 지식그래프 해석 및 쿼리 생성 가이드라인
    ├── prompts.py               # 고품질 GQL 쿼리 작성을 돕는 Few-shot 프롬프트
    ├── requirements.txt         # 패키지 실행에 필요한 의존성 목록 (google-adk 등)
    └── schema.ddl               # 캐싱된 Spanner Graph DDL 파일 (최초 실행 속도 가속용)
```

---

## 🛠️ 준비 사항 (Prerequisites)

에이전트를 실행하거나 배포하기 전에 아래 GCP 리소스와 권한이 먼저 준비되어 있어야 합니다.

1. **GCP 프로젝트**: 결제가 등록된 Google Cloud 프로젝트가 필요합니다.
2. **API 활성화**: GCP 콘솔에서 **Vertex AI API** (`aiplatform.googleapis.com`)와 **Cloud Spanner API** (`spanner.googleapis.com`)를 활성화해 주세요.
3. **Spanner 데이터베이스 및 지식그래프**:
   * 대상을 수용할 Spanner 인스턴스와 데이터베이스가 생성되어 있어야 합니다.
   * Spanner Graph 스키마(U2G, R2G 모델) 및 관련 기본 테이블(`users`, `orders`, `order_items`, `products` 등)에 데이터가 정상적으로 입력되어 있어야 합니다.

---

## ⚙️ STEP 1. 로컬 환경 구성 및 라이브러리 설치

로컬 터미널에서 저장소를 복제한 뒤 가상환경을 설정합니다. (Python 3.11 이상 권장)

```bash
# 1. 저장소 복제 및 디렉터리 이동
git clone https://github.com/your-username/enterprise-kg.git
cd enterprise-kg

# 2. 가상환경 생성 및 활성화
python3 -m venv venv
source venv/bin/activate

# 3. ADK CLI 및 필수 패키지 설치
pip install google-adk
```

---

## 🔐 STEP 2. GCP 인증 및 환경 변수 설정

1. **GCP 계정 로그인 및 Application Default Credentials (ADC) 활성화**:
   로컬 개발 환경에서 에이전트가 내 GCP Spanner와 Vertex AI에 접근할 수 있도록 권한을 인증합니다.
   ```bash
   gcloud auth login
   gcloud auth application-default login
   ```

2. **환경 변수 파일 (`.env`) 생성**:
   ADK는 에이전트 디렉터리 내부에 있는 `.env` 파일을 자동으로 감지하여 작동합니다.
   `graph_agent/` 디렉터리 안에 `.env` 파일을 새로 만들고 아래와 같이 내 리소스 정보를 입력해 주세요.

   * **`graph_agent/.env` 파일 작성 예시**:
     ```env
     GOOGLE_CLOUD_PROJECT="내-GCP-프로젝트-ID"
     SPANNER_INSTANCE_ID="내-Spanner-인스턴스-ID"
     SPANNER_DATABASE_ID="내-Spanner-데이터베이스-ID"
     ```

---

## 🧪 STEP 3. ADK 도구를 활용한 로컬 테스트

ADK 2.0은 별도의 웹 서버나 복잡한 프런트엔드 코드를 짜지 않아도, 로컬에서 에이전트의 품질을 눈으로 직접 보완하고 점검할 수 있는 강력한 도구를 내장하고 있습니다.

### **방법 A. 터미널 대화형 모드 (`adk run`)**
에이전트가 Spanner 도구를 어떻게 호출하고 어떻게 답변을 유도하는지 터미널에서 즉시 테스트해 볼 수 있습니다.
```bash
adk run graph_agent
```
*(종료하려면 `exit` 또는 `Ctrl+C` 입력)*

### **방법 B. 내장 웹 플레이그라운드 UI 실행 (`adk web`)**
> [!NOTE]
> **웹 UI용 프런트엔드 코드가 따로 필요한가요?** \
> 이 저장소에는 웹 화면을 렌더링하기 위한 별도의 코드가 없습니다. 
> `google-adk` 패키지 자체에 대화형 채팅 플레이그라운드가 내장되어 있어, `adk web .` 명령어 한 줄로 편리하고 세련된 디버깅 화면을 띄워 로컬에서 바로 테스트할 수 있습니다.

```bash
adk web .
```
* 명령어를 실행한 뒤 브라우저에서 `http://127.0.0.1:8000`에 접속합니다.
* 사이드바에서 `graph_agent`를 선택하면, 에이전트의 구체적인 사고 과정(Thought), 동작한 인스트럭션, 실제 호출된 Spanner Graph 쿼리(Tool Call) 및 실시간 답변 흐름을 직관적으로 확인하며 채팅을 해볼 수 있습니다.

---

## 🚢 STEP 4. Vertex AI Agent Engine에 클라우드 배포

로컬 테스트 결과가 만족스럽다면, 이제 Google Cloud의 완전 관리형 서버리스 에이전트 실행 환경인 **Vertex AI Agent Engine**으로 배포합니다. 

배포가 완료되면 클라우드 자산(GCP Resource)으로 안전하게 등록되며, 기존 애플리케이션이나 다른 대외 시스템에서 안정적인 REST API 형태로 에이전트를 손쉽게 호출하고 연계할 수 있습니다.

```bash
adk deploy agent_engine \
  --project=[내_GCP_프로젝트_ID] \
  --region=[배포할_리전] \
  --display_name="TheLook-Graph-Agent" \
  graph_agent
```

### 🎯 배포 완료 후 작동 원리
* 배포가 완료되면 터미널에 고유한 **`Reasoning Engine ID`**와 구글 클라우드 콘솔 링크가 제공됩니다.
* 이 ID를 통해 Python SDK 혹은 REST API 엔드포인트로 클라우드에 호스팅된 에이전트에게 언제든 자연어 쿼리를 보내고 결과를 받아볼 수 있습니다.
* 로컬의 `graph_agent/.env` 파일에 지정한 환경 변수들이 배포 프로세스를 거치면서 원클릭으로 클라우드에 연동되기 때문에, 추가적인 리소스 설정 작업이 전혀 필요하지 않습니다.
