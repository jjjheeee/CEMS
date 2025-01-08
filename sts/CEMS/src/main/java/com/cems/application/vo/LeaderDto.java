package com.cems.application.vo;

import lombok.Data;

@Data
public class LeaderDto {
	String user_name;
	String user_nickname;
	String user_id;
	String user_country;
	int question_cnt;
	int ranking;
}
