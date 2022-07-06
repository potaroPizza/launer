package com.ez.launer.user.controller;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.launer.user.model.DriverAllVO;
import com.ez.launer.user.model.SHA256Encryption;
import com.ez.launer.user.model.UserService;
import com.ez.launer.user.model.UserVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/user")
@RequiredArgsConstructor
public class LoginController {
	private static final Logger logger
	=LoggerFactory.getLogger(LoginController.class);
	
	private static final Logger accessLogger
	=LoggerFactory.getLogger("accessLogger");

	
	private final UserService userService;
	private final SHA256Encryption sha256;
	

	@GetMapping("/login")
	public String login_get() {

		logger.info("로그인 화면");
		
		
		return "/user/login";
	}

	@PostMapping("/login")
	public String login_post(@ModelAttribute UserVO vo,
		@RequestParam(required = false) String saveUseremail,
		HttpServletRequest request,HttpServletResponse response, 
		Model model) throws NoSuchAlgorithmException {
		logger.info("로그인 처리, 파라미터 vo={}, saveUseremail={}", vo, saveUseremail);
		
		
		String pwd = sha256.encrypt(vo.getPwd());
		vo.setPwd(pwd);

		int result=userService.loginChk(vo.getEmail(), vo.getPwd());
		logger.info("로그인 처리 결과 result={}", result);
		
		
		String msg="로그인 처리 실패", url="/user/login";
		if(result==UserService.LOGIN_OK) {
			UserVO uVo=userService.selectByEmail(vo.getEmail());
			logger.info("로그인 처리-회원정보 조회결과 uVo={}", uVo);

			//accesslog 추가
			accessLogger.info("userNO={}",uVo.getNo());

			HttpSession session=request.getSession();
			session.setAttribute("email", vo.getEmail());
			session.setAttribute("name", uVo.getName());
			session.setAttribute("no", uVo.getNo());
			
			Cookie ck = new Cookie("chkUseremail", vo.getEmail());
			ck.setPath("/");
			if(saveUseremail!=null) {  //아이디 저장하기 체크한 경우
				ck.setMaxAge(1000*24*60*60);
				response.addCookie(ck);
			}else {
				ck.setMaxAge(0);  //쿠키 제거
				response.addCookie(ck);				
			}
			
			msg=uVo.getName() +"님 로그인되었습니다.";
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
	
	@GetMapping("/findId")
	public void findId() {
		logger.info("이메일 찾기 화면");

	}
	
	@PostMapping("/findId")
	public String findId_post(@ModelAttribute UserVO vo, DriverAllVO dvo,
			@RequestParam int searchType, Model model) {
		String result="";
		
		if(searchType==1) {
			logger.info("일반회원 이메일 찾기, 파라미터 vo={}, searchType={}",vo, searchType);
				
			result=userService.findEmail(vo);
			if(result==null || result.isEmpty()) {
				result="해당 정보와 일치하는 이메일이 존재하지 않습니다";
			}
			
			logger.info("일반회원 이메일 찾기 정보 결과 result={}", result);
			model.addAttribute("result", result);

		}else if(searchType==2) {
			logger.info("배송기사 이메일 찾기, 파라미터 vo={}, searchType={}",dvo, searchType);
			
			result=userService.findDmail(dvo);
			if(result==null || result.isEmpty()) {
				result="해당 정보와 일치하는 이메일이 존재하지 않습니다";
			}
			
			logger.info("배송기사 이메일 찾기 정보 결과 result={}", result);
			model.addAttribute("result", result);
			
		}
		
		return "/user/findId";
	}
	
	@GetMapping("/findPwd")
	public void findPwd() {
		logger.info("비밀번호 찾기 화면");

	}
	
	@GetMapping("/findId_modal")
	public void findId_modal() {
		logger.info("아이디 찾기 모달");

	}

	
}