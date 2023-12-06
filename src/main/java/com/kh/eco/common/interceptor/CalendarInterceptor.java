package com.kh.eco.common.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class CalendarInterceptor extends HandlerInterceptorAdapter {

	// HandlerInterceptorAdapter가 가진 preHandler메서드 오버라이딩 구현
	// + sevlet-context에서 등록해야 작동
	
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws IOException {
		
		// 리턴값이 true일 때 : handler정상실행(controller호출)
		// false일 때 : controller호출X(인터셉트)
		
		// 현재 사용자가 로그인 상태일 때 => controller 호출
		HttpSession session = req.getSession();
		if(session.getAttribute("loginUser") != null) {
			return true;
		} else {// 아닐경우 alertMsg
			session.setAttribute("alertMsg", "로그인한 회원만 이용할 수 있습니다");
			res.sendRedirect(req.getContextPath());
			return false;
		}
		
	}
	
	
	
}
