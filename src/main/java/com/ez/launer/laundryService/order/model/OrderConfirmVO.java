package com.ez.launer.laundryService.order.model;

import lombok.Data;

@Data
public class OrderConfirmVO {
	private int no;
	private String itemName;
	private int itemPrice;
	private int priceByQty;
	private int totalPrice;
	private String orderRequest;
	
	
	
	
}
