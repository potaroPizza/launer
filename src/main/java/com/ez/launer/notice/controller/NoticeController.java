package com.ez.launer.notice.controller;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.launer.admin.controller.AdminController;
import com.ez.launer.notice.model.NoticeService;
import com.ez.launer.notice.model.NoticeVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class NoticeController {
	
	private static final Logger logger
		= LoggerFactory.getLogger(AdminController.class);

	private final NoticeService noticeService;
	
	@RequestMapping("/noticeAll")
	public String selectAll(Model model) {
		logger.info("사내공지사항 더보기 페이지");
		
		List<NoticeVO> list = noticeService.selectAll();
		logger.info("사내공지사항 더보기 페이지 - 전체조회 결과, list.size={}", list.size());
		
		model.addAttribute("list", list);
		
		return "/admin/noticeAll";
	}
	
	//ajax - 공지사항 등록
	@RequestMapping("/insertNotice")
	public HashMap<String, Object> insertNotice(@RequestParam HashMap<String, Object> param,
			Model model) {
		logger.info("사내공지사항 등록 처리");
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		return result;
	}
	
	//ajax - 공지사항 삭제
	@RequestMapping("/deleteNotoce")
	public HashMap<String, Object> deleteNotoce(@RequestParam HashMap<String, Object> param,
			Model model) {
		logger.info("사내공지사항 삭제 처리");
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
