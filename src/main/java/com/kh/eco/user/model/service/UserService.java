package com.kh.eco.user.model.service;

import com.kh.eco.user.model.vo.Cert;
import com.kh.eco.user.model.vo.User;

public interface UserService {
	// 유저 로그인
	User loginUser(User u);
	
	// 아이디 중복체크 서비스
	int idCheck(String checkId);
	
	// 가입시 메일 인증 서비스
	int sendMail(Cert cert);

	int vaildate(Cert cert);
	
	// 회원가입 서비스
	int insertMember(User u);
}
