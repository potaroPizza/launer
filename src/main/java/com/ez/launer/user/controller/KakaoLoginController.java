package com.ez.launer.user.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javax.servlet.http.Cookie;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.launer.user.model.KakaoAPI;
import com.ez.launer.user.model.UserAddressVO;
import com.ez.launer.user.model.UserService;
import com.ez.launer.user.model.UserVO;

import lombok.RequiredArgsConstructor;


@Controller
@RequestMapping("/user/kakaoLogin")
@RequiredArgsConstructor
public class KakaoLoginController {
	
	private static final Logger logger
	 = LoggerFactory.getLogger(KakaoLoginController.class);

    private final KakaoAPI kakao;
	private final UserService userService;
	
	
	
	
//한서현 카카오로그인
	
	@RequestMapping(value = "/requestToken")
	public String kakaoLoginRequestToken(@RequestParam ("code")String code,Model model,
			HttpServletRequest request) {
		
		logger.info("카카오로그인컨트롤러 code ={}",code );
		model.addAttribute("code",code);

		//accessToken 발급받기
		String access_Token = kakao.getAccessToken(code);
		logger.info("controller access_token ={} " , access_Token);
		
		//user email과 name, kakaoId 받아오기 
		HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
		logger.info("userInfo={}",userInfo);
		
		String name = (String)userInfo.get("name");
		String email = (String)userInfo.get("email");
		String socialLoginKey = (String)userInfo.get("socialLoginKey");
		
		//db존재여부 check
		int count = userService.accIsExist(email);
		logger.info("count(*) = {}",count);
		
		UserVO userVo = new UserVO();
		String socialInfo = "";
		
		String url ="/user/login", msg ="로그인처리 실패";
		
		if(count > 0) { //존재하면 social_login_host 받아서 model 저장
			
			
			userVo = userService.selectByEmail(email);
			logger.info("socialInfo={}",socialInfo);
			msg =userVo.getSocialLoginHost() + " 로 로그인되었습니다";
			url = "/";

			
		}else {
			// 존재 X => 회원정보 insert
			if (userInfo.get("email") != null) {

				userVo.setName(name);
				userVo.setEmail(email);
				userVo.setPwd(socialLoginKey); 
				userVo.setSocialLoginKey(socialLoginKey);
				logger.info("미가입회원 userVo ={}",userVo);
			}
			//users insert
			int cnt = userService.insertKakaoUser(userVo);
			
			//users_address insert
			UserVO vo= userService.selectByEmail(email);
			UserAddressVO addressvo = new UserAddressVO();
			addressvo.setUsersNo(vo.getNo());
			
			int addressCnt = userService.insertAddressOnlyPart(addressvo);
			logger.info("userAddress result ={}",addressCnt);
			
			logger.info("카카오 회원가입결과={}",cnt);
			url ="/";
			msg =name+ "님, 회원가입을 축하드립니다";
		} //if
		
		
		//session 저장
		HttpSession session=request.getSession();
		session.setAttribute("no", userVo.getNo());
		session.setAttribute("email", userVo.getEmail());
		session.setAttribute("access_Token",access_Token); //로그아웃때 필요한 accessToken
		session.setAttribute("classNo", String.valueOf(userVo.getUserCode()));
		

		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@RequestMapping(value="/logout")
	public String logout(HttpSession session, Model model) {
	    kakao.kakaoLogout((String)session.getAttribute("access_Token"));
	    session.removeAttribute("access_Token");
	    session.removeAttribute("no");
	    session.removeAttribute("email");
	    
	    String url = "/", msg ="로그아웃되었습니다";
	    
	    model.addAttribute("url",url);
	    model.addAttribute("msg",msg);
	    
	    return "common/message";
	}
}
