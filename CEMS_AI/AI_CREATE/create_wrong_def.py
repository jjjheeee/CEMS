### create_wrong_def.py

from gensim.models import Word2Vec,FastText
from konlpy.tag  import Komoran
import numpy as np
from conjugate import conjugate
import warnings 
warnings.filterwarnings('ignore')

# 오답 생성기
class create_wrong:
    
    model_ft = FastText.load('C:/big15/project/member/KIM/CEMS_AI/Best_Model/kom_ft_ne_sum_best.model')
    # model_wd = Word2Vec.load('C:/big15/project/member/KIM/CEMS_AI/Best_Model/kom_wd_ne_sum.model')
    kom = Komoran()
    
    # 명사 오답 생성
    def n_wrong(sentence):
        wrong_list = []   # 오답을 담을 리스트
        token_tag = create_wrong.kom.pos(sentence) # 정답 단어에 대한 형태소 분석
        total_int = len(token_tag)
        real_word = token_tag[0][0] # 정답이 될 단어
        tag = token_tag[0][1]  # 품사(정답의 품사)
        word_list = create_wrong.model_ft.wv.most_similar(real_word,topn=30000)
        
        # 명사에 대한 오답 생성 
        if total_int == 1: 
            if len(tag) == 2:
                for i in range(len(word_list)):
                    if len(real_word)==len(word_list[i][0]): # 리스트중 선택된 명사와 같은 글자수
                        if create_wrong.kom.pos(word_list[i][0])[0][1] == 'NNG': # 리스트중 선택된 명사와 같은 품사
                            wrong_list.append(word_list[i][0])
            elif len(tag) ==3:  # 명사이지만 고유명사가 아닌 놈만 추출
                for i in range(len(word_list)):
                    if len(real_word)==len(word_list[i][0]):
                        if create_wrong.kom.pos(word_list[i][0])[0][1] == 'NNG':
                            wrong_list.append(word_list[i][0])
            bogi = np.array([])
            bogi = np.random.choice(wrong_list[:20],6,False)
            return bogi
        
        # 명사에 다른 품사가 붙은 한 단어 => 명사는,명사에 등등
        elif total_int == 2:   
            real_word = real_word           # 선택된 명사
            plus_word = token_tag[1][0]     # 뒤에 붙은 놈
            if len(tag) == 2:
                for i in range(len(word_list)):
                    if len(real_word)==len(word_list[i][0]): # 리스트중 선택된 명사와 같은 글자수
                        if create_wrong.kom.pos(word_list[i][0])[0][1] == 'NNG': # 리스트중 선택된 명사와 같은 품사
                            wrong = word_list[i][0]
                            wrong_list.append(list(conjugate.conjugate(wrong,plus_word))[0])
            elif len(tag) ==3:  # 명사이지만 고유명사가 아닌 놈만 추출
                for i in range(len(word_list)):
                    if len(real_word)==len(word_list[i][0]):
                        if create_wrong.kom.pos(word_list[i][0])[0][1] == 'NNG':
                            wrong = word_list[i][0]
                            wrong_list.append(wrong+plus_word)
            bogi = np.array([])
            bogi = np.random.choice(wrong_list[:20],6,False)
            return bogi
        
        # 명사에 한개 이상의 품사가 붙음 -> 명사입니다 -> 명사 + 이 + ㅂ니다
        else:
            real_word = real_word
            plus_word = list(conjugate.conjugate(token_tag[1][0],token_tag[2][0]))[0]
            if len(tag) == 2:
                for i in range(len(word_list)):
                    if len(real_word)==len(word_list[i][0]): # 리스트중 선택된 명사와 같은 글자수
                        if create_wrong.kom.pos(word_list[i][0])[0][1] == 'NNG': # 리스트중 선택된 명사와 같은 품사
                            wrong = word_list[i][0]
                            wrong_list.append(wrong+plus_word)
            elif len(tag) ==3:  # 명사이지만 고유명사가 아닌 놈만 추출
                for i in range(len(word_list)):
                    if len(real_word)==len(word_list[i][0]):
                        if create_wrong.kom.pos(word_list[i][0])[0][1] == 'NNG':
                            wrong = word_list[i][0]
                            wrong_list.append(wrong+plus_word)
            bogi = np.array([])
            bogi = np.random.choice(wrong_list[:20],6,False)
            return bogi
        
    # 조사에 대한 오답 생성
    def j_wrong(sentence):
        wrong_list = []   # 오답을 담을 리스트
        token_tag = create_wrong.kom.pos(sentence) # 정답 단어에 대한 형태소 분석
        total_int = len(token_tag)
        
        set_josa = ['은','는','이','가','을']
        # 조사 오답생성
        if total_int == 1: 
            real_word = token_tag[0][0] # 정답이 될 단어
            word_list = create_wrong.model_ft.wv.most_similar(real_word,topn=30000)
            stop_list = ['ㄴ','ㄹ','ㅁ','아아','ㄹ루','ㄹ랑','ㄴ커녕','은커녕','는커녕','는군요','야말로','커녕','으루','으로부터','으로서','으로써','에서부터']  
            for i in range(len(word_list)):
                if (create_wrong.kom.pos(word_list[i][0])[0][1][0] == 'J'): # 조사품사를 가진 놈만 고른다
                    if word_list[i][0] not in stop_list:
                        wrong_list.append(word_list[i][0])
            bogi = np.array([])
            bogi = np.append(bogi,set_josa)
            bogi = np.random.choice(wrong_list[:20],6,False)
            return bogi
          
        # 다른 품사와 같이 들어온 조사 -> 다른 품사 + 조사
        else:
            plus_word = token_tag[0][0] # 조사 앞에 붙은 단어
            real_word = token_tag[1][0] # 선택된 조사
            word_list = create_wrong.model_ft.wv.most_similar(real_word,topn=30000)
            stop_list = ['ㄴ','ㄹ','ㅁ','아아','ㄹ루','ㄹ랑','ㄴ커녕','은커녕','는커녕','는군요','야말로','커녕','으루','으로부터','으로서','으로써','에서부터']
            for i in range(len(word_list)):
                if create_wrong.kom.pos(word_list[i][0])[0][1][0] == 'J': # 조사품사를 가진 놈만 고른다
                    wrong = word_list[i][0]
                    if wrong not in stop_list:
                        wrong_list.append(plus_word+wrong)
            bogi = np.array([])
            bogi = np.append(bogi,set_josa)
            bogi = np.random.choice(wrong_list[:20],6,False)
            return bogi
            
    # 부사 오답 생성
    def m_wrong(sentence):
        wrong_list = []   # 오답을 담을 리스트
        token_tag = create_wrong.kom.pos(sentence) # 정답 단어에 대한 형태소 분석
        real_word = token_tag[0][0] # 정답이 될 단어
        tag = token_tag[0][1]  # 품사(정답의 품사)
        stop_list = ['짱','영','펑', '땡', '죽', '싹']
        word_list = create_wrong.model_ft.wv.most_similar(real_word,topn=30000)
        if len(tag) == 2:       # 관형사
            for i in range(len(word_list)):
                if len(real_word)==len(word_list[i][0]) and word_list[i][0] not in stop_list :            # 정답과 같은 글자 수
                    if create_wrong.kom.pos(word_list[i][0])[0][1] == tag: # 정답과 같은 품사
                        wrong_list.append(word_list[i][0])
                            
        else:  # 부사에서 '즉'과 같은 한글자 부사는 보기 리스트가 채워지지 않기 때문에 글자수 제한을 풀어줬다
            if tag[-1] == 'G':      # 일반 부사
                for i in range(len(word_list)):
                    if len(real_word)==len(word_list[i][0]) and word_list[i][0] not in stop_list :           # 정답과 같은 글자 수
                        if create_wrong.kom.pos(word_list[i][0])[0][1] == tag: # 정답과 같은 품사
                            wrong_list.append(word_list[i][0])
            elif tag[-1] =='J':     # 접속 부사
                for i in range(len(word_list)):
                    if len(real_word)==len(word_list[i][0]) and word_list[i][0] not in stop_list :          # 정답과 같은 글자 수
                        if create_wrong.kom.pos(word_list[i][0])[0][1] == tag: # 정답과 같은 품사
                            wrong_list.append(word_list[i][0])
        bogi = np.array([])
        bogi = np.random.choice(wrong_list[:20],6,False)
        return bogi
    
    # 동사 | 형용사 + (어미) 오답 생성
    def ve_wrong(sentence):
        wrong_list = []   # 오답을 담을 리스트
        token_tag = create_wrong.kom.pos(sentence) # 정답 단어에 대한 형태소 분석
        total_int = len(token_tag)
        stop_list = ['는','안','들','쌀','다는','더라고','았','았었','겠','우', '이']
        if total_int == 2:
            real_word = token_tag[0][0] # 정답이 될 단어
            tag = token_tag[0][1]       # 품사(정답의 품사)
            plus_word = token_tag[1][0] # 뒤에 붙은 어미
            sum_word = list(conjugate.conjugate(real_word,plus_word))[0]
            word_list = create_wrong.model_ft.wv.most_similar(real_word,topn=30000)
            if tag == 'VA':
                for i in range(len(word_list)):
                    wrong = word_list[i][0]
                    if create_wrong.kom.pos(wrong)[0][1] == 'VA':
                        set_wrong = create_wrong.kom.pos(wrong)[0][0]
                        if set_wrong not in stop_list:
                            try:
                                if len(list(conjugate.conjugate(set_wrong,plus_word))[0]) > 2:
                                    wrong_list.append(list(conjugate.conjugate(set_wrong,plus_word))[0])
                            except(IndexError) as e:
                                continue
            elif tag == 'VV':
                for i in range(len(word_list)):
                    wrong = word_list[i][0]
                    if create_wrong.kom.pos(wrong)[0][1] == 'VV':
                        set_wrong = create_wrong.kom.pos(wrong)[0][0]
                        if set_wrong not in stop_list:
                            try:
                                if len(list(conjugate.conjugate(set_wrong,plus_word))[0]) > 2:
                                    wrong_list.append(list(conjugate.conjugate(set_wrong,plus_word))[0])
                            except(IndexError) as e:
                                continue              
            bogi = np.array([])
            bogi = np.random.choice(wrong_list[:20],6,False)
            return bogi
        else:
            tag = token_tag[0][1]       # 품사(정답의 품사)
            real_word = token_tag[0][0] # 선택될 될 단어
            sub_wrod = token_tag[1][0]  # 선어말 어미
            plus_word = token_tag[2][0]
            if plus_word[0] == '습':
                sum_word = sub_wrod+plus_word
            else:
                sum_word = list(conjugate.conjugate(sub_wrod,plus_word))[0]
            word_list = create_wrong.model_ft.wv.most_similar(real_word,topn=30000)  # 정답 단어의 most_similar
            if tag == 'VA':
                for i in range(len(word_list)):
                    wrong = word_list[i][0]
                    if create_wrong.kom.pos(wrong)[0][1] == 'VA':
                        set_wrong = create_wrong.kom.pos(wrong)[0][0]
                        if set_wrong not in stop_list:
                            try:
                                if len(list(conjugate.conjugate(set_wrong,sum_word))[0]) > 2:
                                    wrong_list.append(list(conjugate.conjugate(set_wrong,sum_word))[0])
                            except(IndexError) as e:
                                continue
            elif tag == 'VV':
                for i in range(len(word_list)):
                    wrong = word_list[i][0]
                    if create_wrong.kom.pos(wrong)[0][1] == 'VV':
                        set_wrong = create_wrong.kom.pos(wrong)[0][0]
                        if set_wrong not in stop_list:
                            try:
                                if len(list(conjugate.conjugate(set_wrong,sum_word))[0]) > 2:
                                    wrong_list.append(list(conjugate.conjugate(set_wrong,sum_word))[0])
                            except(IndexError) as e:
                                continue
            else:
                for i in range(len(word_list)):
                    wrong = word_list[i][0]
                    if create_wrong.kom.pos(wrong)[0][1] == 'XR':
                        set_wrong = create_wrong.kom.pos(wrong)[0][0]
                        if set_wrong not in stop_list:
                            try:
                                if len(list(conjugate.conjugate(set_wrong,sum_word))[0]) > 2:
                                    wrong_list.append(list(conjugate.conjugate(set_wrong,sum_word))[0])
                            except(IndexError) as e:
                                continue
            bogi = np.array([])
            bogi = np.random.choice(wrong_list[:20],6,False)
            return bogi
    
    # 여러 단어 오답 생성기(스플릿 기준)
    def r_wrong(sentence):
        split_sen = sentence.split(' ')   # 들어온 단어든 문장이든 ' '로 스플릿(다중 문장 처리를 위함)
        split_num = np.random.choice(len(split_sen),1,False)[0]
        word = split_sen[split_num]  # 스플릿한 문장에서 랜덤 1개 선택(보기에 들어갈 정답)
        token_tag = create_wrong.kom.pos(word) # 정답 단어에 대한 형태소 분석
        num = np.random.choice(len(token_tag),1,False)[0] # 
        tag = token_tag[num][1]  # 선택된 단어의 품사

        if tag[0] == 'N':
            if tag == 'NNB':
                word = split_sen[split_num-1]
                if create_wrong.kom.pos(word)[0][1][0] == 'N':
                    bogi = list(create_wrong.n_wrong(word))
                    bogi = conjugate.changeSent(sentence,word,bogi)
                    np.random.shuffle(bogi)
                    return bogi
                elif create_wrong.kom.pos(word)[0][1][0] == 'V':
                    bogi = list(create_wrong.ve_wrong(word))
                    bogi = conjugate.changeSent(sentence,word,bogi)
                    np.random.shuffle(bogi)
                    return bogi
            else:
                bogi = list(create_wrong.n_wrong(word))
                bogi = conjugate.changeSent(sentence,word,bogi)
                np.random.shuffle(bogi)
                return bogi
        elif tag[0] == 'V':
            bogi = list(create_wrong.ve_wrong(word))
            bogi = conjugate.changeSent(sentence,word,bogi)
            np.random.shuffle(bogi)
            return bogi
        elif tag[0] == 'M':
            bogi = list(create_wrong.m_wrong(word))
            bogi = conjugate.changeSent(sentence,word,bogi)
            np.random.shuffle(bogi)
            return bogi
        elif tag[0] == 'J' :
            bogi = list(create_wrong.n_wrong(word))
            bogi = conjugate.changeSent(sentence,word,bogi)
            np.random.shuffle(bogi)
            return bogi
        
        elif tag[0] == 'E':
            if token_tag[0][1][0] == 'N':       # 어미 앞 단어의 품사의 첫글자
                bogi = list(create_wrong.n_wrong(word))
                bogi = conjugate.changeSent(sentence,word,bogi)
                np.random.shuffle(bogi)
                return bogi 
            elif token_tag[0][1][0] == 'V':
                bogi = list(create_wrong.ve_wrong(word))
                bogi = conjugate.changeSent(sentence,word,bogi)
                np.random.shuffle(bogi)
                return bogi