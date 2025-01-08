package com.cems.application.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.cems.application.vo.StatisticsDto;

@Component
@Repository
public class StatisticsDao {

	@Autowired 
    private SqlSessionTemplate mybatis;	
	
	public List<StatisticsDto> correctRatio(String user_id){
		return mybatis.selectList("com.cems.application.mybatis.StatisticsRepository.correctRatio", user_id);
	}
	
	
	public List<StatisticsDto> totalQuestion(String user_id){
		List<StatisticsDto> result = new ArrayList<>();
				
		for(int i = 4; i > -1; i--) {
			
			Map<String, Object> map = new HashMap<>();
			map.put("cnt", i);
			map.put("user_id", user_id);
			
			StatisticsDto dto = mybatis.selectOne("com.cems.application.mybatis.StatisticsRepository.totalQuetion", map);
			
			result.add(dto);
		}
		
		return result;
	}
}
