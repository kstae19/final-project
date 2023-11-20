package com.kh.eco.book.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.eco.book.model.service.BookService;
import com.kh.eco.book.model.vo.BookReply;
import com.kh.eco.common.model.template.Pagination;
import com.kh.eco.common.model.vo.PageInfo;

@Controller
public class AjaxBookController {
	
	@Autowired
	public BookService bookService;
	
	// 북마크 있나없나 조회
	@ResponseBody
	@RequestMapping(value="markbook.bk", produces="text/html; charset=UTF-8")
	public String ajaxSelectBookMark(String ISBN13, int userNo) {
		String className="";
		HashMap<String, Object> map = new HashMap();
		map.put("ISBN", ISBN13);
		map.put("userNo", userNo);
		
		int bookMarkCount = bookService.ajaxSelectBookMark(map);
		
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
	public String ajaxBookMark(String className, String ISBN13, int userNo) {
		
		HashMap<String, Object> map = new HashMap();
		map.put("ISBN", ISBN13);
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
	
	// 한줄평 등록
	@ResponseBody
	@RequestMapping(value="insertbookreply.bk", produces="text/html; charset=UTF-8")
	public String ajaxInsertBookReply(String ISBN13, int userNo, String content) {
		
		HashMap<String, Object> map = new HashMap();
		map.put("ISBN13", ISBN13);
		map.put("userNo", userNo);
		map.put("content", content);
		System.out.println(map);

		
		if(bookService.ajaxInsertBookReply(map) > 1) { // 성공
			return "success";
		} else { // 실패
			System.out.println("실패!");
			return "fail";
		}
	}
	
	// 한줄평 조회
	@ResponseBody
	@RequestMapping(value="selectbookreply.bk", produces="application/json; charset=UTF-8")
	public String ajaxSelectBookReply(@RequestParam(value="cPage", defaultValue="1") int currentPage, String ISBN13) {
		
		// 댓글 개수 조회
		int count = bookService.ajaxSelectBookReplyCount(ISBN13);
		PageInfo pi = Pagination.getPageInfo(count, currentPage, 5, 5);
		
		ArrayList<BookReply> list = bookService.ajaxSelectBookReply(ISBN13, pi);
		
		HashMap<String, Object> map = new HashMap();
		map.put("replyCount", count);
		map.put("replyList", list);
		map.put("replyPi", pi);
		
		Gson gson = new GsonBuilder().create();
		String jsonMap = gson.toJson(map);
		return jsonMap;
	}
	
	// 한줄평 삭제
	@ResponseBody
	@RequestMapping(value="deletebookreply.bk", produces="text/html; charset=UTF-8")
	public String ajaxDeleteBookReply(String ISBN13, int userNo) {
		
		HashMap<String, Object> map = new HashMap();
		map.put("ISBN13", ISBN13);
		map.put("userNo", userNo);
		
		if(bookService.ajaxDeleteBookReply(map) > 0) { // 삭제 성공
			return "success";
		} else { // 실패
			return "fail";
		}
	}
	
	
	
	
	
	
	
	

}
