package com.cems.application.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.cems.application.controller.CEMSController;
import com.cems.application.exception.IDNullException;
import com.cems.application.exception.PWNullException;
import com.cems.application.vo.UserDto;

@Component
@Repository
public class CEMSdao{
    @Autowired 
    private SqlSessionTemplate mybatis;
    
    
//	로그인 기    
	public UserDto login(UserDto userDto) throws IDNullException, PWNullException{
		if (userDto.getUser_id() == ""){
			throw new IDNullException("Null Pointer Exception : Userid");
		}
		
		else if (userDto.getUser_password() == "") {
			throw new PWNullException("Null Pointer Exception : Userpw");
		}
		
		return mybatis.selectOne("com.cems.application.mybatis.UserRepository.login", userDto);
	}

//	회원가입 기능
	public int signup(UserDto userDto) {
		return mybatis.insert("com.cems.application.mybatis.UserRepository.userInsert", userDto);
	}
	
//	회원가입 시 ID 중복 체크
	public int idCheck(String userid) {
		return mybatis.selectOne("com.cems.application.mybatis.UserRepository.idCheck", userid);
	}
	
	
//	회원 탈퇴시 PW 체크
	public int pwCheck(String userpw) {
		return mybatis.selectOne("com.cems.application.mybatis.UserRepository.pwCheck",userpw);
	}
	
	
// 회원 탈퇴
	public int deleteUser(String userid) {
		return mybatis.delete("com.cems.application.mybatis.UserRepository.userDelete", userid);
	}

//	회원 정보 변경
	public int editUser(String option, UserDto userDto) {
		int cnt = mybatis.update("com.cems.application.mybatis.UserRepository."+option, userDto);
		return cnt;
	}
	
// 	닉네임 변경 중복 체
	public int nicknameCheck(String user_nickname) {
		int cnt = mybatis.selectOne("com.cems.application.mybatis.UserRepository.nicknameCheck", user_nickname);
		return cnt;
	} 
		
}
