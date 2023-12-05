package com.kh.eco.book.model.service;


import java.util.List;
import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.kh.eco.book.model.dao.BookDao;
import com.kh.eco.book.model.vo.Book;
import com.kh.eco.book.model.vo.BookReply;
import com.kh.eco.book.model.vo.BookReport;
import com.kh.eco.book.model.vo.BookReportReply;
import com.kh.eco.book.model.vo.ReportBlack;
import com.kh.eco.book.model.vo.ReportReplyBlack;
import com.kh.eco.common.model.vo.PageInfo;

import lombok.RequiredArgsConstructor;

@EnableTransactionManagement
@Service
@RequiredArgsConstructor
public class BookServiceImpl implements BookService{
	
	private final BookDao bookDao;
	
	private final SqlSessionTemplate sqlSession;
	
	// 페이징처리를 위한 offset 만들기
	private RowBounds createRowBounds(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return rowBounds;
	}

	
	@Override
	public ArrayList<Book> countList() {
		return (ArrayList<Book>) bookDao.countList(sqlSession);
	}

	@Override
	public int insertBook(Book book) {
		return bookDao.insertBook(sqlSession, book);
	}

	@Override
	public int increaseBook(String ISBN) {
		return bookDao.increaseBook(sqlSession, ISBN);
	}

	@Override
	public int countBook(String ISBN) {
		return bookDao.countBook(sqlSession, ISBN);
	}

	@Override
	public int insertBookMark(HashMap map) {
		return bookDao.insertBookMark(sqlSession, map);
	}

	@Override
	public int removeBookMark(HashMap map) {
		return bookDao.removeBookMark(sqlSession, map);
	}

	@Override
	public int ajaxSelectBookMark(HashMap map) {
		return bookDao.ajaxSelectBookMark(sqlSession, map);
	}

	@Override
	public int ajaxInsertBookReply(HashMap map) {
		return bookDao.ajaxInsertBookReply(sqlSession, map);
	}

	@Override
	public int ajaxSelectBookReplyCount(String ISBN13) {
		return bookDao.ajaxSelectBookReplyCount(sqlSession, ISBN13);
	}
	
	@Override
	public List<BookReply> ajaxSelectBookReply(String ISBN13, PageInfo pi) {
		return bookDao.ajaxSelectBookReply(sqlSession, ISBN13, createRowBounds(pi));
	}
	
	@Override
	@Transactional("transactionManager")
	public int ajaxDeleteBookReply(HashMap map) {
		int result2 = bookDao.ajaxDeleteBookEco(sqlSession, map);
		int result1 = bookDao.ajaxDeleteBookReply(sqlSession, map);
		return result1 + result2;
	}

	@Override
	public int reportCount() {
		return bookDao.reportCount(sqlSession);
	}

	@Override
	public List<BookReport> selectReportList(PageInfo pi) {
		return bookDao.selectReportList(sqlSession, createRowBounds(pi));
	}
	
	@Override
	public int searchReportCount(HashMap map) {
		return bookDao.searchReportCount(sqlSession, map);
	}

	@Override
	public List<BookReport> searchReportList(HashMap map, PageInfo pi) {
		return bookDao.searchReportList(sqlSession, map, createRowBounds(pi));
	}
	
	@Override
	public int reportEnrollForm(BookReport bookReport) {
		return bookDao.reportEnrollForm(sqlSession, bookReport);
	}
	
	@Override
	public int countReport(int reportNo) {
		return bookDao.countReport(sqlSession, reportNo);
	}

	@Override
	public BookReport reportDetail(int reportNo) {
		return bookDao.reportDetail(sqlSession, reportNo);
	}
	
	@Override
	public int reportUpdateForm(BookReport bookReport) {
		return bookDao.reportUpdateForm(sqlSession, bookReport);
	}
	
	@Override
	public int reportDelete(int reportNo) {
		return bookDao.reportDelete(sqlSession, reportNo);
	}
	
	@Override
	public int reportBlack(HashMap map) {
		return bookDao.reportBlack(sqlSession, map);
	}
	
	@Override
	public int ajaxSelectReportReplyCount(int reportNo) {
		return bookDao.ajaxSelectReportReplyCount(sqlSession, reportNo);
	}
	
	@Override
	public List<BookReportReply> ajaxSelectReportReply(int reportNo, PageInfo pi) {
		return bookDao.ajaxSelectReportReply(sqlSession, reportNo, createRowBounds(pi));
	}

	@Override
	public int ajaxInsertReportReply(HashMap map) {
		return bookDao.ajaxInsertReportReply(sqlSession, map);
	}

	@Override
	public int ajaxUpdateReportReply(HashMap map) {
		return bookDao.ajaxUpdateReportReply(sqlSession, map);
	}

	@Override
	public int ajaxDeleteReportReply(int replyNo) {
		return bookDao.ajaxDeleteReportReply(sqlSession, replyNo);
	}

	@Override
	public int ajaxReplyBlack(HashMap map) {
		return bookDao.ajaxReplyBlack(sqlSession, map);
	}

	@Override
	public int bookmarkCountMyPage(int userNo) {
		return bookDao.bookmarkCountMyPage(sqlSession, userNo);
	}

	@Override
	public List<String> bookmarkMyPage(int userNo, PageInfo pi) {
		return bookDao.bookmarkMyPage(sqlSession, userNo, createRowBounds(pi));
	}

	@Override
	public int bookReplyCountMyPage(int userNo) {
		return bookDao.bookReplyCountMyPage(sqlSession, userNo);
	}

	@Override
	public List<BookReply> bookReplyMyPage(int userNo, PageInfo pi) {
		return (List)bookDao.bookReplyMyPage(sqlSession, userNo, createRowBounds(pi));
	}

	@Override
	public int reportCountMyPage(int userNo) {
		return bookDao.reportCountMyPage(sqlSession, userNo);
	}

	@Override
	public List<BookReport> reportMyPage(int userNo, PageInfo pi) {
		return bookDao.reportMyPage(sqlSession, userNo, createRowBounds(pi));
	}

	@Override
	public int reportReplyCountMyPage(int userNo) {
		return bookDao.reportReplyCountMyPage(sqlSession, userNo);
	}

	@Override
	public List<BookReportReply> reportReplyMyPage(int userNo, PageInfo pi) {
		return bookDao.reportReplyMyPage(sqlSession, userNo, createRowBounds(pi));
	}

	@Override
	public int adminReportBlackCount() {
		return bookDao.adminReportBlackCount(sqlSession);
	}

	@Override
	public List<ReportBlack> adminReportBlack(PageInfo pi) {
		return bookDao.adminReportBlack(sqlSession, createRowBounds(pi));
	}

	@Override
	public int adminReportReplyBlackCount() {
		return bookDao.adminReportReplyBlackCount(sqlSession);
	}

	@Override
	public List<ReportReplyBlack> adminReportReplyBlack(PageInfo pi) {
		return bookDao.adminReportReplyBlack(sqlSession, createRowBounds(pi));
	}

	@Override
	public int deleteReportBlack(int reportBlackNo) {
		return bookDao.deleteReportBlack(sqlSession, reportBlackNo);
	}

	@Override
	public int deleteReplyBlack(int replyBlackNo) {
		return bookDao.deleteReplyBlack(sqlSession, replyBlackNo);
	}


	

	

	


	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
