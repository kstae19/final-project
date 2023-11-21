package com.kh.eco.product.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor @AllArgsConstructor @Getter @ToString @Setter
public class OrderCart {
	private int userNo;
	private ArrayList<Cart> itemList = new ArrayList();
	
//	public void setUserNo(int userNo) {
//		this.userNo = userNo;
//	}
//	public void setItemList(OrderItem item) {
//		ArrayList<OrderItem> itemList = new ArrayList<OrderItem>();
////		OrderItem item = new OrderItem();
////		item.setOptionNo(optionNo);
////		item.setQty(qty);
//		itemList.add(item);
//		this.itemList = itemList;
//	}

	
}
