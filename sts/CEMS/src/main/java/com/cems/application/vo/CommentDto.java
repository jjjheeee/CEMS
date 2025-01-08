package com.cems.application.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class CommentDto {
	int comment_id;
	String content;
	Date write_date;
	String writer;
	int board_id;
	int comment_depth;
	int heart;
	String user_id;
	String user_ban;
}
