package com.kh.eco.product.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor @Getter @Setter @ToString
public class ProductReview {
	private int reviewNo;
	private int optionNo;
	private int orderNo;
	private int userNo;
	private String option;
	private String reviewTitle;
	private String reviewContent;
	private double starRate;
	private String originName;
	private String changeName;
}