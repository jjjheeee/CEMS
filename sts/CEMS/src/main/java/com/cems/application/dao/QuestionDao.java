package com.cems.application.dao;

import java.sql.Time;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.cems.application.vo.MockboardDto;
import com.cems.application.vo.QuestionDto;
import com.cems.application.vo.ResultDto;


@Component
@Repository
public class QuestionDao {

    @Autowired 
    private SqlSessionTemplate mybatis;
    
    public List<QuestionDto> getQuestion(String user_id){
    	int cnt = mybatis.update("com.cems.application.mybatis.QuestionRepository.questionUsedUpdate");
    	List<QuestionDto> queslist = mybatis.selectList("com.cems.application.mybatis.QuestionRepository.list", user_id);
    	for(QuestionDto dto : queslist) {
    		String wrong = dto.getQuestion_wrong() ;
    		String answer = dto.getQuestion_answer();
    		String[] arr = wrong.split("/");
    		List<String> list = Arrays.asList(arr);
    		Collections.shuffle(Arrays.asList(list));
    		List<String> temp = new ArrayList<String>();
    		temp.add(list.get(0));
    		temp.add(list.get(1));
    		temp.add(list.get(2));
    		temp.add(answer);
    		Collections.shuffle(temp);
    		dto.setQuestion_wrong(temp.get(0)+"/"+temp.get(1)+"/"+temp.get(2)+"/"+temp.get(3));
    	}
    	
    	return queslist;
    	
    }
	
 // Mock Board
	
 	public List<MockboardDto> getAllMockboard(){
 		return mybatis.selectList("com.cems.application.mybatis.BoardRepository.getAllMockboard");
 		
 	}
 	
 	public MockboardDto getMockboard(int mockboard_id){
 		return mybatis.selectOne("com.cems.application.mybatis.BoardRepository.getMockboard", mockboard_id);
 	}
	
 	
// 	result
 	public int insertResult(List<ResultDto> resultList) {
 		System.out.println("insertResult Dao");
 		int cnt = 0;
        for(ResultDto dto : resultList) {
        	String userchoice = dto.getChoice();
        	String answer = dto.getAnswer();
        	if(userchoice == null) {
    			dto.setCorrect_results("0");
        	}else {
        		if(userchoice.equals(answer)) {
        			dto.setCorrect_results("1");
        		}else {
        			dto.setCorrect_results("0");
        		}
        	}
        	int temp = mybatis.insert("com.cems.application.mybatis.QuestionRepository.insertResult", dto);
        	cnt = cnt + temp;
        }
        return cnt;
 	}
 	
 	public Map<String, String> showResult(String user_id, int insertcnt) {
 		
 		Map<String, Object> insertinfo = new HashMap<>();
 		insertinfo.put("user_id", user_id);
 		insertinfo.put("insertcnt",insertcnt);
 		
 		List<ResultDto> resultList = mybatis.selectList("com.cems.application.mybatis.QuestionRepository.showResult", insertinfo);
 		Map<String, String> result = new HashMap<>();
 		
 		int questionCnt = resultList.size();
 		int timeCnt = 0;
 		int correctCnt = 0;
 		int wrongCnt = 0;
 		for(ResultDto dto : resultList) {
 			timeCnt = timeCnt + dto.getUser_question_time();
 			
 			if(dto.getCorrect_results().equals("0")) {
 				wrongCnt = wrongCnt + 1;
 			}else {
 				correctCnt = correctCnt + 1;
 			}
 		}
// 		System.out.println(""+timeCnt);
 		result.put("questionCnt", String.valueOf(questionCnt));
 		result.put("timeCnt", String.valueOf(timeCnt));
 		result.put("correctCnt", String.valueOf(correctCnt));
 		result.put("wrongCnt", String.valueOf(wrongCnt));
 		
 		System.out.print(result);
 		
 		return result;
 				
 	}

	public List<QuestionDto> getListeningQuestion(String user_id) {
		return mybatis.selectList("com.cems.application.mybatis.QuestionRepository.listenQuestion",user_id);
	}
 	
}
