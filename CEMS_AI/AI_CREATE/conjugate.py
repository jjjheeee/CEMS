# conjugate.py
import numpy as np
from soynlp.hangle import compose, decompose

# conjugate function
class conjugate:    
    # def __init__(self,stem,ending):
    #     self.stem = stem
    #     self.ending = ending
    
    def changeSent(sentence, word, list_):        
        replist_list =[]
        replist_list.append(sentence.replace(word,np.random.choice(list_,1,False)[0]))
        sent = replist_list[0]
        for i in list_:
            if i in sent:
                choice_word = i
                list_.remove(i)
        for i in list_:
            replist_list.append(sent.replace(choice_word,i))
    
        return replist_list
    
    # def changeSent(sentence, list_):        
    #     replist_list =[sentence]
        
    #     for i in list_:
    #         if i in sentence:
    #             choice_word = i
    #             list_.remove(i)
    #     for i in list_[:5]:
    #         replist_list.append(sentence.replace(choice_word,i))
    
    #     return replist_list
        
    def conjugate(stem, ending):

        assert ending # ending must be inserted

        l_len = len(stem)
        l_last = decompose(stem[-1])
        l_last_ = stem[-1]
        r_first = decompose(ending[0])
        r_first_ = compose(r_first[0], r_first[1], ' ') if r_first[1] != ' ' else ending[0]
        # print('l_last : ',l_last)
        # print('l_last_: ',l_last_)
        # print('r_first : ', r_first)
        # print('r_first_ : ', r_first_)

        candidates = set()
        
        # types of conjugation
        # ㄷ 불규칙 활용
        '''
        깨닫 + 아 -> 깨달아
        묻 + 었다 -> 물었다
        '''
        if l_last[2] == 'ㄷ' and r_first[0] == 'ㅇ':
            l = stem[:-1] + compose(l_last[0], l_last[1], 'ㄹ')
            candidates.add(l + ending)
            
        # 르 불규칙 활용
        '''
        구르 + 어 -> 굴러
        들르 + 었다 -> 들렀다
        '''
        if (l_last_ == '르') and (r_first_ == '아' or r_first_ == '어') and l_len >= 2:
            c0, c1, c2 = decompose(stem[-2])
            l = stem[:-2] + compose(c0, c1, 'ㄹ')
            r = compose('ㄹ', r_first[1], r_first[2]) + ending[1:]
            candidates.add(l + r)
            
        # ㅂ 불규칙 활용
        '''
        더럽 + 어 -> 더러워
        곱 + 아 -> 고와
        '''
        if (l_last[2] == 'ㅂ') and (r_first_ == '어' or r_first_ == '아'):
            l = stem[:-1] + compose(l_last[0], l_last[1], ' ')
            if l_len >= 2 and (l_last_ == '답' or l_last_ == '곱' or l_last_ == '깝' or l_last_ == '롭'):
                c1 = 'ㅝ'
            elif r_first[1] == 'ㅗ':
                c1 = 'ㅘ'
            elif r_first[1] == 'ㅜ':
                c1 = 'ㅝ'
            elif r_first_ == '어':
                c1 = 'ㅝ'
            else: # r_first_ == '아'
                c1 = 'ㅘ'
            r = compose('ㅇ', c1, r_first[2]) + ending[1:]
            candidates.add(l + r)
            
        # 어미의 첫 글자가 종성인 경우 (-ㄴ, -ㄹ, -ㅂ, -ㅆ)
        '''
        이 + ㅂ니다 -> 입니다
        하 + ㅂ니다 -> 합니다
        '''
        if l_last[2] == ' ' and r_first[1] == ' ' and (r_first[0] == 'ㄴ' or r_first[0] == 'ㄹ' or r_first[0] == 'ㅂ' or r_first[0] == 'ㅆ'):
            l = stem[:-1] + compose(l_last[0], l_last[1], r_first[0])
            r = ending[1:]
            candidates.add(l + r)
            
        # ㅅ 불규칙 활용
        '''
        낫 + 아 -> 나아
        긋 + 어 -> 그어
        선긋 + 어 -> 선그어
        벗 + 어 -> 벗어
        옷벗 + 어 -> 옷벗어
        '''
        if (l_last[2] == 'ㅅ') and (r_first[0] == 'ㅇ'):
            if stem[-1] == '벗':
                l = stem
            else:
                l = stem[:-1] + compose(l_last[0], l_last[1], ' ')
            candidates.add(l + ending)
            
        # 우 불규칙 활용
        '''
        푸 + 어갔어 -> 퍼갔어
        주 + 어 -> 줘
        주 + 었어 -> 줬어
        '''
        if l_last[1] == 'ㅜ' and l_last[2] == ' ' and r_first[0] == 'ㅇ' and r_first[1] == 'ㅓ':
            if l_last_ == '푸':
                l = '퍼'
            else:
                l = stem[:-1] + compose(l_last[0], 'ㅝ', r_first[2])
            r = ending[1:]
            candidates.add(l + r)
            
        # 오 불규칙 활용
        '''
        오 + 았어 -> 왔어
        '''
        if l_last[1] == 'ㅗ' and l_last[2] == ' ' and r_first[0] == 'ㅇ' and (r_first[1] == 'ㅏ' or r_first[1] == 'ㅓ'):
            l = stem[:-1] + compose(l_last[0], 'ㅘ', r_first[2])
            r = ending[1:]
            candidates.add(l + r)
            
        # ㅡ 탈락 불규칙 활용
        '''
        끄 + 었다 -> 껐다
        트 + 었어 -> 텄어
        '''
        if (l_last_ == '끄' or l_last_ == '크' or l_last_ == '트') and (r_first[0] == 'ㅇ') and (r_first[1] == 'ㅓ'):
            l = stem[:-1] + compose(l_last[0], r_first[1], r_first[2])
            r = ending[1:]
            candidates.add(l + r)
            
        # 거라, 너라 불규칙 활용
        '''
        가 + 아라 -> 가거라
        오 + 어라 -> 오너라 
        '''
        if ending[:2] == '어라' or ending[:2] == '아라':
            if l_last[1] == 'ㅏ':            
                r = '거' + ending[1:]
            elif l_last[1] == 'ㅗ':
                r = '너' + ending[1:]
            else:
                r = ending
            candidates.add(stem + r)
            
        # 러 불규칙 활용
        '''
        이르 + 어 -> 이르러
        푸르 + 어 -> 푸르러
        '''
        if l_last_ == '르' and r_first[0] == 'ㅇ' and r_first[1] == 'ㅓ':
            r = compose('ㄹ', r_first[1], r_first[2]) + ending[1:]
            candidates.add(stem + r)
            
        # 여 불규칙 활용
        '''
        아니하 + 았다 -> 아니하였다
        영원하 + 아 -> 영원하여
        '''
        if l_last_ == '하' and r_first[0] == 'ㅇ' and (r_first[1] == 'ㅏ' or r_first[1] == 'ㅓ'):
        # case 1
            r = compose(r_first[0], 'ㅕ', r_first[2]) + ending[1:]
            candidates.add(stem + r)
            # case 2
            l = stem[:-1] + compose('ㅎ', 'ㅐ', r_first[2])
            r = ending[1:]
            candidates.add(l + r)
            
        # ㅎ 불규칙 활용
        # 1. ㅎ 탈락
        '''
        파랗 + 면 -> 파라면
        동그랗 + ㄴ -> 동그란
        '''
        if l_last[2] == 'ㅎ' and (l_last_ != '좋' and l_last_ != '렇') and not (r_first[1] == 'ㅏ' or r_first[1] == 'ㅓ'):
            if r_first[1] == ' ':
                l = l = stem[:-1] + compose(l_last[0], l_last[1], r_first[0])
            else:
                l = stem[:-1] + compose(l_last[0], l_last[1], ' ')
            if r_first_ == '으':
                r = ending[1:]
            elif r_first[1] == ' ':            
                r = ''
            else:
                r = ending
            candidates.add(l + r)
    
        # 2. ‘ㅎ’ + ‘ㅏ/ㅓ’ -> ‘ㅐ/ㅔ’
        '''
        파랗 + 았다 -> 파랬다
        그렇 + 아 -> 그래
        시퍼렇 + 었다 -> 시퍼렜다
        '''
        if l_last[2] == 'ㅎ' and l_last_ != '좋' and (r_first[1] == 'ㅏ' or r_first[1] == 'ㅓ'):
            l = stem[:-1] + compose(l_last[0], 'ㅐ' if r_first[1] == 'ㅏ' else 'ㅔ', r_first[2])
            r = ending[1:]
            candidates.add(l + r)
            
        # ‘ㅎ + 네’ 불규칙
        '''
        그렇 + 네 -> 그렇네 / 그러네
        노랗 + 네요 -> 노랗네요 / 노라네요
        '''
        if l_last[2] == 'ㅎ' and r_first[0] == 'ㄴ' and r_first[1] != ' ':
            candidates.add(stem + ending) 
              
        # 만든놈
        '''
        어미의 구분
        1. 어미의 '았' 과 '었' 구분 => ~~었습니다
        가 + 았습니다 => 갔습니다
        가 + 었습니다 => 갔었습니다.
        '''
        if l_last[0] != 'ㅎ' and l_last[-1] == ' ' and (l_last[1] != 'ㅡ' and l_last[1] != 'ㅣ' and l_last[1] != 'ㅗ' and l_last[1] != 'ㅜ') and r_first[-1]=='ㅆ':
            if r_first_=='아':  # 았 일때
                l = stem[:-1] + compose(l_last[0],l_last[1],r_first[-1])
                r = ending[1:]
                candidates.add(l+r)
            elif r_first_=='어': # 었 일때
                l = stem[:-1] + compose(l_last[0],l_last[1],r_first[-1])
                r = ending
                candidates.add(l+r)
        
        '''
        2. 종성 'ㅣ' + 았/었
        ~ ㅣ + 었/았 + 습니다(이루어지었습니다 )
        => 이루어졌습니다
        '''
        if l_last[1] == 'ㅣ' and r_first[-1]=='ㅆ' and (r_first_=='어' or r_first_=='아'):
            l = stem[:-1] + compose(l_last[0],'ㅕ',r_first[-1])
            r = ending[1:]
            candidates.add(l+r)
        
        '''
        어미 '습니다' 의 변환
        힘들 + 습니다 => 힘듭니다
        서툴 + 습니다 => 서툽니다 
        '''
        if r_first_=='스' and l_last[-1]!= 'ㅎ':
            l = stem[:-1]+compose(l_last[0], l_last[1], r_first[-1])
            r = ending[1:]
            candidates.add(l+r)
        
        '''
        어미 '으'의 탈락
        ~ + 으면 => 받침있으면: ~으면, 없거나 'ㄹ' 받침: ~면
        '''
        if r_first_ == '으' and (l_last[-1] == ' ' or l_last[-1] == 'ㄹ'):
            l = stem
            r = ending[1:]
            candidates.add(l+r)
        
        '''
        ㅣ+ 어 => ㅕ : 기웃거리어 -> 기웃거려, 망설이어 -> 망설여
        '''
        if l_last[-1] == ' ' and (r_first_=='어' or r_first_=='아'):
            if l_last[1] == 'ㅣ':
                l = stem[:-1]
                r = compose(l_last[0],'ㅕ',r_first[-1])+ending[1:]
                candidates.add(l+r)
            elif len(ending) == 1 and l_last[1] !='ㅗ':
                l = stem
                r = ending[1:]
                candidates.add(l+r)
            
        '''
        종성 하나만 어미로 들어오는 경우
        만들 + ㄴ, 만날 + ㄴ => 만든, 만난
        '''
        if len(ending) == 1 and r_first_ == 'ㄴ':
            l = stem[:-1] + compose(l_last[0],l_last[1],r_first_[0])
            candidates.add(l)
            
        # 규칙 활용
        if not candidates and r_first[1] != ' ':
            candidates.add(stem + ending)
        return candidates
        