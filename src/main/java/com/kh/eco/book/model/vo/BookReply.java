package com.kh.eco.book.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class BookReply {
	
	private int bookReplyNo;
	private Date bookReplyDate;
	private String bookReplyContent;
	private String ISBN13;
	private int userNo;

}
