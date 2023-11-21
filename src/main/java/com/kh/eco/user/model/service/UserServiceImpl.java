package com.kh.eco.user.model.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.eco.user.model.dao.UserDao;
import com.kh.eco.user.model.vo.Cert;
import com.kh.eco.user.model.vo.KakaoUser;
import com.kh.eco.user.model.vo.NaverUser;
import com.kh.eco.user.model.vo.User;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public User loginUser(User u) {
		return userDao.loginUser(sqlSession, u);
	}
	
	@Override
	public User emailUser(User u) {
		return userDao.emailUser(sqlSession, u);
	}

	@Override
	public int idCheck(String checkId) {
		return userDao.idCheck(sqlSession, checkId);
	}
	
	@Override
	public int emailCheck(String checkEmail) {
		return userDao.emailCheck(sqlSession, checkEmail);
	}
	
	@Override
	public int sendMail(Cert cert) {
		return userDao.insertSecret(sqlSession, cert);
	}

	@Override
	public int vaildate(Cert cert) {
		boolean result = userDao.vaildate(sqlSession, cert);
		/*if(result == true) {
			userDao.deleteCert(sqlSession, cert);
		}*/
		return result == true ? 1 : 0;
	}

	@Override
	public int insertMember(User u) {
		int result = userDao.insertMember(sqlSession, u);

		return result;
	}

	@Override
	public String getToken(String code) throws IOException, ParseException {
		
		String kakaoUrl = "https://kauth.kakao.com/oauth/token";
		URL url = new URL(kakaoUrl);
		HttpURLConnection urlConnection = (HttpURLConnection)url.openConnection();
		
		System.out.println(code);
		urlConnection.setRequestMethod("POST");
		urlConnection.setDoOutput(true);
		
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(urlConnection.getOutputStream()));
		StringBuilder sb = new StringBuilder();
		sb.append("client_id=371545a4bd07fbb21965518d557bf733");
		sb.append("&grant_type=authorization_code");
		sb.append("&redirect_url=http://localhost:8001/eco/code");
		sb.append("&code=" + code);
		
		bw.write(sb.toString());
		bw.flush();
		
		// System.out.println(urlConnection.getResponseCode());
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		String line = "";
		String responseData = "";
		while((line = br.readLine()) != null) {
			responseData += line;
		}
		// System.out.println(responseData);
		
		JSONParser parser = new JSONParser();
		JSONObject element = (JSONObject)parser.parse(responseData);
		
		String accessToken = element.get("access_token").toString();
				
		br.close();
		bw.close();
		// System.out.println(accessToken);		
		return accessToken;
	}
	
	@Override
	public String getNToken(String code) throws IOException, ParseException {
		String naverUrl = "https://nid.naver.com/oauth2.0/token";
		URL url = new URL(naverUrl);
		HttpURLConnection urlConnection = (HttpURLConnection)url.openConnection();
		
		// System.out.println(code);
		urlConnection.setRequestMethod("POST");
		urlConnection.setDoOutput(true);
		
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(urlConnection.getOutputStream()));
		StringBuilder sb = new StringBuilder();
		sb.append("client_id=Bm7N4g9KvV8b3Wl6cjN0");
		sb.append("&client_secret=Y3rrs0Jopt");
		sb.append("&grant_type=authorization_code");
		sb.append("&code=" + code);
		sb.append("&state=test");
		
		bw.write(sb.toString());
		bw.flush();
		
		// System.out.println(urlConnection.getResponseCode());
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		String line = "";
		String responseData = "";
		while((line = br.readLine()) != null) {
			responseData += line;
		}
		// System.out.println(responseData);
		
		JSONParser parser = new JSONParser();
		JSONObject element = (JSONObject)parser.parse(responseData);
		
		String accessToken = element.get("access_token").toString();
				
		br.close();
		bw.close();
			
		return accessToken;
	}
	
	public String getUserInfo(String accessToken) throws IOException, ParseException {
		
		String kakaoUrl = "https://kapi.kakao.com/v2/user/me";

		URL url = new URL(kakaoUrl);
		
		HttpURLConnection urlConnection = (HttpURLConnection)url.openConnection();
		urlConnection.setRequestProperty("Authorization", "Bearer " + accessToken);
		urlConnection.setRequestMethod("GET");
		
		// System.out.println(urlConnection.getResponseCode());
		
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		String line = "";
		String responseData = "";
		while((line = br.readLine()) != null) {
			responseData += line;
		}
		// System.out.println(responseData);
		
		JSONObject responseObj = (JSONObject)new JSONParser().parse(responseData);
		JSONObject kakaoAccount = (JSONObject)responseObj.get("kakao_account");
		
		// System.out.println(kakaoAccount);
		// System.out.println(responseObj.get("id").toString());
		
		return responseObj.get("id").toString();
		
	}
	@Override
	public String getNUserInfo(String accessNToken) throws IOException, ParseException {
		String naverUrl = "https://openapi.naver.com/v1/nid/me";

		URL url = new URL(naverUrl);
		
		HttpURLConnection urlConnection = (HttpURLConnection)url.openConnection();
		urlConnection.setRequestProperty("Authorization", "Bearer " + accessNToken);
		urlConnection.setRequestMethod("GET");
		
		// System.out.println(urlConnection.getResponseCode());
		
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		String line = "";
		String responseData = "";
		while((line = br.readLine()) != null) {
			responseData += line;
		}
		// System.out.println(responseData);
		
		JSONObject responseObj = (JSONObject)new JSONParser().parse(responseData);
		JSONObject responseMain = (JSONObject)responseObj.get("response");
		
		// System.out.println(responseMain.get("email").toString());
		
		return responseMain.get("email").toString();
	}

	@Override
	public int selectKakao(String id) {
		return userDao.selectKakao(sqlSession, id);
	}

	@Override
	public int insertKakao(KakaoUser ku) {
		return userDao.insertKakao(sqlSession, ku);
	}
	
	@Override
	public int selectNaver(String email) {
		return userDao.selectNaver(sqlSession, email);
	}
	
	@Override
	public int insertNaver(NaverUser nu) {
		return userDao.insertNaver(sqlSession, nu);
	}

	@Override
	public int nameCheck(User u) {
		return userDao.nameCheck(sqlSession, u);
	}
	
	@Override
	public int nameIdCheck(User u) {
		return userDao.nameIdCheck(sqlSession, u);
	}

	@Override
	public String findId(User u) {
		return userDao.findId(sqlSession, u);
	}

	@Override
	public int findPwd(User u) {
		return userDao.findPwd(sqlSession, u);
	}

	

}
