package com.ez.launer.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class LoginController {
	private static final Logger logger
	=LoggerFactory.getLogger(LoginController.class);
	
	@RequestMapping("/login")
	public void register() {
		logger.info("로그인 화면");

	}
	
	@RequestMapping("/findId")
	public void findId() {
		logger.info("아이디 찾기 화면");

	}
	
	@RequestMapping("/findPwd")
	public void findPwd() {
		logger.info("비밀번호 찾기 화면");

	}
}