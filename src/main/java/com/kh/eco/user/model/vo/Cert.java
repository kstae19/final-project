package com.kh.eco.user.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor @Getter @Setter @ToString
public class Cert {
	private String certEmail; // CERT_EMAIL	VARCHAR2(40 BYTE)
	private String cerSecret; // CERT_SECRET	VARCHAR2(6 BYTE)
	private Date certDate; // CERT_DATE	DATE
	private int userNo; // USER_NO	NUMBER
}
