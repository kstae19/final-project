package com.kh.eco.move.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import sun.net.www.protocol.http.HttpURLConnection;

@Controller
public class AirController {

	static final String SERVICEKEY = "3Pie%2Be9C78s5Ul6%2BzJZaCEXTbWWADemQXG3w6CG2Ssfn4s8L%2FLmlt4oMadloG2BYKSVBPmEYrlwGX8hAgcqMSQ%3D%3D";
	
	@ResponseBody
	@RequestMapping(value="air.mo", produces="application/json; charset=UTF-8") 
	public String airInfo() throws IOException {
		String url = "http://apis.data.go.kr/B552584/ArpltnInforInqireSvc/getCtprvnRltmMesureDnsty";
		url += "?serviceKey=" + SERVICEKEY;
		url += "&sidoName=" + URLEncoder.encode("서울", "UTF-8");
		url += "&returnType=json";
		url += "&numOfRows=40";
		
		// System.out.println(url);
		URL requestUrl = new URL(url);
		HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
		urlConnection.setRequestMethod("GET");
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		String responseText = br.readLine();
		
		br.close();
		urlConnection.disconnect();
		
		return responseText;
	}
	
	@ResponseBody
	@RequestMapping(value="temp.mo", produces="application/json; charset=UTF-8") 
	public String tempInfo(String areaName) throws IOException {
		
		Date today = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat sc = new SimpleDateFormat("HHmm");
		String result = df.format(today);
		String nx = "";  
		String ny = "";  
		
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(today);
		calendar.add(Calendar.HOUR_OF_DAY, -1);

		String result1 = String.format("%02d00", calendar.get(Calendar.HOUR_OF_DAY));
		System.out.println(result1);
		
		// System.out.println(areaName);
		
		if(areaName.equals("종로구")) {
			nx = "60"; ny = "127";
		} else if(areaName.equals("중구")) {
			nx = "60"; ny = "127";
		} else if(areaName.equals("용산구")) {
			nx = "60"; ny = "126";
		} else if(areaName.equals("성동구")) {
			nx = "61"; ny = "127";
		} else if(areaName.equals("광진구")) {
			nx = "62"; ny = "126";
		} else if(areaName.equals("동대문구")) {
			nx = "61"; ny = "127";
		} else if(areaName.equals("중랑구")) {
			nx = "62"; ny = "128";
		} else if(areaName.equals("성북구")) {
			nx = "61"; ny = "127";
		} else if(areaName.equals("강북구")) {
			nx = "61"; ny = "128";
		} else if(areaName.equals("도봉구")) {
			nx = "61"; ny = "129";
		} else if(areaName.equals("노원구")) {
			nx = "61"; ny = "129";
		} else if(areaName.equals("은평구")) {
			nx = "59"; ny = "127";
		} else if(areaName.equals("서대문구")) {
			nx = "59"; ny = "127";
		} else if(areaName.equals("마포구")) {
			nx = "59"; ny = "127";
		} else if(areaName.equals("양천구")) {
			nx = "58"; ny = "126";
		} else if(areaName.equals("강서구")) {
			nx = "58"; ny = "126";
		} else if(areaName.equals("구로구")) {
			nx = "58"; ny = "125";
		} else if(areaName.equals("금천구")) {
			nx = "59"; ny = "124";
		} else if(areaName.equals("영등포구")) {
			nx = "58"; ny = "126";
		} else if(areaName.equals("동작구")) {
			nx = "59"; ny = "125";
		} else if(areaName.equals("관악구")) {
			nx = "59"; ny = "125";
		} else if(areaName.equals("서초구")) {
			nx = "61"; ny = "125";
		} else if(areaName.equals("강남구")) {
			nx = "61"; ny = "126";
		} else if(areaName.equals("송파구")) {
			nx = "62"; ny = "126";
		} else {
			nx = "62"; ny = "126";
		} 		
		
		String url = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst";
		url += "?serviceKey=" + SERVICEKEY;
		url += "&dataType=json&numOfRows=1000&pageNo=1";
		url += "&base_date=" + result;
		url += "&base_time=" + result1;
		url += "&nx=" + nx;
		url += "&ny=" + ny;
		// System.out.println(today);
		System.out.println(url);
		
		URL requestUrl = new URL(url);
		HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
		urlConnection.setRequestMethod("GET");
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		String tempText = br.readLine();
		
		// System.out.println(tempText);
				
		br.close();
		urlConnection.disconnect();
		
		return tempText;
	}
	
	@ResponseBody
	@RequestMapping(value="today.mo", produces="application/json; charset=UTF-8") 
	public String todayInfo(String areaName) throws IOException {
		
		Date today = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
		// Calendar cal = Calendar.getInstance();
		// cal.add(Calendar.DATE, -1);
	  
		String result = df.format(today);  
		String nx = "";  
		String ny = "";  
		
		
		if(areaName.equals("종로구")) {
			nx = "60"; ny = "127";
		} else if(areaName.equals("중구")) {
			nx = "60"; ny = "127";
		} else if(areaName.equals("용산구")) {
			nx = "60"; ny = "126";
		} else if(areaName.equals("성동구")) {
			nx = "61"; ny = "127";
		} else if(areaName.equals("광진구")) {
			nx = "62"; ny = "126";
		} else if(areaName.equals("동대문구")) {
			nx = "61"; ny = "127";
		} else if(areaName.equals("중랑구")) {
			nx = "62"; ny = "128";
		} else if(areaName.equals("성북구")) {
			nx = "61"; ny = "127";
		} else if(areaName.equals("강북구")) {
			nx = "61"; ny = "128";
		} else if(areaName.equals("도봉구")) {
			nx = "61"; ny = "129";
		} else if(areaName.equals("노원구")) {
			nx = "61"; ny = "129";
		} else if(areaName.equals("은평구")) {
			nx = "59"; ny = "127";
		} else if(areaName.equals("서대문구")) {
			nx = "59"; ny = "127";
		} else if(areaName.equals("마포구")) {
			nx = "59"; ny = "127";
		} else if(areaName.equals("양천구")) {
			nx = "58"; ny = "126";
		} else if(areaName.equals("강서구")) {
			nx = "58"; ny = "126";
		} else if(areaName.equals("구로구")) {
			nx = "58"; ny = "125";
		} else if(areaName.equals("금천구")) {
			nx = "59"; ny = "124";
		} else if(areaName.equals("영등포구")) {
			nx = "58"; ny = "126";
		} else if(areaName.equals("동작구")) {
			nx = "59"; ny = "125";
		} else if(areaName.equals("관악구")) {
			nx = "59"; ny = "125";
		} else if(areaName.equals("서초구")) {
			nx = "61"; ny = "125";
		} else if(areaName.equals("강남구")) {
			nx = "61"; ny = "126";
		} else if(areaName.equals("송파구")) {
			nx = "62"; ny = "126";
		} else {
			nx = "62"; ny = "126";
		} 		
		
		String url = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst";
		url += "?serviceKey=" + SERVICEKEY;
		url += "&dataType=json&numOfRows=310&pageNo=1";
		url += "&base_date=" + result;
		url += "&base_time=0500";
		url += "&nx=" + nx;
		url += "&ny=" + ny;
		// System.out.println(today);
		System.out.println(url);
		
		URL requestUrl = new URL(url);
		HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
		urlConnection.setRequestMethod("GET");
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		String todayText = br.readLine();
		
		// System.out.println(tempText);
				
		br.close();
		urlConnection.disconnect();
		
		return todayText;
	}
}
