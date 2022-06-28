package com.ez.launer.payment.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class PaymentHistoryViewVO {
	
	private int orderNo;
	private int usersNo;
	private String categoryName;
	private int price;
	private int totalPrice;
	private Timestamp regdate;
	private int orderStatusNo;
	private String status;
	private String address;
	private String addressDetail;
	private String entermethod;
	private String orderRequest;
	private String imgurl;

}
