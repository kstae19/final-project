package com.kh.eco.book.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.eco.book.model.vo.Book;
import com.kh.eco.book.model.vo.BookReply;
import com.kh.eco.book.model.vo.BookReport;
import com.kh.eco.book.model.vo.BookReportReply;
import com.kh.eco.book.model.vo.ReportBlack;
import com.kh.eco.book.model.vo.ReportReplyBlack;
import com.kh.eco.common.model.vo.PageInfo;

public interface BookService {
	

	// 도서정보리스트 조회수 조회
	public ArrayList<Book> countList();
	
	// 도서정보 조회수 추가
	public int insertBook(Book book);
	
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
	
	
	// 마이페이지 북마크 도서목록 개수 조회
	public int bookmarkCountMyPage(int userNo);
	
	// 마이페이지 북마크 도서목록 조회
	public ArrayList<String> bookmarkMyPage(int userNo, PageInfo pi);
	
	// 마이페이지 한줄평 도서목록 개수 조회
	public int bookReplyCountMyPage(int userNo);
	
	// 마이페이지 한줄평 도서목록 조회
	public ArrayList<BookReply> bookReplyMyPage(int userNo, PageInfo pi);
	
	// 마이페이지 독후감 게시글 목록 개수 조회
	public int reportCountMyPage(int userNo);
	
	// 마이페이지 독후감 게시글 목록 조회
	public ArrayList<BookReport> reportMyPage(int userNo, PageInfo pi);
	
	// 마이페이지 독후감 게시글 댓글 개수 조회
	public int reportReplyCountMyPage(int userNo);
	
	// 마이페이지 독후감 게시글 댓글 조회
	public ArrayList<BookReportReply> reportReplyMyPage(int userNo, PageInfo pi);
	
	
	// 관리자페이지 신고게시글 개수 조회
	public int reportBlackCount();
	
	// 관리자페이지 신고게시글 목록 조회
	public ArrayList<ReportBlack> reportBlack(PageInfo pi);
	
	// 관리자페이지 신고댓글 개수 조회
	public int reportReplyBlackCount();
	
	// 관리자페이지 신고댓글 목록 조회
	public ArrayList<ReportReplyBlack> reportReplyBlack(PageInfo pi);
	
	
	
	
	
	
	
	

}
