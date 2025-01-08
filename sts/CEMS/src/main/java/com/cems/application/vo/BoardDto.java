package com.cems.application.vo;

import java.io.Serializable;

import lombok.Data;

@Data
public class BoardDto implements Serializable{
	int board_id;
	String writer;
	String title;
	String content;
	String write_date;
	String admin;
	String bookmark;
	int viewcnt;
	String user_id;
	String user_ban;
}
