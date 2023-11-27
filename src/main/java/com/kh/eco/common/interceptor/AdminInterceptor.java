package com.kh.eco.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.eco.user.model.vo.User;

public class AdminInterceptor extends HandlerInterceptorAdapter {
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// true 리턴 시 => 기존 요청 호출대로 Handler를 정상 실행(Controller메소드 호출)
		// false 리턴 시 => Controller 실행 X
		
		// 현재 요청을 보낸 사람이 로그인이 되어있을 경우 => Controller를 호출
		HttpSession session = request.getSession();
		User loginUser = (User)session.getAttribute("loginUser");
		String userStatus = loginUser.getUserStatus();
		
		if(userStatus.equals("A")) {
			return true;
		} else {
			session.setAttribute("loginAlert", "관리자 페이지입니다..");
			response.sendRedirect(request.getContextPath());
			return false;
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
