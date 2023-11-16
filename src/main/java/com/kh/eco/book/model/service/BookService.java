package com.kh.eco.book.model.service;

import java.util.ArrayList;

import com.kh.eco.book.model.vo.Book;

public interface BookService {
	

	// 도서정보리스트 조회수 조회
	public ArrayList<Book> countList();
	
	// 도서정보 조회수 추가
	public int insertBook(String ISBN);
	
	// 도서정보 조회수 증가
	public int increaseBook(String ISBN);
	
	// 도서정보 조회수 조회
	public int countBook(String ISBN);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
