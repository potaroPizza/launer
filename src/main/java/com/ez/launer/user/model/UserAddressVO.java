package com.ez.launer.user.model;

import lombok.Data;

@Data
public class UserAddressVO{
	private int no;
	private int usersNo;
	private int officeNo;
	private String address;
	private String addressDetail;
	private String zipcode;
	private double lonX;
	private double latY;
	private String entermethod;
	
	
}
