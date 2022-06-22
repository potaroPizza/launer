package com.ez.launer.laundryService.order.model;
import lombok.Data;

@Data
public class OrderDetailVO {
	
	private int no;
	private int orderNo;
	private int categoryNo;
	private int quan;
	private int sum;

}
