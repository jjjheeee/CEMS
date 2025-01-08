package com.cems.application.vo;

import lombok.Data;

@Data
public class StatisticsDto {
	String TOPIK1_question_subtype;
	int correctRatio;
	int total_cnt;
	int user_cnt;
}
