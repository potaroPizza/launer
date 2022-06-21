package com.ez.launer.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminManageController {

	private static final Logger logger
		= LoggerFactory.getLogger(AdminManageController.class);
	
	@RequestMapping("/stores")
	public String stores() {
		logger.info("지점관리 페이지");
		
		return "/admin/manage/stores";
	}
	
	@RequestMapping("/users")
	public String users() {
		logger.info("회원관리 페이지");
		
		return "/admin/manage/users";
	}
	
}
