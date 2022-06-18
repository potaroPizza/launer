package com.ez.launer.admin.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.launer.notice.model.NoticeService;
import com.ez.launer.notice.model.NoticeVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminController {
	
	private static final Logger logger
		= LoggerFactory.getLogger(AdminController.class);
	
	private final NoticeService noticeService;
	
	@RequestMapping("/")
	public String index(Model model) {
		logger.info("메인 페이지");
		
		List<NoticeVO> list = noticeService.selectTopTen();
		logger.info("사내공지 게시판 상위 글 10개 조회 결과, list.size={}", list.size());
		
		model.addAttribute("list", list);
		
		return "/admin/index";
	}
	
	@RequestMapping("/test")
	public String test() {
		logger.info("test 페이지");
		
		return "/admin/test";
	}
	
	@RequestMapping("/orders")
	public String orders() {
		logger.info("주문관리 페이지");
		
		return "/admin/orders";
	}
	

	@RequestMapping("/orderDetail")
	public String orderDetail() {
		logger.info("주문상세 페이지");
		
		return "/admin/orderDetail";
	}
	
	@RequestMapping("/charts")
	public String charts() {
		logger.info("통계 페이지");
		
		return "/admin/charts";
	}
	

	@RequestMapping("/stores")
	public String stores() {
		logger.info("지점관리 페이지");
		
		return "/admin/manage/stores";
	}
	
	@RequestMapping("/users")
	public String users() {
		logger.info("회원관리 페이지");
		
		return "/admin/manage/users";
	}

}
