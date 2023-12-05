package com.kh.eco.move.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class PublicTransportController {
	
	@Value("${key.SB}")
	private String SBApiKey;
	
	@Value("${key.SI}")
	private String SIApiKey;
	
	@Value("${key.SN}")
	private String SNApiKey;
	
	@ResponseBody
	@RequestMapping(value="subwayST", produces="application/json; charset=UTF-8")
	public String subwayStation() throws IOException {
		String url = "https://t-data.seoul.go.kr/apig/apiman-gateway/tapi/TaimsKsccDvSubwayStationGeom/1.0";
		url += "?apikey=" + URLEncoder.encode(SBApiKey, "UTF-8");
		
		// System.out.println(url);
		URL requestUrl = new URL(url);
		HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
		urlConnection.setRequestMethod("GET");
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		String subwayStText = br.readLine();
		
		// System.out.println(subwayStText);
		
		br.close();
		urlConnection.disconnect();
		
		return subwayStText;
	}
	
	@ResponseBody
	@RequestMapping(value="subcode", produces="application/json; charset=UTF-8")
	public String subcodeInfo(String subName, String subLine) throws IOException {
		String subC = "";
		
		String url = "http://openapi.seoul.go.kr:8088/";
		url += URLEncoder.encode(SNApiKey, "UTF-8");
		url += "/json/SearchSTNBySubwayLineInfo/1/1/%20/";
		url += subName + "/";
		
		switch(subName) {
		case "1호선":
		case "경원선":
		case "경인선":
		case "경부선":
		case "장항선":
			subC = "01호선";
			break;
		case "2호선":
			subC = "02호선";
			break;
		case "3호선":
		case "일산선":
			subC = "03호선";
			break;
		case "4호선":
		case "안산선":
		case "과천선":
		case "진접선":
			subC = "04호선";
			break;
		case "5호선":
			subC = "05호선";
			break;
		case "6호선":
			subC = "06호선";
			break;
		case "7호선":
		case "7호선(인천)":
			subC = "07호선";
			break;
		case "8호선":
			subC = "08호선";
			break;
		case "9호선":
		case "9호선(연장)":
			subC = "09호선";
			break;
		case "경의중앙선":
		case "중앙선":
			subC = "경의선";
			break;
		case "공항철도1호선":
			subC = "공항철도";
			break;
		case "경춘선":
			subC = "경춘선";
			break;
		case "분당선":
			subC = "수인분당선";
			break;
		case "신분당선":
		case "신분당선(연장)":
		case "신분당선(연장2)":
			subC = "신분당선";
			break;
		case "우이신설선":
			subC = "우이신설경전철";
			break;
		case "의정부선":
			subC = "의정부경전철";
			break;
		case "에버라인선":
			subC = "용인경전철";
			break;
		case "경강선":
			subC = "경강선";
			break;
		case "인천1호선":
			subC = "인천선";
			break;
		case "인천2호선":
			subC = "인천2호선";
			break;
		case "서해선":
			subC = "서해선";
			break;
		case "김포골드라인":
			subC = "김포도시철도";
			break;
		case "신림선":
			subC = "신림선";
			break;
		}
		// System.out.println(subLine);
		url += subC;
		
		// System.out.println(url);

		URL requestUrl = new URL(url);
		HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
		urlConnection.setRequestMethod("GET");
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		String subwaySnText = br.readLine();
		
		// System.out.println(subwaySnText);
		
		br.close();
		urlConnection.disconnect();
		return subwaySnText;
	}
	
	@ResponseBody
	@RequestMapping(value="subtime", produces="application/json; charset=UTF-8")
	public String subtimeInfo(String subcode) throws IOException {
		String url = "http://openapi.seoul.go.kr:8088/";
		url += URLEncoder.encode(SNApiKey, "UTF-8");
		url += "/json/SearchSTNTimeTableByIDService/1/500/";
		url += subcode + "/1/1";
		// System.out.println(url);

		URL requestUrl = new URL(url);
		HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
		urlConnection.setRequestMethod("GET");
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		String subwayStText = br.readLine();
		
		// System.out.println(subwaySnText);
		
		br.close();
		urlConnection.disconnect();
		return subwayStText;
	}
	
	@ResponseBody
	@RequestMapping(value="subtime2", produces="application/json; charset=UTF-8")
	public String subtime2Info(String subcode) throws IOException {
		String url = "http://openapi.seoul.go.kr:8088/";
		url += URLEncoder.encode(SNApiKey, "UTF-8");
		url += "/json/SearchSTNTimeTableByIDService/1/500/";
		url += subcode + "/1/2";
		// System.out.println(url);

		URL requestUrl = new URL(url);
		HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
		urlConnection.setRequestMethod("GET");
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		String subwayStText = br.readLine();
		
		// System.out.println(subwaySnText);
		
		br.close();
		urlConnection.disconnect();
		return subwayStText;
	}
	
	@ResponseBody
	@RequestMapping(value="subway", produces="application/json; charset=UTF-8")
	public String subwayInfo(String sName) throws IOException {
		String url = "http://swopenapi.seoul.go.kr/api/subway/";
		url += "sample"; //URLEncoder.encode(SIApiKey, "UTF-8");
		url += "/json/realtimeStationArrival/0/5/";
		url += URLEncoder.encode(sName, "UTF-8");
		
		//System.out.println(url);
		URL requestUrl = new URL(url);
		HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
		urlConnection.setRequestMethod("GET");
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		String subwaySiText = br.readLine();
		
		//System.out.println(subwaySiText);
		
		br.close();
		urlConnection.disconnect();
		
		return subwaySiText;
	}
}
