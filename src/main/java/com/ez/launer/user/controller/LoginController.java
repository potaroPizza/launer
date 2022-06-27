package com.ez.launer.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ez.launer.user.model.KakaoAPI;

@Controller
@RequestMapping("/user")
public class LoginController {
	private static final Logger logger
	=LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
    private KakaoAPI kakao;
	
	@RequestMapping("/login")
	public String loging_get() {
		logger.info("로그인 화면");
		
		return "/user/login";
	}
	
	@RequestMapping("/login_kakao")
	public String kakaoCallback(@RequestParam ("code")String code) {

		
		String access_Token = kakao.getAccessToken(code);
		logger.info("controller access_token ={} " , access_Token);
		
		 return "/user/login";
	}
	
	@GetMapping("/findId")
	public void findId() {
		logger.info("아이디 찾기 화면");

	}
	
	@GetMapping("/findPwd")
	public void findPwd() {
		logger.info("비밀번호 찾기 화면");

	}
	
}