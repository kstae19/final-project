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
public class BookReport {
	
	private int bookReportNo;
	private int bookReportNotice;
	private String bookReportTitle;
	private String bookReportContent;
	private Date bookReportDate;
	private int bookReportCount;
	private String bookReportStatus;
	private String userId;
	private int bookReportSecret;
	private int bookReportStar;

}
