package com.kh.eco.product.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor @AllArgsConstructor @Getter @Setter @ToString
public class KakaoPay {
	private String cid;
	private String partnerOrderId;
	private String partnerUserId;
	private String itemName;
	private int quantity;
	private int totalAmount;
	private int taxFreeAmount;
	private int userNo;
	
}
