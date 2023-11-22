package com.kh.eco.book.model.service;


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
import com.kh.eco.common.model.vo.PageInfo;

@EnableTransactionManagement
@Service
public class BookServiceImpl implements BookService{
	
	@Autowired
	private BookDao bookDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	@Override
	public ArrayList<Book> countList() {
		return bookDao.countList(sqlSession);
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
	public ArrayList<BookReply> ajaxSelectBookReply(String ISBN13, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return bookDao.ajaxSelectBookReply(sqlSession, ISBN13, rowBounds);
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
	public ArrayList<BookReport> selectReportList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return bookDao.selectReportList(sqlSession, rowBounds);
	}
	
	@Override
	public int searchReportCount(HashMap map) {
		return bookDao.searchReportCount(sqlSession, map);
	}

	@Override
	public ArrayList<BookReport> searchReportList(HashMap map, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return bookDao.searchReportList(sqlSession, map, rowBounds);
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
	public ArrayList<BookReportReply> ajaxSelectReportReply(int reportNo, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return bookDao.ajaxSelectReportReply(sqlSession, reportNo, rowBounds);
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


	

	

	


	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
