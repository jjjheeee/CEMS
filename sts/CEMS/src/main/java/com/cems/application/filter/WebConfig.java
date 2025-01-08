package com.cems.application.filter;

import javax.servlet.Filter;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class WebConfig {
	
	@Bean
	public FilterRegistrationBean loginCheckFilter() {
		FilterRegistrationBean<Filter> filterRegistrationBean = new FilterRegistrationBean<>();
		filterRegistrationBean.setFilter(new LoginCheckFilter());
//		filterRegistrationBean.setOrder(0);
		filterRegistrationBean.addUrlPatterns("/CEMS/모의고사");
		filterRegistrationBean.addUrlPatterns("/CEMS/TOPIKI");
		filterRegistrationBean.addUrlPatterns("/CEMS/TOPIKII");
		filterRegistrationBean.addUrlPatterns("/CEMS/dashboard");
		filterRegistrationBean.addUrlPatterns("/CEMS/dashboard/*");
		
//		===================== 공지사항 필터 ===========================
		filterRegistrationBean.addUrlPatterns("/CEMS/공지사항");
		filterRegistrationBean.addUrlPatterns("/CEMS/board_write");
		filterRegistrationBean.addUrlPatterns("/CEMS/board_insert");
		filterRegistrationBean.addUrlPatterns("/CEMS/board_delete{board_id}");
		filterRegistrationBean.addUrlPatterns("/CEMS/board_update{board_id}");
		filterRegistrationBean.addUrlPatterns("/CEMS/update{board_id}");
		filterRegistrationBean.addUrlPatterns("/CEMS/board_{board_id}");
		filterRegistrationBean.addUrlPatterns("/CEMS/update{board_id}");
		
//		===================== 공지사항 필터 ===========================
		filterRegistrationBean.addUrlPatterns("/CEMS/게시판");
		
		
		filterRegistrationBean.addUrlPatterns("/CEMS/랭킹");
		
		
		return filterRegistrationBean;
		
	}
}
