package com.cems.application.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class MockboardDto {
	int mockboard_id;
	String title;
	Date write_date;
	String content;
	int viewcnt;
	String course;
	String coursenm;
}
