package com.ez.launer.laundryService.order.model;

import java.util.List;

import lombok.Data;

@Data
public class OrderDetailVO {
	
	private int no;
	private int orderNo;
	private int categoryNo;
	private int quan;
	private int sum;
	
	private List<OrderDetailVO> orderVoDetailList;

	public OrderDetailVO() {
		super();
	}
	
	
	public OrderDetailVO(int no, int orderNo, int categoryNo, int quan, int sum,
			List<OrderDetailVO> orderVoDetailList) {
		super();
		this.no = no;
		this.orderNo = orderNo;
		this.categoryNo = categoryNo;
		this.quan = quan;
		this.sum = sum;
		this.orderVoDetailList = orderVoDetailList;
	}



	
	
	
	


}
