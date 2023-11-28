package com.kh.eco.move.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import sun.net.www.protocol.http.HttpURLConnection;


@Controller
public class BicycleController {
	
	static final String KEY = "754e6e4b446b7374313036724a6e4d54";
	
	@ResponseBody
	@RequestMapping(value="bicycle.mo", produces="application/json; charset=UTF-8")
	public String bicycleInfo() throws IOException {
		
		String url = "http://openapi.seoul.go.kr:8088/";
		url += KEY;
		url += "/json/bikeList/1/1000";
	
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
	@RequestMapping(value="bicycle2.mo", produces="application/json; charset=UTF-8")
	public String bicycle2Info() throws IOException {
		
		String url = "http://openapi.seoul.go.kr:8088/";
		url += KEY;
		url += "/json/bikeList/1001/2000";
	
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
	@RequestMapping(value="bicycle3.mo", produces="application/json; charset=UTF-8")
	public String bicycle3Info() throws IOException {
		
		String url = "http://openapi.seoul.go.kr:8088/";
		url += KEY;
		url += "/json/bikeList/2001/3000";
	
		URL requestUrl = new URL(url);
		HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
		urlConnection.setRequestMethod("GET");
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		String responseText = br.readLine();
		
		br.close();
		urlConnection.disconnect();
		
		return responseText;
	}
}
