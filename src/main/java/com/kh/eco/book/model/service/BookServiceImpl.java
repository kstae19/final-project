package com.kh.eco.book.model.service;


import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.eco.book.model.dao.BookDao;
import com.kh.eco.book.model.vo.Book;

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
	public int selectBookMark(HashMap map) {
		return bookDao.selectBookMark(sqlSession, map);
	}

	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
