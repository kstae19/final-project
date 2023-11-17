package com.kh.eco.book.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class BookReply {
	
	private String bookReplyDate;
	private String bookReplyContent;
	private String ISBN13;
	private String userId;

}
