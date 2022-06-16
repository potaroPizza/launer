package com.ez.launer.laundryService.order.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
@RequestMapping("/laundryService/order")

public class orderController {
	
	private static final Logger logger
		 = LoggerFactory.getLogger(orderController.class);
	
	
	@GetMapping("/orderMake")
	public String orderMake_get() {
		logger.info("수거요청화면");
		
		return "/laundryService/order/orderMake";
		
	}
	
	@GetMapping("/orderConfirm")
	public String orderConfirm_get() {
		logger.info("결제전 최종확인 화면");
		
		return "/laundryService/order/orderConfirm";
	}
	
	
}
