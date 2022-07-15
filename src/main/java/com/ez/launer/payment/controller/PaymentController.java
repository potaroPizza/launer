package com.ez.launer.payment.controller;

import javax.servlet.http.HttpSession;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ez.launer.laundryService.order.model.OrderService;
import com.ez.launer.laundryService.order.model.SmsAPI;
import com.ez.launer.payment.model.PaymentService;
import com.ez.launer.payment.model.PaymentVO;
import com.ez.launer.user.model.UserService;
import com.ez.launer.user.model.UserVO;

import lombok.RequiredArgsConstructor;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
@RequestMapping("/laundryService/payment")
@RequiredArgsConstructor
public class PaymentController {
	private static final Logger logger
	 = LoggerFactory.getLogger(PaymentController.class);
	
	private final PaymentService paymentService;
	private final UserService userService;
	private final OrderService orderService;
	private final SmsAPI smsApi;
	
	@GetMapping("/orderPayment")
	public void orderPayment_get() {
		logger.info("결제요청 창");
	}
	
	//결제요청
	@GetMapping("/requestPayment")
	public String requestPayment_post(Model model, int orderNo,int payPrice, int savePoint,int userPoint, RedirectAttributes reAttr,
			HttpSession session) {
		int no = (int) session.getAttribute("no");
		
		System.out.println("fk주문번호="+orderNo);
		System.out.println("결제금액="+payPrice);
		System.out.println("userPoint="+userPoint);
		
		PaymentVO paymentVo = new PaymentVO();
		paymentVo.setOrderNo(orderNo);
		paymentVo.setPayPrice(payPrice);
		
		int result = paymentService.insertPaymentDetail(paymentVo);
		logger.info("결제성공여부 result={}",result);
		
		int rs = 0;
		if(result>0) {
			
			try {
				UserVO userVo = userService.selectById(no);
				String hp = userVo.getHp();
				String name = userVo.getName();
				smsApi.sendSms(hp,orderNo,name,payPrice,savePoint);
				logger.info("sms 전송완료");
			} catch (CoolsmsException e) {
				e.printStackTrace();
			}
			
			//orders 테이블 paymentDate null => sysdate
			rs = orderService.updatePaymentDate(orderNo);
			System.out.println("결제일(date)update="+rs);
		}

		reAttr.addAttribute("paymentCode", paymentVo.getPaymentCode());
		reAttr.addAttribute("paymentStatus", rs);

		return "/launer/laundryService/payment/orderPayment";
	}
	
	//결제 실패 시
	@GetMapping("/paymentFailed")
	public String paymentFailed_get(HttpSession session,Model model,int savePoint,int orderNo, int payPrice, int userPoint) {
		int no = (int) session.getAttribute("no");

		logger.info("결제실패, orderNo={}",orderNo);
		logger.info("결제실패, payPrice={}",payPrice);
		logger.info("결제실패, userPoint={}",userPoint);
		
		UserVO userVo = userService.selectById(no);
		logger.info("userVo={}",userVo);
		
		userVo.setPoint(userPoint);
		System.out.println("업데이트예정 point ="+userVo.getPoint());

		int rs = orderService.updateUserPoint(userVo);
		logger.info("결제취소, 업데이트 포인트 결과={}",rs);
		return "/launer";
	}
	
	
	
}
