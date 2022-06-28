package com.ez.launer.payment.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class PaymentViewVO {
	
	private int orderNo;
	private int usersNo;
	private int statusNo;
	private Timestamp regdate;
	private int totalPrice;
	private String categoryName;
	private String status;
	
}
