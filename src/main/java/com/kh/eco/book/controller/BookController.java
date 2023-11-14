package com.kh.eco.book.controller;

<<<<<<< Updated upstream
=======
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.beans.factory.annotation.Autowired;
>>>>>>> Stashed changes
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BookController {
	
	@RequestMapping("book")
<<<<<<< Updated upstream
	public String BookMain() {
=======
	public String bookMain() {
		
>>>>>>> Stashed changes
		return "book/book/bookList";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
