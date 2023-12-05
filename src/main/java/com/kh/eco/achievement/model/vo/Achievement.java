package com.kh.eco.achievement.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @NoArgsConstructor @ToString
public class Achievement {

	private int achievementNo;
	private int activityNo;
	private int userNo;
	private String achievementTitle;
	private String achievementContent;
	private String originName;
	private String changeName;
	private Date uploadDate;
	private Date modifyDate;
	private String status;
	
}
