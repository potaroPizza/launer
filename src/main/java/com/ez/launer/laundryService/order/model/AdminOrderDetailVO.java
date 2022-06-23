package com.ez.launer.laundryService.order.model;

import java.util.List;
import java.util.Map;

import lombok.Data;

@Data
public class AdminOrderDetailVO {
	private Map<String, Object> adminOrderDetailVo;
	private List<Map<String, Object>> adminOrderDetailList;
}
