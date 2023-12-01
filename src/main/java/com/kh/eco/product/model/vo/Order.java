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
	private String orderDate;
	private int itemQty;
	private int totalPrice;
	private String total;
	private String productName;
	private ArrayList<OrderItem> items;
	private ArrayList<Cart> orderDetail;
}
