package com.kh.eco.eventBoard.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor @Getter @Setter @ToString
public class Reply {
	
	private int replyNo;
	private String replyContent;
	private String replyWriter;
	private int refBno;
	private String createDate;
	private String status;
		
}
