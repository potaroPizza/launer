package com.ez.launer.admin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.launer.user.model.UserService;
import com.ez.launer.user.model.UserVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
public class AdminManageController {

	private static final Logger logger
		= LoggerFactory.getLogger(AdminManageController.class);
	
	private final UserService userService;
	
	@RequestMapping("/stores")
	public String stores() {
		logger.info("지점관리 페이지");
		
		return "/admin/manage/stores";
	}
	
	@RequestMapping("/users")
	public String users(ModelMap model) {
		logger.info("회원관리 페이지");
		
		int userCode = 1;
		List<UserVO> list= userService.selectUser(userCode);
		logger.info("list.size={}",list.size());
		model.addAttribute("list",list);
		model.addAttribute("size",list.size());

		return "/admin/users";
	}
	
}
