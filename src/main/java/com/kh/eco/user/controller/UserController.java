package com.kh.eco.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.eco.user.model.service.UserService;
import com.kh.eco.user.model.vo.User;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping("login.us")
	public ModelAndView loginUser(User u,
									HttpSession session,
									ModelAndView mv) {
		
		User loginUser = userService.loginUser(u);
		
		if(loginUser != null && bcryptPasswordEncoder.matches(u.getUserPwd(), loginUser.getUserPwd())) {
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("redirect:/");
		} else {
			// model.addattribute
			mv.addObject("errorMsg", "로그인에 실패했습니다...");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping("logout.us")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("insert")
	public String insertUser(User u) {
		System.out.println("평문 : " + u.getUserPwd());
		String encPwd = bcryptPasswordEncoder.encode(u.getUserPwd());
		System.out.println("암호문 : " + encPwd);
		return null;
		
	}
}
