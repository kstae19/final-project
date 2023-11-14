package com.kh.eco.book.controller;

import java.io.IOException;
import java.net.URLEncoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.eco.book.model.service.BookService;

@Controller
public class BookController {
	
	@Autowired
	private BookService bookService;
	
	public static final String SERVICEKEY = "ttbrkd_gus_wl1746003";
	
	@RequestMapping("book")
	public String BookMain() throws IOException {
		
		String url = "http://www.aladin.co.kr/ttb/api/ItemSearch.aspx";
		url += "?TTBKey=" + SERVICEKEY;
		url += "&Query=" + URLEncoder.encode("환경", "UTF-8");
		url += "&MaxResults=16"; // 페이징처리시 필요함
		System.out.println(url);
		
		
		return "book/book/bookList";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
