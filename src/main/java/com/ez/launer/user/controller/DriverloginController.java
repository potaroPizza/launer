package com.ez.launer.user.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.launer.user.model.DriverVO;
import com.ez.launer.user.model.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/driver")
@RequiredArgsConstructor
public class DriverloginController {
	private static final Logger logger
	=LoggerFactory.getLogger(DriverloginController.class);
	
	private final UserService userService;
	
	@PostMapping("/login")
	public String login_post(@ModelAttribute DriverVO dvo,
		@RequestParam(required = false) String saveDmail, 
		HttpServletRequest request, HttpServletResponse response,Model model){
		logger.info("배송기사 로그인 처리, 파라미터 dvo={}, saveDmail={}", dvo, saveDmail);
		
		int result=userService.dloginChk(dvo.getDmail(), dvo.getDPwd());
		logger.info("배송기사 로그인 처리 결과 result={}", result);
		
		String msg="배송기사 로그인 처리 실패", url="/user/login";
		if(result==UserService.LOGIN_OK) {
			DriverVO drVo=userService.selectByDmail(dvo.getDmail());
			logger.info("배송기사 로그인 처리-회원정보 조회결과 drVo={}", drVo);
			
			HttpSession session=request.getSession();
			session.setAttribute("dmail", dvo.getDmail());
			session.setAttribute("name", drVo.getName());
			session.setAttribute("no", drVo.getNo());
			logger.info("세션 확인 session={}",session);
			
			Cookie ck2 = new Cookie("chkDmail", dvo.getDmail());
			ck2.setPath("/");
			if(saveDmail!=null) {  //아이디 저장하기 체크한 경우
				ck2.setMaxAge(1000*24*60*60);
				response.addCookie(ck2);
			}else {
				ck2.setMaxAge(0);  //쿠키 제거
				response.addCookie(ck2);				
			}
			logger.info("쿠키 체크 ck2={}",ck2);
			
			msg=drVo.getName() +"기사님 오늘도 화이팅!";
			url="/";
		}else if(result==UserService.DISAGREE_PWD) {
			msg="비밀번호가 일치하지 않습니다.";
		}else if(result==UserService.NONE_USEREMAIL) {
			msg="해당 이메일이 존재하지 않습니다.";			
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "/common/message";
	}

}
