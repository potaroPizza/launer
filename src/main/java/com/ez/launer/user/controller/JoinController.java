package com.ez.launer.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class JoinController {
	private static final Logger logger
	=LoggerFactory.getLogger(JoinController.class);
	
	@RequestMapping("/join")
	public void register() {
		logger.info("회원가입 화면");

	}
}

