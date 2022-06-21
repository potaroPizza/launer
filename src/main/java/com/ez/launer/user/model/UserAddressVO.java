package com.ez.launer.user.model;

import lombok.Data;

@Data
public class UserAddressVO{
	private int no;
	private int usersNo;
	private int ofiiceNo;
	private String address;
	private String addressDetail;
	private String zipcode;
	private double lonX;
	private double latY;
	private String entermethod;
	
	
}
