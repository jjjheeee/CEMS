package com.cems.application.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.Data;

@Data
public class UserDto implements Serializable{
//	Talble user_info's col
	String user_id; // Email, PK
	String user_ban;
	String user_password; // password, not null
	String user_name; // real name, not null
	String user_nickname; // nickname, not null, unique
	String user_country; // country, not null
	Date user_in_date;	
	int day;
	int user_cnt;
	String newpw; // for change user_password
	String newid; // for change user_id
	int admin; // labeling admin or not
	int user_type; // user Topik course
}
