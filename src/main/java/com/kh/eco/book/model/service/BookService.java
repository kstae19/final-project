package com.kh.eco.book.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.eco.book.model.vo.Book;
import com.kh.eco.book.model.vo.BookReply;
import com.kh.eco.book.model.vo.BookReport;
import com.kh.eco.book.model.vo.BookReportReply;
import com.kh.eco.common.model.vo.PageInfo;

public interface BookService {
	

	// 도서정보리스트 조회수 조회
	public ArrayList<Book> countList();
	
	// 도서정보 조회수 추가
	public int insertBook(String ISBN);
	
	// 도서정보 조회수 증가
	public int increaseBook(String ISBN);
	
	// 도서정보 조회수 조회
	public int countBook(String ISBN);
	
	// 도서 북마크 추가
	public int insertBookMark(HashMap map);
	
	// 도서 북마크 제거
	public int removeBookMark(HashMap map);
	
	// 도서 북마크 추가
	public int ajaxSelectBookMark(HashMap map);
	
	// 도서 한줄평 등록
	public int ajaxInsertBookReply(HashMap map);
	
	// 도서 한줄평 개수 조회
	public int ajaxSelectBookReplyCount(String ISBN13);
	
	// 도서 한줄평 조회
	public ArrayList<BookReply> ajaxSelectBookReply(String ISBN13, PageInfo pi);
	
	// 도서 한줄평 삭제
	public int ajaxDeleteBookReply(HashMap map);
	
	
	// 독후감 게시글 개수 조회
	public int reportCount();
	
	// 독후감 게시판 리스트 조회
	public ArrayList<BookReport> selectReportList(PageInfo pi);
	
	// 독후감 게시판 검색 개수 조회
	public int searchReportCount(HashMap map);
	
	// 독후감 게시판 검색 조회
	public ArrayList<BookReport> searchReportList(HashMap map, PageInfo pi);
	
	// 독후감 게시판 작성
	public int reportEnrollForm(BookReport bookReport);
	
	// 독후감 게시판 조회수 증가
	public int countReport(int reportNo);
	
	// 독후감 게시판 상세조회
	public BookReport reportDetail(int reportNo);
	
	// 독후감 게시판 수정
	public int reportUpdateForm(BookReport bookReport);
	
	// 독후감 게시판 삭제
	public int reportDelete(int reportNo);
	
	// 독후감 게시글 신고
	public int reportBlack(HashMap map);	
	
	// 독후감 게시판 댓글 조회
	public ArrayList<BookReportReply> ajaxSelectReportReply(int reportNo, PageInfo pi);
	
	// 독후감 게시판 댓글 개수 조회
	public int ajaxSelectReportReplyCount(int reportNo);
	
	// 독후감 게시판 댓글 등록
	public int ajaxInsertReportReply(HashMap map);
	
	// 독후감 게시판 댓글 수정
	public int ajaxUpdateReportReply(HashMap map);
	
	// 독후감 게시판 댓글 삭제
	public int ajaxDeleteReportReply(int replyNo);
	
	// 독후감 게시판 댓글 신고
	public int ajaxReplyBlack(HashMap map);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
