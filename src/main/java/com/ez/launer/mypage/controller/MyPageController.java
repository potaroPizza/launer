package com.ez.launer.mypage.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
public class MyPageController {

	private static final Logger logger
	=LoggerFactory.getLogger(MyPageController.class);


	@GetMapping("/withdraw")
	public void memberdelete() {
		logger.info("회원탈퇴 화면");
	}

	@GetMapping("/mypage")
	public void mypage() {
		logger.info("마이페이지 화면");
	}
	@GetMapping("/userEdit")
	public void userEdit() {
		logger.info("회원정보 수정 화면");
	}
	@GetMapping("/paymentDetails")
	public void paymentDetails() {
		logger.info("마이페이지 결제내역 화면");
	}
	@GetMapping("/mypoint")
	public void mypoint() {
		logger.info("마이페이지 포인트 화면");
	}
	@GetMapping("/detailedPaymentHistory")
	public void detailedPaymentHistory() {
		logger.info("마이페이지 결제내역 상세 화면");
	}
}
