package com.kh.eco.product.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor @AllArgsConstructor @Getter @ToString @Setter
public class Order {
	private int orderNo;
	private int addressNo;
	private int userNo;
	private int optionNo;
	private int qty;
	private String orderDate;
	private ArrayList<OrderItem> items;
}
