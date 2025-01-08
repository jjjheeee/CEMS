package com.cems.application.vo;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class ResultDto {
	String user_id;
	String paragraph_id;
	String TOPIK1_type_id;
	String TOPIK1_subtype_id;
	int user_question_time;
	Date TOPIK1_results_date;
	String division_exercise_mock;
	String choice;
	String answer;
	String correct_results;
	
	List<ResultDto> resultList;
}
