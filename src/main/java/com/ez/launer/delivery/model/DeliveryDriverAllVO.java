package com.ez.launer.delivery.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class DeliveryDriverAllVO {
	private int no;
	private int usersClassNo;
	private int accountInfoNo;
	private int officeNo;
	private String name;
	private String email;
	private String pwd;
	private String hp;
	private Timestamp lastDate;
	private Timestamp startDate;
	private Timestamp outDate;
	private String bank;
	private long accountNumber;
	private String accountHolder;
	private String officeName;
}
