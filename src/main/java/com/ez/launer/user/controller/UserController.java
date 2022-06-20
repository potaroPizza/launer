package com.ez.launer.user.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.launer.user.model.UserService;
import com.ez.launer.user.model.UserVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/user")
@RequiredArgsConstructor
public class UserController {
	private static final Logger logger
	=LoggerFactory.getLogger(UserController.class);

	private final UserService userService;


	@GetMapping("/useredit") 
	public String edit_get(HttpSession session, 
			Model model) { 
		int no=1000;
		//String userid=(String)session.getAttribute("userid");
		logger.info("회원정보 수정 화면, 파라미터 userid={}", no);

		UserVO vo= userService.selectById(no);
		logger.info("회원 정보 조회 결과, vo={}",vo);

		model.addAttribute("vo",vo);

		return "/user/useredit";

	}


}
