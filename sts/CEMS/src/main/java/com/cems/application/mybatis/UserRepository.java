package com.cems.application.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.cems.application.vo.UserDto;


@Mapper
@Repository
public interface UserRepository {
	List<UserDto> getAllMember();
	List<UserDto> login();
	int userInsert();
	int idCheck(String id);
	int pwCheck(String pw);
	int userCnt();
	int userDelete();
	int updatepw(UserDto dto);
	int updateid();
	int updateall(UserDto dto);
	int nicknameCheck(String user_nickname);
}
