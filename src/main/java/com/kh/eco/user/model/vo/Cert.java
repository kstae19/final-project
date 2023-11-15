package com.kh.eco.user.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data @AllArgsConstructor @Builder
public class Cert {
	private String certEmail; // CERT_EMAIL	VARCHAR2(40 BYTE)
	private String certSecret; // CERT_SECRET	VARCHAR2(6 BYTE)
	private Date certDate; // CERT_DATE	DATE
}
