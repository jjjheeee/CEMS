package com.cems.application.mybatis;

import java.util.List;

import com.cems.application.vo.StatisticsDto;

public interface StatisticsRepository {
	List<StatisticsDto> correctRatio(String user_id);
}
