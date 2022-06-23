package com.ez.launer.mypage.controller;

import java.util.HashMap;
import java.util.Map;

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

import com.ez.launer.user.model.UserAddressVO;
import com.ez.launer.user.model.UserAllVO;
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

	@PostMapping("/useredit")
	public String edit_post(@ModelAttribute UserAllVO vo,
			HttpSession session, Model model) {
		int no=1000;
		//		String userid=(String)session.getAttribute("userid");

		vo.setNo(no);
		logger.info("회원정보 수정, UserAllVO={}", vo);

		String hp=vo.getHp();
		vo.setHp(hp);


		String address=vo.getAddress(); 
		String addressDetail=vo.getAddressDetail();

		vo.setAddress(address); 
		vo.setAddressDetail(addressDetail);


		String msg="비밀번호 체크 실패", url="/mypage/useredit";
		int result=userService.checkLogin(vo.getNo(), vo.getPwd());
		logger.info("회원정보 수정 - 비밀번호 확인 결과, result ={}", result);

		if(result==userService.LOGIN_OK) {
			int cnt = userService.updateUserHp(vo);
			logger.info("회원정보 수정 결과, cnt ={}", cnt);
			int cnt2 = userService.updateUserAddress(vo);
			logger.info("회원정보 수정 결과, cnt2={} ", cnt2);


			if(cnt>0 && cnt2>0) { 
				msg="회원정보를 수정하였습니다.";
			}else { msg="회원정보 수정 실패"; }

		}else if(result==userService.DISAGREE_PWD) {
			msg="비밀번호가 일치하지 않습니다.";			
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "/common/message";

	}

	@GetMapping("/editPwd")
	public String editPwd_get(HttpSession session,
			Model model) {
		int no=1000;
		//String userid=(String)session.getAttribute("userid");
		logger.info("비밀번호 변경 화면, 파라미터 userid={}", no);

		UserVO vo= userService.selectById(no);
		logger.info("회원 정보 조회 결과, vo={}",vo);

		model.addAttribute("vo",vo);

		return "/mypage/editPwd";
	}

	@PostMapping("/editPwd")
	public String editPwd_post(@ModelAttribute UserVO vo, @RequestParam String newPwd,
			HttpSession session, Model model) {
		int no=1000;
		//String userid=(String)session.getAttribute("userid");
		vo.setNo(no);
		logger.info("비밀번호 변경, vo={} ,파라미터 newPwd={}",vo,newPwd);

		int result=userService.checkLogin(vo.getNo(), vo.getPwd());
		logger.info("비밀번호 변경 처리, 비밀번호 조회 결과 result={}", result);
		
		
		vo.setPwd(newPwd);
		logger.info("변경된 비밀번호, newPwd={}",newPwd);
		String msg="비밀번호 체크 실패",url="/mypage/editPwd";
		if(result == userService.LOGIN_OK) {
			int cnt=userService.editPwd(vo);
			if(cnt>0) {
				msg="비밀번호가 변경되었습니다.";
				url="/mypage/myinfo";
			}else {
				msg="비밀번호 변경 실패";				
			}
		}else if(result==userService.DISAGREE_PWD) {
			msg="비밀번호가 일치하지 않습니다.";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "/common/message";


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

		String msg="비밀번호 체크 실패",url="/mypage/withdraw";
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
