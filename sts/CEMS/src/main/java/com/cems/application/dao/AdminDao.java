package com.cems.application.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.cems.application.mybatis.AdminRepository;
import com.cems.application.vo.BoardDto;
import com.cems.application.vo.UserDto;

@Component
@Repository
public class AdminDao implements AdminRepository{
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<UserDto> adminUserpage(){
		return mybatis.selectList("com.cems.application.mybatis.AdminRepository.adminUserpage");
	} 
	

	public Map<String, Object> adminDash() {
		System.out.println("dao call");
		return mybatis.selectOne("com.cems.application.mybatis.AdminRepository.adminDash");  
	}
	
	
	public int updateBan(UserDto userdto) {
		return mybatis.update("com.cems.application.mybatis.AdminRepository.updateBan", userdto);  
	}
	
	public int deleteUsercnt() {
		return mybatis.selectOne("com.cems.application.mybatis.AdminRepository.deleteUsercnt");  
	}
	
	public List<BoardDto> adminUserboard(){
		return mybatis.selectList("com.cems.application.mybatis.AdminRepository.adminUserboard");
	}


}
