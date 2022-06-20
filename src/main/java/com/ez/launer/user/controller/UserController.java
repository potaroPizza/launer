package com.ez.launer.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/user")
@RequiredArgsConstructor
public class UserController {
	private static final Logger logger
	=LoggerFactory.getLogger(UserController.class);
	
	
	@GetMapping("/useredit")
	public void userEdit() {
		logger.info("회원정보 수정 화면");
	}
	
}
