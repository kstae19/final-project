package com.kh.eco.challenge.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @NoArgsConstructor @ToString
public class Challenge {

	private int challengeNo;
	private String challengeTitle;
	private String challengeContent;
	private String challengePlace;
	
	private int achievementCount;
	private int successLimit;
	private int minParticipant;
	private int maxParticipant;
	
	private String status;
	private int viewCount;
	private int likeCount;
	private String originName;
	private String changeName;
	
	private Date uploadDate;
	private Date modifyDate;
	private Date startDate;
	private Date endDate;
	
	private int userNo;
	private int categoryNo;

}
