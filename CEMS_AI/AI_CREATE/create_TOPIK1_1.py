# create_TOPIK1_1.py
from konlpy.tag import Okt
from konlpy.tag import Komoran
from create_wrong_def import create_wrong


# TOPIK1 빈칸 채우기 문제 (basic)
# 34~39번 (명사, 동사, 일반 부사, 조사)
class TOPIK1_blank_basic:
    
    okt = Okt()
    kom = Komoran()
    
    # 34~39
    # 명사 빈칸 문제 생성
    def noun(text,word):
        # 명사 빈칸(okt : Noun)
        TOPIK1_subtype_id = 11
        try:
            bogi = create_wrong.n_wrong(word)
            paragraph = text.replace(word, '(     )',1)
            return TOPIK1_subtype_id, paragraph, bogi, word
        except:
            print(word)
            print('명사 부분 에러')
            pass
        
    def josa(text, word, word_list): # '아이가 물에 뛰어들자 사람들이 박수를 쳤습니다.'
        TOPIK1_subtype_id = 12              # 문제유형 12번 지정

        text_split = text.split(' ')        # 띄어쓰기로 text 분리
        word_replace = ''
        paragraph = ''
        for word_ in text_split:                                     # text_split(띄어쓰기 분리)에서 단어(word) 추출 
            if (word_list[(word_list.index(word)-1)]+word in word_): # word_list에서 Josa 앞의 단어와 Josa가 합쳐진 단어가 word 안에 있을 경우
                word_replace = word_.replace(word, '(     )',1)                            # 해당 word를 answer_list에 추가
                paragraph = text.replace(word_, word_replace)
        try:
            if (word == '가') or (word == '는'):
                bogi = ['을', '로', '은', '나', '이', '에게', '한테']
                return TOPIK1_subtype_id, paragraph, bogi, word
            else:
                bogi = create_wrong.j_wrong(word)
                return TOPIK1_subtype_id, paragraph, bogi, word
        except:
            print(word)
            print('조사 부분 에러')
            pass

    
    # 34~39
    # '다'로 끝나는 동사/형용사 빈칸 문제 생성
    def verb(text,word):
        # 동사 빈칸(okt : Verb, Adjective)
        TOPIK1_subtype_id = 13
        try:
            # 오답생성
            bogi = create_wrong.ve_wrong(word)
            paragraph = text.replace(word, '(     )',1)
            return TOPIK1_subtype_id, paragraph, bogi, word
        except :
            print(word)
            print('동사 부분 에러')
            pass
    
    # 34~39, 53~54
    # 일반 부사 빈칸 문제 생성
    def mag(text,word):
        # 일반부사(komoran : MAG)
        TOPIK1_subtype_id = 14
        try:
            # 오답생성
            bogi = create_wrong.m_wrong(word)
            paragraph = text.replace(word, '(     )',1)                 # text에서 일반부사 하나를 빈칸으로 만들어 지문 생성
            return TOPIK1_subtype_id, paragraph, bogi, word               
        except:
            print(word)
            print('일반부사 부분 에러')
            pass
    
    # 34~39
    # '다'로 끝나지 않는 동사/형용사 빈칸 문제 생성
    def vv_ec(text,word):
        # 동사 + 연결어미(komoran : VV + EC)
        TOPIK1_subtype_id = 15
        try:

            # 오답생성
            bogi = create_wrong.ve_wrong(word)
            paragraph = text.replace(word, '(     )',1)                 # text에서 일반부사 하나를 빈칸으로 만들어 지문 생성
            return TOPIK1_subtype_id, paragraph, bogi, word
        except:
            print(word)
            print('동사 어미 에러')
            pass
        
        
    # input text에 대한 모든 빈칸 문제 생성    
    def create_all(text):
        list_=[]
        word_list = []
        pos_tag_okt = TOPIK1_blank_basic.okt.pos(text)
        pos_tag_kom = TOPIK1_blank_basic.kom.pos(text)
        
        for word,tag in pos_tag_okt:
            word_list.append(word)
        
        for word,tag in pos_tag_kom:
            if tag == 'NNG':
                try:
                    list_.append(TOPIK1_blank_basic.noun(text,word))
                except:
                    pass
            elif tag == 'MAG':
                try:
                    list_.append(TOPIK1_blank_basic.mag(text,word))
                except:
                    pass
                
        for word,tag in pos_tag_okt:
            if word[-1] == '다' and (tag == 'Verb' or tag == 'Adjective'):
                try:
                    list_.append(TOPIK1_blank_basic.verb(text,word))
                except:
                    pass
            elif tag[0] == 'V' and word[-1] != '다':
                try:
                    list_.append(TOPIK1_blank_basic.vv_ec(text,word))
                except:
                    pass
            elif tag == 'Josa':
                try:
                    list_.append(TOPIK1_blank_basic.josa(text,word, word_list))
                except:
                    pass
            else:
                pass    
        return list_
    
# txt = '운동을 많이 합니다. 그래서 건강합니다.'

# a = TOPIK1_blank_basic.create_all(txt)
# for aa in a:    
#     print(aa,'\n')
        