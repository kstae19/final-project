package com.kh.eco.book.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.eco.book.model.service.BookService;

@Controller
public class AjaxBookController {
	
	@Autowired
	public BookService bookService;
	
	//북마크 추가/삭제
	@ResponseBody
	@RequestMapping(value="bookmark.bk", produces="text/html; charset-UTF-8")
	public String bookMark(String className) {
		
		if(className.equals("bookmark")) { // 북마크 하기 전
			System.out.println("ㅎㅇ");
			int result = bookService.insertBookMark();
		} else if(className.equals("bookmark abled")) { // 북마크 이후
			System.out.println("ㅂㅇ");
			int result = bookService.removeBookMark();
		} else { // 그 외
			System.out.println("실패!");
		}
		
		return className;
	}
	
	
	
	
	
	
	
	
	

}
