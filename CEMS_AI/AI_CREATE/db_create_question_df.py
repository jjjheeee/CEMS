### db_create_question.py
# -*- coding: utf-8 -*-
from sqlalchemy import create_engine
from sshtunnel import SSHTunnelForwarder
import pymysql
import pandas as pd
from create_TOPIK1_1 import TOPIK1_blank_basic
# from create_TOPIK1_2 import TOPIK1_blank_intermediate

question_df = pd.DataFrame(columns=['paragraph_id','sentence_id','TOPIK1_type_id','TOPIK1_subtype_id','question_set','paragraph','question_image','TOPIK1_question','question_answer','question_wrong','question_counts','question_used','listening_check'])
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
                sql = '''
                SELECT * from TOPIK1_reading_ai where sentence_used = '0'
                '''
                cur.execute(sql)
                results = cur.fetchall()
                i = 0
                for result in results:
                    print(result)
                    text = result['question_sentence']
                    sentence_id = result['sentence_id']
                    TOPIK1_type_id = result['TOPIK1_type_id']
                    list_ = TOPIK1_blank_basic.create_all(text)  
                    try:
                        for TOPIK1_subtype_id, paragrph, bogi, answer  in list_:
                            question_df.loc[i] = [None, sentence_id, TOPIK1_type_id, TOPIK1_subtype_id, None, paragrph, None, None, answer, '/'.join(bogi), 0, '0','0'] 
                            i+=1
                    except:
                        continue
                question_df.drop_duplicates(['sentence_id','question_answer'],keep='first',inplace=True,ignore_index=True)
                question_df.to_excel('C:/big15/project/member/KIM/CEMS_AI/AI_CREATE/question/test.xlsx',index=False, encoding = 'utf8')