package com.ez.launer.payment.model;

import java.security.Timestamp;

import lombok.Data;

@Data
public class PaymentVO {
	private int no;
	private int orderNo;
	private String paymentCode;
	private String paymentMethod;
	private int payPrice;
	private String paymentState;
	private Timestamp paymentDate;
	
	

}
