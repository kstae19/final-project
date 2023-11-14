package com.kh.eco.book.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.eco.book.model.vo.Book;
import com.kh.eco.common.model.template.Pagination;
import com.kh.eco.common.model.vo.PageInfo;

@Controller
public class BookController {
	
	public static final String SERVICEKEY = "ttbrkd_gus_wl1746003";
	
	@RequestMapping("book")
	public String bookMain(@RequestParam(value="cPage", defaultValue="1") int currentPage, Model model) throws IOException {
		String url = "http://www.aladin.co.kr/ttb/api/ItemSearch.aspx";
		url += "?TTBKey=" + BookController.SERVICEKEY;
		url += "&Query=" + URLEncoder.encode("환경", "UTF-8");
		// 환경, 에코, 기후변화, 탄소중립, 생태계
		url += "&MaxResults=100";
		url += "&start=1";
		url += "&output=JS";
		url += "&Version=20131101";
		url += "&Cover=big";
		System.out.println(url);
		
		/*
		 * http://www.aladin.co.kr/ttb/api/ItemSearch.aspx?
		 * ttbkey=ttbrkd_gus_wl1746003
		 * &Query=%ED%99%98%EA%B2%BD
		 * &MaxResults=100
		   &start=1
		   &output=xml
		   &Version=20131101
		   &Cover=big
		 */
		
		URL requestUrl = new URL(url);
		HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
		// 요청방식은 GET방식과 POST방식에 상관없이 요청 가능합니다.
		urlConnection.setRequestMethod("GET");
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		
		// 결과 받기
		String responseText = br.readLine();
		/*
		 * {"title":"환경과 생태 쫌 아는 10대 - 우리, 100년 뒤에도 만날 수 있을까요?",
		 *  "link":"http:\/\/www.aladin.co.kr\/shop\/wproduct.aspx?ItemId=192112209&amp;partner=openAPI&amp;start=api",
		 *  "author":"최원형 (지은이), 방상호 (그림)",
		 *  "pubDate":"2019-05-20",
		 *  "description":"과학 쫌 아는 십대 3권. 현대인이 쉽고도 흔하게 행하는 여덟 가지 소비 장면을 포착하여, 나의 소비가 어느 계층의 누구에게, 어디에 있는 어떤 생물에게 어떻게 영향을 미치는지 다양한 각도에서 살펴보고자 했다.",
		 *  "isbn":"K112635902",
		 *  "isbn13":"9791161727356",
		 *  "itemId":192112209,
		 *  "priceSales":11700,
		 *  "priceStandard":13000,
		 *  "mallType":"BOOK",
		 *  "stockStatus":"",
		 *  "mileage":650,
		 *  "cover":"https:\/\/image.aladin.co.kr\/product\/19211\/22\/cover\/k112635902_1.jpg",
		 *  "categoryId":1143,
		 *  "categoryName":"국내도서>청소년>청소년 수학\/과학",
		 *  "publisher":"풀빛",
		 *  "salesPoint":27027,
		 *  "adult":false,
		 *  "fixedPrice":true,
		 *  "customerReviewRank":10,
		 *  "seriesInfo":{"seriesId":658912,"seriesLink":"http://www.aladin.co.kr/shop/common/wseriesitem.aspx?SRID=658912&amp;partner=openAPI","seriesName":"과학 쫌 아는 십대 3"},
		 *  "subInfo":{}}
		 */
		
		JsonObject totalObj = JsonParser.parseString(responseText).getAsJsonObject();
		JsonArray itemArr = totalObj.getAsJsonArray("item");
		
		ArrayList<Book> list = new ArrayList();
		
		for(int i = 0; i < itemArr.size(); i++) {
			JsonObject item = itemArr.get(i).getAsJsonObject();
			
			Book book = new Book();
			
			book.setISBN13(item.get("isbn13").getAsString());
			book.setBookTitle(item.get("title").getAsString());
			book.setBookWriter(item.get("author").getAsString());
			book.setBookImg(item.get("cover").getAsString());
			
			list.add(book);
		}
		
		br.close();
		urlConnection.disconnect();
		
		PageInfo pi = Pagination.getPageInfo(itemArr.size(), currentPage, 5, 5);
		
		model.addAttribute("bookList", list);
		model.addAttribute("pi", pi);
		
		return "book/book/bookList";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
