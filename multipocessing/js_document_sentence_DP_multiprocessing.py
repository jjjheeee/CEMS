from multiprocessing import Pool
import numpy as np
import pandas as pd
import pickle
from tqdm import tqdm

# pickle을 dataframe으로 불러오기
with open("C:/dev/python-dev/AI-dev/workspace/data/corpus/parsing/js_document_sentence.pickle", "rb" ) as file:
    js_document_sentence = pickle.load(file)

# dataframe -> sentence 추출 -> DataFrame
def depth(start, end, js_document_sentence):
    js_document_sentence_DP = pd.DataFrame()
    for i in tqdm(range(start, end, 1)) :
        sen_sentence = pd.json_normalize(js_document_sentence['DP'][i])
        js_document_sentence_DP = pd.concat([js_document_sentence_DP, sen_sentence],ignore_index=True)
    return js_document_sentence_DP

if __name__ == "__main__":
    row_1_start, row_1_end = 0, int(len(js_document_sentence) * 0.0625)
    row_2_start, row_2_end = int(len(js_document_sentence) * 0.0625), int(len(js_document_sentence) * 0.125)
    row_3_start, row_3_end = int(len(js_document_sentence) * 0.125), int(len(js_document_sentence) * 0.1875)
    row_4_start, row_4_end = int(len(js_document_sentence) * 0.1875), int(len(js_document_sentence) * 0.25)
    row_5_start, row_5_end = int(len(js_document_sentence) * 0.25), int(len(js_document_sentence) * 0.3125)
    row_6_start, row_6_end = int(len(js_document_sentence) * 0.3125), int(len(js_document_sentence) * 0.375)
    row_7_start, row_7_end = int(len(js_document_sentence) * 0.375), int(len(js_document_sentence) * 0.4375)
    row_8_start, row_8_end = int(len(js_document_sentence) * 0.4375), int(len(js_document_sentence) * 0.5)
    row_9_start, row_9_end = int(len(js_document_sentence) * 0.5), int(len(js_document_sentence) * 0.5625)
    row_10_start, row_10_end = int(len(js_document_sentence) * 0.5625), int(len(js_document_sentence) * 0.625)
    row_11_start, row_11_end = int(len(js_document_sentence) * 0.625), int(len(js_document_sentence) * 0.6875)
    row_12_start, row_12_end = int(len(js_document_sentence) * 0.6875), int(len(js_document_sentence) * 0.75)
    row_13_start, row_13_end = int(len(js_document_sentence) * 0.75), int(len(js_document_sentence) * 0.8125)
    row_14_start, row_14_end = int(len(js_document_sentence) * 0.8125), int(len(js_document_sentence) * 0.875)
    row_15_start, row_15_end = int(len(js_document_sentence) * 0.875), int(len(js_document_sentence) * 0.9375)
    row_16_start, row_16_end = int(len(js_document_sentence) * 0.9375), int(len(js_document_sentence))
    
    p = Pool(16)
    th1 = p.apply_async(depth, args=(row_1_start, row_1_end, js_document_sentence))
    th2 = p.apply_async(depth, args=(row_2_start, row_2_end, js_document_sentence))
    th3 = p.apply_async(depth, args=(row_3_start, row_3_end, js_document_sentence))
    th4 = p.apply_async(depth, args=(row_4_start, row_4_end, js_document_sentence))
    th5 = p.apply_async(depth, args=(row_5_start, row_5_end, js_document_sentence))
    th6 = p.apply_async(depth, args=(row_6_start, row_6_end, js_document_sentence))
    th7 = p.apply_async(depth, args=(row_7_start, row_7_end, js_document_sentence))
    th8 = p.apply_async(depth, args=(row_8_start, row_8_end, js_document_sentence))
    th9 = p.apply_async(depth, args=(row_9_start, row_9_end, js_document_sentence))
    th10 = p.apply_async(depth, args=(row_10_start, row_10_end, js_document_sentence))
    th11 = p.apply_async(depth, args=(row_11_start, row_11_end, js_document_sentence))
    th12 = p.apply_async(depth, args=(row_12_start, row_12_end, js_document_sentence))
    th13 = p.apply_async(depth, args=(row_13_start, row_13_end, js_document_sentence))
    th14 = p.apply_async(depth, args=(row_14_start, row_14_end, js_document_sentence))
    th15 = p.apply_async(depth, args=(row_15_start, row_15_end, js_document_sentence))
    th16 = p.apply_async(depth, args=(row_16_start, row_16_end, js_document_sentence))
    
    result = th1.get() + th2.get() + th3.get() + th4.get() + th5.get() + th6.get() + th7.get() + th8.get() + th9.get() + th10.get() + th11.get() + th12.get() + th13.get() + th14.get() + th15.get() + th16.get()

    p.close()
    p.join()

    # list를 pickle로 저장
    with open('js_document_sentence_DP.pickle', 'wb') as f:
	    pickle.dump(result, f, protocol=pickle.HIGHEST_PROTOCOL)
    