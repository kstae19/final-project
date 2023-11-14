package com.kh.eco.user.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor @Getter @Setter @ToString
public class User {
	private int userNo; // USER_NO	NUMBER
	private String userId; // USER_ID	VARCHAR2(50 BYTE)
	private String userPwd; // USER_PWD	VARCHAR2(50 BYTE)
	private String userName; // USER_NAME	VARCHAR2(50 BYTE)
	private String email; // EMAIL	VARCHAR2(50 BYTE)
	private String phone; // PHONE	VARCHAR2(13 BYTE)
	private int point; // POINT	NUMBER
	private int post; // POST NUMBER NULL,
	private String address; // ADDRESS VARCHAR2(200) NULL,
	private String detailAddress; // DETAIL_ADDRESS VARCHAR2(50) NULL,
	private String userStatus; // USER_STATUS	CHAR(1 BYTE)
	private Date enrollDate; // ENROLL_DATE	DATE
}
