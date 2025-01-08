package com.cems.application.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class RecommentDto {
    int comment_id;
    int recomment_id;
    String content;
    Date write_date;
    String writer;
    int heart;
    String user_id;
    String user_ban;
}
