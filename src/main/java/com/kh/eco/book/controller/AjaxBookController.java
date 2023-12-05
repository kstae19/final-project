package com.kh.eco.book.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.eco.book.model.service.BookService;
import com.kh.eco.book.model.vo.Book;
import com.kh.eco.book.model.vo.BookReply;
import com.kh.eco.book.model.vo.BookReport;
import com.kh.eco.book.model.vo.BookReportReply;
import com.kh.eco.book.model.vo.ReportBlack;
import com.kh.eco.book.model.vo.ReportReplyBlack;
import com.kh.eco.common.model.template.Pagination;
import com.kh.eco.common.model.vo.PageInfo;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class AjaxBookController {
	
	private final BookService bookService;
	
	// 북마크 있나없나 조회
	@PostMapping(value="selectBookMark.bk", produces="text/html; charset=UTF-8")
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
	@PostMapping(value="bookMark.bk", produces="text/html; charset=UTF-8")
	public String ajaxBookMark(String className, String ISBN13, int userNo, HttpSession session) {
		
		HashMap<String, Object> map = new HashMap();
		map.put("ISBN", ISBN13);
		map.put("userNo", userNo);
		
		if(className.equals("bookmark")) { // 북마크 하기 전
			int result = bookService.insertBookMark(map);
			if(result > 0) { // 북마크 잘됨
				className = "bookmark abled";
			} else { // 북마크 안됨
				session.setAttribute("failBookAlert", "북마크 조작 실패");
			}
		} else if(className.equals("bookmark abled")) { // 북마크 이후
			int result = bookService.removeBookMark(map);
			if(result > 0) { // 북마크 제거 잘됨
				className = "bookmark";
			} else { // 북마크 제거 안됨
				session.setAttribute("failBookAlert", "북마크 조작 실패");
			}
		} else { // 그 외
			session.setAttribute("failBookAlert", "북마크 조작 실패");
		}
		return className;
	}
	
	// 한줄평 등록
	@PostMapping(value="insertBookReply.bk", produces="text/html; charset=UTF-8")
	public String ajaxInsertBookReply(String ISBN13, int userNo, String content, HttpSession session) 
	throws Exception {
		
		BookController.checkText(content, 60);
		
		HashMap<String, Object> map = new HashMap();
		map.put("ISBN13", ISBN13);
		map.put("userNo", userNo);
		map.put("content", content);
		
		if(bookService.ajaxInsertBookReply(map) > 1) { // 성공
			return "success";
		} else { // 실패
			return "fail";
		}
	}
	
	// 한줄평 조회
	@PostMapping(value="selectBookReply.bk", produces="application/json; charset=UTF-8")
	public String ajaxSelectBookReply(@RequestParam(value="cPage", defaultValue="1") int currentPage, String ISBN13) throws IOException {
		
		// 댓글 개수 조회
		int count = bookService.ajaxSelectBookReplyCount(ISBN13);
		PageInfo pi = Pagination.getPageInfo(count, currentPage, 5, 5);
		
		Book book = BookController.bookLookUp(ISBN13);
		
		List<BookReply> list = bookService.ajaxSelectBookReply(ISBN13, pi);
		
		HashMap<String, Object> map = new HashMap();
		map.put("replyCount", count);
		map.put("book", book);
		map.put("replyList", list);
		map.put("replyPi", pi);
		
		Gson gson = new GsonBuilder().create();
		String jsonMap = gson.toJson(map);
		return jsonMap;
	}
	
	// 한줄평 삭제
	@PostMapping(value="deleteBookReply.bk", produces="text/html; charset=UTF-8")
	public String ajaxDeleteBookReply(String ISBN13, int userNo, int ecoNo) {
		
		HashMap<String, Object> map = new HashMap();
		map.put("ISBN13", ISBN13);
		map.put("userNo", userNo);
		map.put("ecoNo", ecoNo);
		
		if(bookService.ajaxDeleteBookReply(map) > 1) { // 삭제 성공
			return "success";
		} else { // 실패
			return "fail";
		}
	}
	
	
	// 댓글 조회
	@PostMapping(value="selectReportReply.bk", produces="application/json; charset=UTF-8")
	public String ajaxSelectReportReply(@RequestParam(value="cPage", defaultValue="1") int currentPage, int reportNo) {
		
		// 댓글 개수 조회
		int count = bookService.ajaxSelectReportReplyCount(reportNo);
		PageInfo pi = Pagination.getPageInfo(count, currentPage, 5, 5);
		
		List<BookReportReply> list = bookService.ajaxSelectReportReply(reportNo, pi);
		
		HashMap<String, Object> map = new HashMap();
		map.put("replyCount", count);
		map.put("replyList", list);
		map.put("replyPi", pi);
		
		Gson gson = new GsonBuilder().create();
		String jsonMap = gson.toJson(map);
		return jsonMap;
	}
	

	// 댓글 등록
	@PostMapping(value="insertreportreply.bk", produces="text/html; charset=UTF-8")
	public String ajaxInsertReportReply(int reportNo, int userNo, String content) throws Exception {
		
		BookController.checkText(content, 63);
		
		HashMap<String, Object> map = new HashMap();
		map.put("reportNo", reportNo);
		map.put("userNo", userNo);
		map.put("content", content);
		
		if(bookService.ajaxInsertReportReply(map) > 0) { // 성공
			return "success";
		} else { // 실패
			return "fail";
		}
	}
	
	// 댓글 수정
	@PostMapping("updateReply.bk")
	public String ajaxUpdateReportReply(int replyNo, String content) throws Exception {
		
		BookController.checkText(content, 63);
		
		HashMap<String, Object> map = new HashMap();
		map.put("replyNo", replyNo);
		map.put("content", content);
		
		if(bookService.ajaxUpdateReportReply(map) > 0) { // 성공
			return "success";
		} else { // 실패
			return "fail";
		}
	}
	
	// 댓글 삭제
	@PostMapping(value="deletereportreply.bk", produces="text/html; charset=UTF-8")
	public String ajaxDeleteReportReply(int replyNo) {
		
		if(bookService.ajaxDeleteReportReply(replyNo) > 0) { // 삭제 성공
			return "success";
		} else { // 실패
			return "fail";
		}
	}
	
	// 댓글 신고
	@PostMapping(value="reportReplyBlack.bk", produces="text/html; charset=UTF-8")
	public String ajaxReplyBlack(int reportReplyNo, String blackId, int userNo) {
		
		HashMap<String, Object> map = new HashMap();
		map.put("reportReplyNo", reportReplyNo);
		map.put("blackId", blackId);
		map.put("userNo", userNo);
		
		if(bookService.ajaxReplyBlack(map) > 0) { // 댓글 신고 성공
			return "success";
		} else { // 실패
			return "fail";
		}
	}
	
	// 마이페이지 북마크 책 조회
	@PostMapping(value="bookmypage.bk", produces="application/json; charset=UTF-8")
	public String bookMyPage(@RequestParam(value="bPage", defaultValue="1") int currentPage, Model model, int userNo) 
	throws IOException {
		
		PageInfo bookPi = Pagination.getPageInfo(bookService.bookmarkCountMyPage(userNo), currentPage, 4, 0);
		
		List<String> list = bookService.bookmarkMyPage(userNo, bookPi);
		List<Book> bookList = new ArrayList();
		
		for(int i = 0; i < list.size(); i++) {
			Book book = new Book();
			
			book = BookController.bookLookUp(list.get(i));
			
			bookList.add(book);
		}
		
		HashMap<String, Object> map = new HashMap();
		map.put("bookList", bookList);
		map.put("bookPi", bookPi);
		
		Gson gson = new GsonBuilder().create();
		String jsonMap = gson.toJson(map);
		return jsonMap;
	}
	
	// 마이페이지 한줄평 조회
	@PostMapping(value="bookreplymypage.bk", produces="application/json; charset=UTF-8")
	public String bookReplyMyPage(@RequestParam(value="rPage", defaultValue="1") int currentPage, Model model, int userNo) throws IOException {
		
		PageInfo replyPi = Pagination.getPageInfo(bookService.bookReplyCountMyPage(userNo), currentPage, 5, 5);
		
		List<BookReply> list = bookService.bookReplyMyPage(userNo, replyPi);
		List<Book> bookList = new ArrayList();
		
		for(int i = 0; i < list.size(); i++) {
			Book book = new Book();
			
			book = BookController.bookLookUp(list.get(i).getISBN13());
			book.setBookReply(list.get(i).getBookReplyContent());
			
			bookList.add(book);
		}

		HashMap<String, Object> map = new HashMap();
		map.put("replyList", bookList);
		map.put("replyPi", replyPi);
		
		Gson gson = new GsonBuilder().create();
		String jsonMap = gson.toJson(map);
		return jsonMap;
	}
	
	// 마이페이지 게시글 조회
	@PostMapping(value="reportmypage.bk", produces="application/json; charset=UTF-8")
	public String reportMyPage(@RequestParam(value="rPage", defaultValue="1") int currentPage, Model model, int userNo) {
		PageInfo reportPi = Pagination.getPageInfo(bookService.reportCountMyPage(userNo), currentPage, 5, 5);
		
		List<BookReport> list = bookService.reportMyPage(userNo, reportPi);
		
		HashMap<String, Object> map = new HashMap();
		map.put("reportList", list);
		map.put("reportPi", reportPi);
		
		Gson gson = new GsonBuilder().create();
		String jsonMap = gson.toJson(map);
		return jsonMap;
	}
		
	// 마이페이지 게시글 댓글 조회
	@PostMapping(value="reportreplymypage.bk", produces="application/json; charset=UTF-8")
	public String reportReplyMyPage(@RequestParam(value="rrPage", defaultValue="1") int currentPage, Model model, int userNo) {
		
		PageInfo replyPi = Pagination.getPageInfo(bookService.reportReplyCountMyPage(userNo), currentPage, 5, 5);
		
		List<BookReportReply> list = bookService.reportReplyMyPage(userNo, replyPi);

		HashMap<String, Object> map = new HashMap();
		map.put("replyList", list);
		map.put("replyPi", replyPi);
		
		Gson gson = new GsonBuilder().create();
		String jsonMap = gson.toJson(map);
		return jsonMap;
	}
	
	
	// 관리자페이지 신고게시글 목록 조회
	@PostMapping(value="adminReportBlack.bk", produces="application/json; charset=UTF-8")
	public String reportBlack(@RequestParam(value="cPage", defaultValue="1") int currentPage, Model model) {
		
		int result = bookService.adminReportBlackCount();
		
		if(result != 0) {
			PageInfo Pi = Pagination.getPageInfo(result, currentPage, 5, 5);
			
			List<ReportBlack> list = bookService.adminReportBlack(Pi);

			HashMap<String, Object> map = new HashMap();
			map.put("list", list);
			map.put("pi", Pi);
			
			Gson gson = new GsonBuilder().create();
			String jsonMap = gson.toJson(map);
			return jsonMap;
		} else {
			return null;
		}
	}
	
	// 관리자페이지 신고댓글 목록 조회
	@PostMapping(value="adminReportReplyBlack.bk", produces="application/json; charset=UTF-8")
	public String reportReplyBlack(@RequestParam(value="cPage", defaultValue="1") int currentPage, Model model) {
		
		int result = bookService.adminReportReplyBlackCount();
		
		if(result != 0) {
			PageInfo pi = Pagination.getPageInfo(result, currentPage, 5, 5);
			
			List<ReportReplyBlack> list = bookService.adminReportReplyBlack(pi);

			HashMap<String, Object> map = new HashMap();
			map.put("list", list);
			map.put("pi", pi);
			
			Gson gson = new GsonBuilder().create();
			String jsonMap = gson.toJson(map);
			return jsonMap;
		} else {
			return null;
		}
	}
	
	// 관리자페이지 신고게시글 삭제
	@PostMapping(value="deleteReportBlack.bk", produces="text/html; charset=UTF-8")
	public String deleteReportBlack(@RequestParam(value="blackReportNoArr") int[] arr) {
		
		int result = bookService.deleteReportBlack(arr);
    
		String check = result == arr.length ? "success" : "fail";
		
		return check;
	}
	
	// 관리자페이지 신고댓글 삭제
	@PostMapping(value="deleteReplyBlack.bk", produces="text/html; charset=UTF-8")
	public String deleteReplyBlack(@RequestParam(value="blackReplyNoArr") int[] arr) {
		
		int result = bookService.deleteReplyBlack(arr);
    
		String check = result == arr.length ? "success" : "fail";
		
		return check;
	}
	
	
	
	
	

}
