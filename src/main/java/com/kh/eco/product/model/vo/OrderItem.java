package com.kh.eco.product.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor @AllArgsConstructor @Getter @ToString @Setter
public class OrderItem {
	private int orderNo;
	private int optionNo;
	private String orderDate;
	private int qty;
}
