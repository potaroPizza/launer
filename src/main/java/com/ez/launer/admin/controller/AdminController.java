package com.ez.launer.admin.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.launer.common.ConstUtil;
import com.ez.launer.common.OrderSearchVO;
import com.ez.launer.common.PaginationInfo;
import com.ez.launer.laundryService.order.model.OrderService;
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
	private final OrderService orderService;
	
	
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
	public String orders(@ModelAttribute OrderSearchVO searchVo,
			Model model) {
		logger.info("주문관리 페이지, 파라미터 searchVo={}", searchVo);
		
		//초기값 설정
		if(searchVo.getCountPerPage() == 0) {	
			searchVo.setCountPerPage(10);
		}
		
		if(searchVo.getStartDay() == null || searchVo.getStartDay().isEmpty()) {
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String str = sdf.format(today);
			searchVo.setStartDay(str);
			searchVo.setEndDay(str);
			
			logger.info("현재일자 셋팅된, searchVo={}", searchVo);
		}
		
		//페이징에 필요한 변수 셋팅
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<Map<String, Object>> list = orderService.adminSelectOrderList(searchVo);
		logger.info("주문내역 출력 결과, list.size={}", list.size());
		
		int totalRecord = orderService.adminSelectTotalRecord(searchVo);
		logger.info("주문내역 출력 결과, totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
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
	
}
