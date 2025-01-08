package com.cems.application.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LoginCheckFilter implements Filter {
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		
		HttpServletRequest httprequest = (HttpServletRequest) request;
		HttpServletResponse httpresponse = (HttpServletResponse) response;
		
		try {
			log.info("인증 체크 필터 시작");
			
			HttpSession session = httprequest.getSession(false);
			
			if(session.getAttribute("user") == null) {
				log.info("비정상적인 접근");
				httpresponse.sendRedirect("/CEMS/loginpage");
				return;
			}
			chain.doFilter(request, response);
		} catch (Exception e) {
			throw e;
		} finally {
			log.info("인증 체크 필터 종료");
		}
		
	}
	
}