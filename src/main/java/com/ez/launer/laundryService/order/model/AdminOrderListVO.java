package com.ez.launer.laundryService.order.model;

import java.util.List;

import lombok.Data;

@Data
public class AdminOrderListVO {
	private List<OrderVO> orderItems;
}
