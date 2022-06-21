package com.ez.launer.mypage.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.launer.user.model.UserService;
import com.ez.launer.user.model.UserVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/mypage")
public class MypageController {

	private static final Logger logger
	=LoggerFactory.getLogger(MypageController.class);

	private final UserService userService;
	
	

	@GetMapping("/mypage") 
	public String mypage_get(HttpSession session, 
			Model model) { 
		int no=1000;
		//String userid=(String)session.getAttribute("userid");
		logger.info("마이페이지 화면, 파라미터 userid={}", no);

		UserVO vo= userService.selectById(no);
		logger.info("회원 정보 조회 결과, vo={}",vo);

		model.addAttribute("vo",vo);

		return "/mypage/mypage";

	}
	@GetMapping("/mypoint")
	public String mypoint(HttpSession session, 
			Model model) {
		int no=1000;
		//String userid=(String)session.getAttribute("userid");
		logger.info("마이페이지 포인트 화면, 파라미터 userid={}", no);

		UserVO vo= userService.selectById(no);
		logger.info("회원 정보 조회 결과, vo={}",vo);

		model.addAttribute("vo",vo);
		
		return "/mypage/mypoint";
	}
	@GetMapping("/myinfo")
	public String myinfo(HttpSession session, 
			Model model) {
		int no=1000;
		//String userid=(String)session.getAttribute("userid");
		logger.info("마이페이지 내정보 화면, 파라미터 userid={}", no);

		HashMap<String, Object> map= userService.selectByIdAddress(no);
		logger.info("회원 정보 조회 결과, map={}",map);

		model.addAttribute("map",map);
		
		return "/mypage/myinfo";
	}
	
	@GetMapping("/useredit") 
	public String edit_get(HttpSession session, 
			Model model) { 
		int no=1000;
		//String userid=(String)session.getAttribute("userid");
		logger.info("회원정보 수정 화면, 파라미터 userid={}", no);

		HashMap<String, Object> map= userService.selectByIdAddress(no);
		logger.info("회원 정보 조회 결과, map={}",map);

		model.addAttribute("map",map);

		return "/mypage/useredit";

	}
	
	@GetMapping("/withdraw")
	public String userdelete_get(HttpSession session, Model model) {
		logger.info("회원 탈퇴 화면");
		int no=1000;
		//String userid=(String)session.getAttribute("userid");
		logger.info("회원탈퇴 화면, 파라미터 no={}", no);

		UserVO vo= userService.selectById(no);
		logger.info("회원 정보 조회 결과, vo={}",vo);

		model.addAttribute("vo",vo);
		
		return "/mypage/withdraw";
	}
	
	@PostMapping("/withdraw")
	public String userdelete_post(@RequestParam String pwd,
			HttpSession session, HttpServletResponse response,
			Model model) {
		int no=1000;
		
		//String userid=(String)session.getAttribute("userid");
		logger.info("회원 탈퇴 처리, 파라미터 no={}, pwd={}",no,pwd);
		
		int result=userService.checkLogin(no, pwd);
		logger.info("회원 탈퇴 처리, 비밀번호 조회 결과 result={}", result);
		
		String msg="비밀번호 체크 실패",url="/launer/mypage/withdraw";
		if(result == userService.LOGIN_OK) {
			int cnt=userService.deleteUser(no);
			if(cnt>0) {
				msg="회원탈퇴 처리가 되었습니다.";
				url="/mypage/signout";
				/*
				  session.invalidate();
				  
				  Cookie ck = new Cookie("ckUserid", userid);
				   ck.setPath("/"); 
				   ck.setMaxAge(0);
				  response.addCookie(ck);
				 */
			}else {
				msg="회원탈퇴 실패";				
			}
		}else if(result==userService.DISAGREE_PWD) {
			msg="비밀번호가 일치하지 않습니다.";
		}
		
		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		//4
		return "/common/message";
	}
	
	
	
	@GetMapping("/paymentdetails")
	public void paymentdetails() {
		logger.info("마이페이지 결제내역 화면");
	}
	@GetMapping("/detailedPaymentHistory")
	public void detailedPaymentHistory() {
		logger.info("마이페이지 결제내역 상세 화면");
	}
	@GetMapping("/signout")
	public void singOut() {
		logger.info("탈퇴 완료 페이지 화면");
	}
}
