package com.kh.eco.book.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BookController {
	
	public static final String SERVICEKEY = "ttbrkd_gus_wl1746003";
	
	@RequestMapping("book")
	public String bookMain() {
		
		
		
		
		return "book/book/bookList";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
