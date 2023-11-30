package com.kh.eco.eventBoard.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@NoArgsConstructor
@ToString
public class EventBoard {
	
	private int bNo; //BNO	NUMBER
	private String title; //TITLE	VARCHAR2(100 BYTE)
	private String content; //CONTENT	VARCHAR2(4000 BYTE)
	private String writer; //WRITER	VARCHAR2(50 BYTE)
	private Date regDate; //REGDATE	DATE
	private int viewCount; //VIEWCOUNT	NUMBER
	private String originName;
	private String changeName;
	private String status;

}
