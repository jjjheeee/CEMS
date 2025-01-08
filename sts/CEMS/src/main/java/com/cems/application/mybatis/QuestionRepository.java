package com.cems.application.mybatis;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.cems.application.vo.QuestionDto;

@Mapper
@Repository
public interface QuestionRepository {
	List<QuestionDto> list(String user_id); 
	int insertResult(QuestionDto dto);
	int questionUsedUpdate();
	List<QuestionDto> showResult(String user_id);
	List<QuestionDto> listenQuestion();
	
}
