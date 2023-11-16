package com.kh.eco.book.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.eco.book.model.service.BookService;

@Controller
public class AjaxBookController {
	
	@Autowired
	public BookService bookService;
	
	// 북마크 있나없나 조회
	@ResponseBody
	@RequestMapping(value="markbook.bk", produces="text/html; charset=UTF-8")
	public String selectBookMark(String ISBN, int userNo) {
		String className="";
		HashMap<String, Object> map = new HashMap();
		map.put("ISBN", ISBN);
		map.put("userNo", userNo);
		
		int bookMarkCount = bookService.selectBookMark(map);
		
		if(bookMarkCount > 0) { // 북마크 있음
			className = "bookmark abled";
		} else { // 북마크 없음
			className = "bookmark";
		}
		
		return className;
	}
	
	//북마크 추가/삭제
	@ResponseBody
	@RequestMapping(value="bookmark.bk", produces="text/html; charset=UTF-8")
	public String bookMark(String className, String ISBN, int userNo) {
		
		HashMap<String, Object> map = new HashMap();
		map.put("ISBN", ISBN);
		map.put("userNo", userNo);
		
		if(className.equals("bookmark")) { // 북마크 하기 전
			System.out.println("ㅎㅇ");
			int result = bookService.insertBookMark(map);
			if(result > 0) { // 북마크 잘됨
				className = "bookmark abled";
			} else { // 북마크 안됨
				System.out.println("실패!");
			}
		} else if(className.equals("bookmark abled")) { // 북마크 이후
			System.out.println("ㅂㅇ");
			int result = bookService.removeBookMark(map);
			if(result > 0) { // 북마크 제거 잘됨
				className = "bookmark";
			} else { // 북마크 제거 안됨
				System.out.println("실패!");
			}
		} else { // 그 외
			System.out.println("실패!");
		}
		return className;
	}
	
	
	
	
	
	
	
	
	

}
