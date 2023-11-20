package com.kh.eco.product.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor @Getter @Setter @ToString
public class Cart {
	private int userNo;
	private String addDate;
	private int qty;
	private Product product;
	private ProductOption option;


}
