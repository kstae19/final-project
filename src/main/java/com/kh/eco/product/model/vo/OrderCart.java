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
}
