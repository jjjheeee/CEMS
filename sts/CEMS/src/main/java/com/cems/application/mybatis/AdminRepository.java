package com.cems.application.mybatis;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.cems.application.vo.BoardDto;
import com.cems.application.vo.UserDto;


@Mapper
@Repository
public interface AdminRepository {
	List<UserDto> adminUserpage();
	Map<String, Object> adminDash();
	int updateBan(UserDto dto);
	int deleteUsercnt();
	List<BoardDto> adminUserboard();
}
