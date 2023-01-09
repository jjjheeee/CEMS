### df_save_db.py

from sqlalchemy import create_engine
from sshtunnel import SSHTunnelForwarder
import pymysql
import pandas as pd

engine = create_engine(f"mariadb+pymysql://CEMS:aA12345!@34.64.190.131:3306/CEMS")

# question_df = pd.DataFrame(columns=['paragraph_id','TOPIK1_listening_file','sentence_id','TOPIK1_type_id','TOPIK1_subtype_id','question_set','paragraph','question_image','TOPIK1_question','question_answer','question_wrong','question_counts','question_used'])
with SSHTunnelForwarder(
    ('34.64.190.131', 22),
    ssh_username='joungminyt',
    ssh_pkey='C:/big15/project/member/LEE/workspace/python/fastapi-test/sql-app/backend/ssh/id_rsa',
    remote_bind_address=('127.0.0.1', 8000)
    ) as server:
    with pymysql.connect(host='34.64.190.131',user='CEMS', password='aA12345!', port=3306,
                         db = 'CEMS', charset='utf8',cursorclass=pymysql.cursors.DictCursor
                         , connect_timeout=30) as conn:
        with conn.cursor() as cur:
            question_df = pd.read_excel('C:/big15/project/member/KIM/CEMS_AI/AI_CREATE/question/test.xlsx')
            question_df.drop(['question_used','listening_check'], axis=1,inplace=True)
            question_df.to_sql(name='create_TOPIK1_question', con=engine, if_exists='append',index=False)