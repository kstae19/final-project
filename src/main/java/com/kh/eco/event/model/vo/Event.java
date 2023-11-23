package com.kh.eco.event.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @NoArgsConstructor @ToString
public class Event {
	
	private int eventNo;
	private String eventTitle;
	private String eventContent;
	private String eventPlace;
	private String eventDate;
	
	private String status;
	private String originName;
	private String changeName;
	private Date uploadDate;
	private Date modifyDate;
	
	private int participants;
	private int categoryNo;
}
