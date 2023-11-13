package com.kh.eco.book.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BookController {
	
	@RequestMapping("book")
	public String BookMain() {
		return "book/book/bookList";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
