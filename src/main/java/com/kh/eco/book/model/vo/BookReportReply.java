package com.kh.eco.book.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class BookReportReply {
	
	private int bookReportReplyNo;
	private Date bookReportDate;
	private String bookReportContent;
	private String userId;
	private int bookReportNo;
	
}
