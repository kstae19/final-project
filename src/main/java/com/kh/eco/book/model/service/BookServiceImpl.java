package com.kh.eco.book.model.service;


import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.eco.book.model.dao.BookDao;
import com.kh.eco.book.model.vo.Book;
import com.kh.eco.book.model.vo.BookReply;
import com.kh.eco.book.model.vo.BookReport;
import com.kh.eco.book.model.vo.BookReportReply;
import com.kh.eco.common.model.vo.PageInfo;

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
	public int insertBook(String ISBN) {
		return bookDao.insertBook(sqlSession, ISBN);
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
	public int ajaxDeleteBookReply(HashMap map) {
		return bookDao.ajaxDeleteBookReply(sqlSession, map);
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
	public BookReport reportDetail(int reportNo) {
		return null;
	}

	@Override
	public ArrayList<BookReportReply> selectReportReply(int reportNo) {
		return null;
	}

	


	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
