package com.ez.launer.laundryService.order.model;

import lombok.Data;

@Data
public class OrderViewVO {
	private int usersNo;
	private int addressNo;
	private int point;
	private String name;
	private String email;
}
