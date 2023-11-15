package com.kh.eco.user.controller;

import java.text.DecimalFormat;
import java.text.Format;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.eco.user.model.service.UserService;
import com.kh.eco.user.model.vo.Cert;
import com.kh.eco.user.model.vo.User;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private JavaMailSender sender;
	
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
	
	@ResponseBody
	@RequestMapping("idCheck.me")
	public String idCheck(String checkId) {
		return userService.idCheck(checkId) > 0 ? "NNNNN" : "NNNNY";
	}
	
	@ResponseBody
	@RequestMapping("mail")
	public String mail(String email, HttpServletRequest request) throws MessagingException {
		MimeMessage message = sender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
		
		String ip = request.getRemoteAddr();
		
		Random r = new Random();
		
		int i = r.nextInt(999999);
		Format f = new DecimalFormat("000000");
		String secret = f.format(i);
		
		Cert cert = Cert.builder()
					    .certEmail(ip)
					    .certSecret(secret)
					    .build();
		
		int result = userService.sendMail(cert);
		
		helper.setTo(email);
		helper.setSubject("인증번호를 보내드립니다.");
		helper.setText("<!DOCTYPE html>"
						+ "<html>"
							+ "<body>"
								+ "<div style=' width:400px; height:270px; margin:auto; border:2px solid darkgreen;'>"
									+ "<h1 style='color:darkgreen; margin-top:30px; text-align:center'>Eco-Friendly</h1>"
									+ "<div style='margin-top:60px; text-align:center;'>"
										+ "<h1>인증번호 : " + secret + "</h1>"
									+ "</div>"
									+ "<br>"
									+ "<h3 style='color:darkgreen; margin-top:20px; text-align:center'>이 인증번호는 1시간 뒤 만료됩니다.</h3>"
								+ "<div>"
							+ "</body>"
						+ "</html>", true);
		sender.send(message);
		
		return result > 0 ? "NNNNY" : "NNNNN";
	}
	
	@ResponseBody
	@RequestMapping("check")
	public String checkCode(String checkSecret, HttpServletRequest request) {
		Cert cert = Cert.builder()
						.certEmail(request.getRemoteAddr())
						.certSecret(checkSecret)
						.build();
		int result = userService.vaildate(cert);
		System.out.println(result);
		return result > 0 ? "NNNNY" : "NNNNN";
	}
	
	
	
	@RequestMapping("insert")
	public String insertUser(User u) {
		//System.out.println("평문 : " + u.getUserPwd());
		String encPwd = bcryptPasswordEncoder.encode(u.getUserPwd());
		//System.out.println("암호문 : " + encPwd);
		return null;
		
	}
}
