package com.kh.eco.product.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString @AllArgsConstructor @NoArgsConstructor
public class Address {
	private int addressNo;
	private int userNo;
	private int post;
	private String address;
	private String detailAddress;
	private String receiver;
	private String phone;
}
