package com.kh.eco.user.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CookieController {

	@RequestMapping("createCookie")
	public String create(String cookie, HttpServletResponse response) {
		Cookie saveId = new Cookie("saveId", cookie);
		saveId.setMaxAge(60 * 60 * 24 * 28);
		
		response.addCookie(saveId);
		
		return "user/userLogin";
	}
	
	@RequestMapping("deleteCookie")
	public String delete(String cookie, HttpServletResponse response) {
		Cookie saveId = new Cookie("saveId", cookie);
		
		saveId.setMaxAge(0);
		
		response.addCookie(saveId);
		
		return "user/userLogin";
	}
}
