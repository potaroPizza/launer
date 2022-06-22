package com.ez.launer.laundryService.order.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class OrderVO {
	private int no;
	private int usersNo;
	private int usersAddressNo;
	private int orderStatusNo;
	private int pickupDriver;
	private int deliveryDriver;
	private Timestamp regdate;
	private Timestamp paymentDate;
	private int totalPrice;
	private String orderRequest;
	
	

}
