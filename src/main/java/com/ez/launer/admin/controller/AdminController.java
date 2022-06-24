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
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.launer.common.ConstUtil;
import com.ez.launer.common.OrderSearchVO;
import com.ez.launer.common.PaginationInfo;
import com.ez.launer.laundryService.order.model.AdminOrderDetailVO;
import com.ez.launer.laundryService.order.model.AdminOrderListVO;
import com.ez.launer.laundryService.order.model.OrderService;
import com.ez.launer.laundryService.order.model.OrderVO;
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
	
	//주문관리 관련 핸들러
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
		pagingInfo.setRecordCountPerPage(searchVo.getCountPerPage());
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		searchVo.setRecordCountPerPage(searchVo.getCountPerPage());
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
	public String orderDetail(@RequestParam(defaultValue = "0") int orderNo,
			Model model) {
		logger.info("주문상세 페이지, 파라미터 orderNo={}", orderNo);
		
		if(orderNo == 0) {
			model.addAttribute("msg", "잘못된 url 접근입니다.");
			model.addAttribute("url", "/admin/orders");
	
			return "/common/message";
		}
		
		AdminOrderDetailVO vo = orderService.adminSelectOrderDetail(orderNo);
		logger.info("주문상세 출력 결과, vo={}", vo);
		
		model.addAttribute("vo", vo);
		
		return "/admin/orderDetail";
	}
	
	@RequestMapping("/ordersUpdateMulti")
	public String ordersUpdateMulti(@ModelAttribute AdminOrderListVO vo,
			Model model) {
		logger.info("주문 다중 픽업대기 처리, 파라미터 AdminOrderListVO={}", vo);
		
		List<OrderVO> list = vo.getOrderItems();
		
		int cnt = orderService.adminOrderStatusUpdateMulti(list);
		
		String msg = "선택한 주문 처리를 실패했습니다.";
		String url = "/admin/orders";
		
		if(cnt > 0) {
			msg = "선택한 주문 처리를 성공했습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "/common/message";
	}
	
	@RequestMapping("/ordersUpdate")
	public String ordersUpdate(@RequestParam(defaultValue = "0") int orderNo,
			Model model) {
		logger.info("주문 픽업대기 처리, 파라미터 orderNo={}", orderNo);
		
		int cnt = orderService.adminOrderStatusUpdate(orderNo);
		
		String msg = "주문 처리를 실패했습니다.";
		String url = "/admin/orders";
		
		if(cnt > 0) {
			msg = "주문 처리를 성공했습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "/common/message";
	}
	
	
	//통계 관련 핸들러
	@RequestMapping("/charts")
	public String charts() {
		logger.info("통계 페이지");
		
		return "/admin/charts";
	}
	
}
