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
	private String bookReportReplyDate;
	private String bookReportReplyContent;
	private String userId;
	private int bookReportNo;
	
}
