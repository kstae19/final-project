package com.kh.eco.product.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor @Getter @Setter @ToString
public class ProductReview {
	private int reviewNo;
	private String option;
	private int orderNo;
	private String reviewTitle;
	private String reviewContent;
	private double starRate;
}
