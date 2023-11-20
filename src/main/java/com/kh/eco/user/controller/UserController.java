package com.kh.eco.user.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.DecimalFormat;
import java.text.Format;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.eco.user.model.service.UserService;
import com.kh.eco.user.model.vo.Cert;
import com.kh.eco.user.model.vo.KakaoUser;
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
			session.setAttribute("alertMsg", "로그인에 성공했습니다!!");
			mv.setViewName("redirect:/");
		} else {
			// model.addattribute
			mv.addObject("errorMsg", "로그인에 실패했습니다...");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping("logout.us")
	public String logoutMember(HttpSession session) throws IOException {
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
	public String insertUser(User u, HttpSession session, Model model) {
		//System.out.println("평문 : " + u.getUserPwd());
		String encPwd = bcryptPasswordEncoder.encode(u.getUserPwd());
		//System.out.println("암호문 : " + encPwd);
		u.setUserPwd(encPwd); // User 객체에 userPwd필드에 평문이 아닌 암호문을 담아서 DB로 보내기!
		
		if(userService.insertMember(u) > 0) { // 성공 => 메인페이지
			session.setAttribute("alertMsg", "회원가입에 성공했습니다!!");
			return "redirect:/";
		} else { // 실패 => 에러메시지 담아서 에러메시지로 포워딩
			model.addAttribute("errorMsg", "회원가입을 실패했습니다..");	
			return "common/errorPage";
		}
		
	}
	
	
	@GetMapping("code")
	public ModelAndView getCode(User u, KakaoUser ku, String code, HttpSession session, ModelAndView mv) throws IOException, ParseException  {
		String accessToken = userService.getToken(code);
		String id = userService.getUserInfo(accessToken);
		
		int kakaoLoginUser = userService.selectKakao(id);
		u.setUserId(id);
		
		ku.setKakaoId(id);
		
		User loginUser = userService.loginUser(u);
		
		if(kakaoLoginUser > 0) {
			if (idCheck(id) == "NNNNY") {
				session.setAttribute("alertMsg", "최초 로그인시 가입이 필요합니다!");
				userService.insertKakao(ku);
				mv.addObject("userid", id);
				mv.setViewName("user/kakaoUserEnrollForm");
			} else {
				session.setAttribute("loginUser", loginUser);
				session.setAttribute("accessToken", accessToken);
				session.setAttribute("alertMsg", "로그인에 성공했습니다!!");
				mv.setViewName("redirect:/");
			}
		} else {
			session.setAttribute("alertMsg", "최초 로그인시 가입이 필요합니다!");
			userService.insertKakao(ku);
			mv.addObject("userid", id);
			mv.setViewName("user/kakaoUserEnrollForm");
		}
		return mv;

	}
	@RequestMapping("kakaologout.us")
	public String kakaoLogout(HttpSession session, HttpServletResponse response) throws IOException, ParseException {
		String accessToken = (String)session.getAttribute("accessToken");
		
		String kakaoLogoutURL = "https://kapi.kakao.com/v1/user/logout";
		
		URL url = new URL(kakaoLogoutURL);
		
		HttpURLConnection urlConnection = (HttpURLConnection)url.openConnection();
		urlConnection.setRequestMethod("POST");
		urlConnection.setRequestProperty("Authorization", "Bearer " + accessToken);
		
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		String line = "";
		String responseData = "";
		
		 while ((line = br.readLine()) != null) {
			 responseData += line;
	        }
        System.out.println(responseData);
		session.invalidate();
		
		// 특정 쿠키 삭제
        Cookie accessTokenCookie = new Cookie("accessToken", null);
        accessTokenCookie.setPath("/");
        accessTokenCookie.setMaxAge(0);
        response.addCookie(accessTokenCookie);
        
		return "redirect:/";
	}
	
	@ResponseBody
	@RequestMapping("nameCheck")
	public String nameCheck(User u, String checkName, String checkEmail) {
		u.setUserName(checkName);
		u.setEmail(checkEmail);
		
		return userService.nameCheck(u) > 0 ? "NNNNY" : "NNNNN";
	}
	
	@ResponseBody
	@RequestMapping("nameIdCheck")
	public String nameIdCheck(User u, String checkName, String checkId, String checkEmail) {
		u.setUserName(checkName);
		u.setUserId(checkId);
		u.setEmail(checkEmail);
		
		System.out.println(userService.nameIdCheck(u));
		
		return userService.nameIdCheck(u) > 0 ? "NNNNY" : "NNNNN";
	}
			
	
	@RequestMapping("findId.us")
	public String findId(User u, String email, HttpServletRequest request, HttpSession session) throws MessagingException {
		MimeMessage message = sender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
		
		String ip = request.getRemoteAddr();
		
		String fId = userService.findId(u);
		
		helper.setTo(email);
		helper.setSubject("회원님의 아이디를 보내드립니다.");
		helper.setText("<!DOCTYPE html>"
						+ "<html>"
							+ "<body>"
								+ "<div style=' width:400px; height:270px; margin:auto; border:2px solid darkgreen;'>"
									+ "<h1 style='color:darkgreen; margin-top:30px; text-align:center'>Eco-Friendly</h1>"
									+ "<div style='margin-top:60px; text-align:center;'>"
										+ "<h1>아이디 : " + fId + "</h1>"
									+ "</div>"
									+ "<br>"
									+ "<h3 style='color:darkgreen; margin-top:20px; text-align:center'>이 인증번호는 1시간 뒤 만료됩니다.</h3>"
								+ "<div>"
							+ "</body>"
						+ "</html>", true);
		sender.send(message);
		
		session.setAttribute("alertMsg", u.getEmail() + "으로 이메일을 전송했습니다!!");
		
		return "user/userLogin";
	}
	
	@RequestMapping("findPwd.us")
	public String findPwd(User u, String email, HttpServletRequest request, HttpSession session) throws MessagingException {
		MimeMessage message = sender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
		
		String ip = request.getRemoteAddr();
		
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
                'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };
		
		String fPwd = "";
		
		int result = 0;
		for(int i = 0; i < 8; i++) {
			result = (int) (charSet.length * Math.random());
			fPwd += charSet[result];
		}
		
		String newPwd = bcryptPasswordEncoder.encode(fPwd);
		//System.out.println("암호문 : " + encPwd);
		u.setUserPwd(newPwd);
				
		userService.findPwd(u);
		
		helper.setTo(email);
		helper.setSubject("회원님의 임시 비밀번호를 보내드립니다.");
		helper.setText("<!DOCTYPE html>"
						+ "<html>"
							+ "<body>"
								+ "<div style=' width:400px; height:270px; margin:auto; border:2px solid darkgreen;'>"
									+ "<h1 style='color:darkgreen; margin-top:30px; text-align:center'>Eco-Friendly</h1>"
									+ "<div style='margin-top:60px; text-align:center;'>"
										+ "<h1>임시 비밀번호 : " + fPwd + "</h1>"
									+ "</div>"
									+ "<br>"
									+ "<h3 style='color:darkgreen; margin-top:20px; text-align:center'>이 인증번호는 1시간 뒤 만료됩니다.</h3>"
								+ "<div>"
							+ "</body>"
						+ "</html>", true);
		sender.send(message);
		
		session.setAttribute("alertMsg", u.getEmail() + "으로 이메일을 전송했습니다!!");
		
		return "user/userLogin";
	}
}
