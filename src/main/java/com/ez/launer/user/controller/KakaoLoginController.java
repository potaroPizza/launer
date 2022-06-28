package com.ez.launer.user.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ez.launer.user.model.KakaoAPI;
import com.ez.launer.user.model.KakaoLoginVO;
import com.ez.launer.user.model.UserService;
import com.ez.launer.user.model.UserVO;

import lombok.RequiredArgsConstructor;


@Controller
@RequestMapping("/user/kakaoLogin")
@RequiredArgsConstructor
public class KakaoLoginController {
	
	private static final Logger logger
	 = LoggerFactory.getLogger(KakaoLoginController.class);
	
	
	@Autowired
    private KakaoAPI kakao;
	private final UserService userService;
	
	
	
	
//한서현 카카오로그인
	
	@ResponseBody
	@RequestMapping("/requestToken")
	public String kakaoLogin(@RequestParam ("code")String code,Model model) {
		
		logger.info("카카오로그인컨트롤러");
		
		//accessToken 발급받기
		String access_Token = kakao.getAccessToken(code);
		logger.info("controller access_token ={} " , access_Token);
		
		//user email과 name 받아오기 
		HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
		logger.info("userInfo={}",userInfo);
		
		String name = (String)userInfo.get("name");
		String email = (String)userInfo.get("email");
		String kakaoId = (String)userInfo.get("kakoId");
		
		UserVO userVo = new UserVO();
		
		//받아온 email,name => 세션에 저장
		if (userInfo.get("email") != null) {
			
			userVo.setName(name);
			userVo.setEmail(email);
			/*
			 * userVo.setPwd(kakaoId); userVo.setSocialLoginKey(kakaoId);
			 */

		}
		
		int cnt = userService.insertKakaoUser(userVo);
		logger.info("카카오회원가입결과={}",cnt);
		
		
		model.addAttribute("kakaoVo", userVo);
		return "/user/kakaoLogin/db";
	}
	
	
}
