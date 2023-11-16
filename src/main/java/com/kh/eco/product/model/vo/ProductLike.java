package com.kh.eco.product.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor @Getter @Setter @ToString
public class ProductLike {
	private int productNo;
	private int userNo;
	private String addDate;
}
