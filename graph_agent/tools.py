import logging
logging.getLogger('google.cloud.spanner').setLevel(logging.CRITICAL)
import json
import os
from google.cloud import spanner

# Dynamically load GCP resources via environment variables
PROJECT_ID = os.environ.get("GOOGLE_CLOUD_PROJECT", "krkg-demo")
INSTANCE_ID = os.environ.get("SPANNER_INSTANCE_ID", "kg-changseop")
DATABASE_ID = os.environ.get("SPANNER_DATABASE_ID", "ecommerce2")

def execute_spanner_query(query: str) -> str:
    """Executes a GQL or SQL query on the Spanner database and returns the result as a JSON string.
    
    Args:
        query: The GQL or SQL query string to execute.
    """
    try:
        spanner_client = spanner.Client(project=PROJECT_ID)
        instance = spanner_client.instance(INSTANCE_ID)
        database = instance.database(DATABASE_ID)
        
        results = []
        with database.snapshot() as snapshot:
            result = snapshot.execute_sql(query)
            for i, row in enumerate(result):
                if i >= 100:  # Hard safety limit for history protection
                    results.append(["...[Result truncated after 100 rows to prevent token overflow]..."])
                    break
                # DatetimeWithNanoseconds 객체를 문자열로 변환
                processed_row = [val.isoformat() if hasattr(val, 'isoformat') else val for val in row]
                results.append(processed_row)
                
        return json.dumps(results, ensure_ascii=False)
    except Exception as e:
        # Graceful error reporting back to LLM for self-correction
        return f"[ERROR] Spanner query execution failed: {str(e)}"
