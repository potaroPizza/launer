package com.ez.launer.payment.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ez.launer.payment.model.PaymentService;
import com.ez.launer.payment.model.PaymentVO;
import com.ez.launer.user.model.UserService;
import com.ez.launer.user.model.UserVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/laundryService/payment")
@RequiredArgsConstructor
public class PaymentController {
	private static final Logger logger
	 = LoggerFactory.getLogger(PaymentController.class);
	
	private final PaymentService paymentService;
	private final UserService userService;
	
	@GetMapping("/orderPayment")
	public void orderPayment_get() {
		logger.info("결제요청 창");
	}
	
	@GetMapping("/requestPayment")
	public String requestPayment_post(Model model, int orderNo,int payPrice, RedirectAttributes reAttr) {
		logger.info("requestPayment");
		
		PaymentVO paymentVo = new PaymentVO();
		paymentVo.setNo(orderNo);
		paymentVo.setPayPrice(payPrice);
		
		int result = paymentService.insertPaymentDetail(paymentVo);
		logger.info("result={}",result);
		
		reAttr.addAttribute("paymentCode", paymentVo.getPaymentCode());
		
		return "/launer/laundryService/payment/orderPayment";
	}
	
	
	
}
