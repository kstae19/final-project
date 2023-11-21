package com.kh.eco.product.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor @Getter @Setter @ToString
public class Cart {
	private int userNo;
	private int qty;
	private int optionNo;
	private int brandNo;
	private int productNo;
	private String productName;
	private String brandName;
	private String productInfo;
	private String mainImg;
	private String optionName;
	private int price;
	private int orderNo;
}
