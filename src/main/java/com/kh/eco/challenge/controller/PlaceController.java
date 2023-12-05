package com.kh.eco.challenge.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kh.eco.event.model.service.EventService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class PlaceController {

	public static final String SERVICEKEY = "60341B09-531E-3CD0-AB70-EAFA320EB716";
	
	@ResponseBody
	@GetMapping(value="search.place", produces="application/json; charset=UTF-8")
	public String searchPlace(String place) throws IOException {
		
		String url = "https://api.vworld.kr/req/search";

		// url에 쿼리스트링으로 요청값 넣는 중
		url += "?request=search";
		url += "&errorformat=json";
		url += "&type=place";
		url += "&query="+place;
		url += "&crs=EPSG:900913";
		//url += "&bbox=14140071.146077,4494339.6527027,14160071.146077,4496339.6527027";
		url += "&key="+SERVICEKEY;
		
		System.out.println(url);
		
		// 요청보내는 경로 생성
		URL requestUrl = new URL(url);
		// 경로로 내 요청을 연결
		HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
		// 연결요청은 GET방식으로 받아오기만 하기
		urlConnection.setRequestMethod("GET");
		// 내 화면에 출력하기 위한 연결통로 생성
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		// 연결통로 통해 데이터 읽어들이기
		String responseText = br.readLine();
		
		// 다쓴 자원 반납 및 연결끊기
		br.close();
		urlConnection.disconnect();
		
		return responseText;		
		
	}
	
	@RequestMapping("map/{x}/{y}")//요청url
	public String searchPlaceMap(@PathVariable("x")	@ModelAttribute String x, //""는 url에 넣은 값이름
													@PathVariable("y")	@ModelAttribute String y) {
		
		System.out.println(x);
		System.out.println(y);
		
		return "challenge/searchPlaceMap";
		
	}
	
}//class
