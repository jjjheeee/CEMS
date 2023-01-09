### word_embedding.py
'''
    문장으로 이루어진 데이터 프레임을 토큰화하고 
    모델을 만들기 위한 전 처리 과정입니다.
'''
import pandas as pd
import re
from tqdm import tqdm
from konlpy.tag import Okt,Komoran

import warnings
warnings.filterwarnings('ignore')

class embedding_word:
    
    kom = Komoran()
    okt = Okt()

    # 위에서 스플릿한 문장을 한 문장 단위로 리스트화 해준다
    def spolt_list(x):
        if type(x) == str:
            list_ = []
            list_.append(x)
            return list_
        else:
            return list(str(x))
    
    # 한개 로우안에 여러개의 문장으로 이루어진 글이있다
    # . 를 기준으로 한 문장 단위로 나눠 준다
    # 문장 데이터 셋을 파라미터로 받는다(col => 토큰화 할 문장 컬럼)
    def split_df(df,col):
        # 데이터에 있는 nan값을 제거 해준다
        df.dropna(axis=0,inplace=True)
        df.reset_index(drop=True,inplace=True)
        
        # 데이터를 한문장 단위로 split 해준다.        
        sen_list = []
        for i in tqdm(df.index):
            a = df[col][i].split('.')
            for j in range(len(a)):
                sen_list.append(a[j])
        list_ = list(map(embedding_word.spolt_list, sen_list))
        
        # 한 문장 단위로 리스트화 한 문장을 프레임으로 만들어 준다 (csv 파일로 저장)
        col = ['sentence']
        sentence_df = pd.DataFrame(list_,columns=col)
        return sentence_df
    
    # 데이터 전처리 함수 
    def preprosessing(df):
        
        # df['sentence'] => 한글,숫자 이외의 문자 제거 -> 문자 공백 등등
        for i in tqdm(df.index):
            df['sentence'][i] = re.sub('[^\dㄱ-ㅎㅏ-ㅣ가-힣 ]','',df['sentence'][i])
            df.dropna(axis=0,inplace=True)

        # 공백 제거
        for i in tqdm(df.index):
            df['sentence'][i] = re.sub(r"^\s+", "", df['sentence'][i])
        # 한글 제외 모든 문자 제거, 공백제거로인해 빈값이 들어가있는 로우를 지워 준다
        # nan값 아님 
        idx = df[df['sentence']== ''].index
        df.drop(idx,axis=0,inplace=True)
        df = df.reset_index(drop=True)
        
        # 중복된 문장 제거
        df.drop_duplicates(keep='first',inplace=True)
        df = df.reset_index(drop=True)
        
        # '어','응','네','아니요'와 같은 짧은 문장 삭제
        for i in tqdm(df.index) : 
            if len(df['sentence'][i]) <= 5:
                df.drop(index=i,axis=0,inplace=True)
        df = df.reset_index(drop=True)
        
        stop_list = ['어','음','아','은','는','이','가','에','양','그','응','야','어어','년']
        list_ = [] 
        for i in tqdm(df.index):
            split_ = df['sentence'][i].split(' ')
            split_stop = [word for word in split_ if not word in stop_list]
            list_.append(split_stop)
            
        data_list = []
        for i in range(len(list_)):
            a = []
            join_list = ' '.join(list_[i])
            a.append(join_list)
            data_list.append(a)
        
        # 한 문장 단위로 리스트화 한 문장을 프레임으로 만들어 준다 (csv 파일로 저장)
        col = ['sentence']
        all_data = pd.DataFrame(data_list,columns=col)
        all_data
        return all_data 
    
    # okt tokenizer 함수
    def tokenizer_okt(df):
        okt = embedding_word.okt
        token_list_okt = []
        for sentence in tqdm(df['sentence']):
            try:
                tokenized_sentence = okt.morphs(sentence, norm=True)
                token_list_okt.append(tokenized_sentence)
            except(Exception) as e:
                print(e)
                pass
        return token_list_okt
    
    # komoran tokenizer 함수
    def tokenizer_kom(df):
        kom = embedding_word.kom
        token_list_kom = []
        for sentence in tqdm(df['sentence']):
            try:
                tokenized_sentence = kom.morphs(sentence)
                token_list_kom.append(tokenized_sentence)
            except(Exception) as e :
                print(e)
                pass
        return token_list_kom
    
    # most_similar 추출 함수
    def most_similar(model, word, topn):
        word_list = model.wv.most_similar(word, topn = topn)
        return word_list
    
    # model save 함수    
    def save_model(model,save_name):
        model.save(save_name)