package com.kh.eco.move.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class PublicTransportController {
	
	static final String SB_SERVICEKEY = "abfa69d1-b435-47be-8386-075f6227a0d8";
	
	@ResponseBody
	@RequestMapping(value="subwayST", produces="application/json; charset=UTF-8")
	public String subwayStation() throws IOException {
		String url = "https://t-data.seoul.go.kr/apig/apiman-gateway/tapi/TaimsKsccDvSubwayStationGeom/1.0";
		url += "?apikey=" + URLEncoder.encode(SB_SERVICEKEY, "UTF-8");
		url += "&startRow=1";
		url += "&rowCnt=800";
		
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
}
