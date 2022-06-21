package com.ez.launer.mypage.controller;

import java.util.HashMap;

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
@RequiredArgsConstructor
@RequestMapping("/mypage")
public class MypageController {

	private static final Logger logger
	=LoggerFactory.getLogger(MypageController.class);

	private final UserService userService;
	
	@GetMapping("/withdraw")
	public void memberdelete() {
		logger.info("회원탈퇴 화면");
	}

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

		return "/user/useredit";

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
