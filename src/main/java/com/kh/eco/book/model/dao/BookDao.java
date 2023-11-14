package com.kh.eco.book.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.eco.book.model.vo.Book;

@Repository
public class BookDao {
	
	public ArrayList<Book> countList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("bookMapper.countList");
	}
	
	
	
	
	
	
	

}
