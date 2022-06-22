package com.ez.launer.laundryService.order.controller;

import java.net.http.HttpRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ez.launer.category.model.CategoryService;
import com.ez.launer.category.model.CategoryVO;
import com.ez.launer.laundryService.order.model.OrderService;
import com.ez.launer.laundryService.order.model.OrderVO;
import com.ez.launer.laundryService.order.model.OrderViewVO;
import com.ez.launer.user.model.UserService;
import com.ez.launer.user.model.UserVO;

import lombok.RequiredArgsConstructor;



@Controller
@RequestMapping("/laundryService/order")
@RequiredArgsConstructor
public class OrderController {
	
	private static final Logger logger
		 = LoggerFactory.getLogger(OrderController.class);
	
	private final CategoryService categoryService;
	private final UserService userService;
	private final OrderService orderService;
	
	
	
	@RequestMapping("/optionInfo")
	@ResponseBody
	public CategoryVO optionInfo(@RequestParam (value="no")int itemNo , Model model, CategoryVO vo){
		logger.info("파라미터 itemNo ={}",itemNo);
	
		vo = categoryService.selectByNo(itemNo);
		logger.info("no로 categoryVO 조회 vo ={}",vo);
		
		return vo;
		
	}
	
	
	@RequestMapping("/orderMakeSelect")
	public String cgSelect(@RequestParam int categoryGroup, Model model) {
		logger.info("카테고리그룹 별 조회 파라미터 groupName={}",categoryGroup);
		
		List<CategoryVO> list = categoryService.selectAllCategory(categoryGroup);
		logger.info("그룹 별 카테고리 조회 결과 list.size={}",list.size());
		
		model.addAttribute("list", list);
		
		return "/laundryService/order/orderMakeSelect";
	}
	
	
	@GetMapping("/orderMake")
	public String orderMake_get() {
		logger.info("수거요청화면");

		return "/laundryService/order/orderMake";
		
	}
	
	

	@RequestMapping("/orderConfirm")
	public String orderConfirm_post(@RequestParam String param, Model model, HttpSession session) {
		logger.info("결제전 최종확인 화면, param_string 파라미터 = {}",param);
		//회원정보 불러오기
		int no = 1000; //(String) session.getAttribute("userid");
		logger.info("결제전 최종확인 화면, 파라미터 userid ={}", no);
		
		UserVO vo = userService.selectById(no);
		
		logger.info("회원정보조회 vo={}",vo);
		

		//주문정보확인
		List<Map<String, Object>> list= new ArrayList<>();
		
		logger.info("파라미터 param={}", param);
		
		String paramString[] = param.split("[|]");
		String setParamString[];
		
		for(String str : paramString) logger.info("분리 후 str={}", str);
		
		
		int result = 0;
		int paramPrice = 0;
		for(int i=0;i<paramString.length;i++) {
			Map<String, Object> map = new HashMap<>();
			setParamString = paramString[i].split(",");
			
			map.put("categoryNo", setParamString[0]);
			map.put("name", setParamString[1]);
			map.put("price", setParamString[2]);
			map.put("quan", setParamString[3]);
			map.put("sum", setParamString[4]);
			
			/*
			logger.info("분해 후 categoryNo={}, name={}, price={}, quan={}, sum={}", 
					setParamString[0], setParamString[1], setParamString[2], setParamString[3], setParamString[4]);
			*/
			
			//총 결제금액 int 로 실어보내기
			paramPrice += Integer.parseInt( setParamString[4]);

			list.add(map);
		}
		
		logger.info("최종금액 ={}",paramPrice);
		/*
		for(Map<String, Object> mmm : list) {
			logger.info("맵 저장 후 categoryNo={}, name={}, price={}, quan={}, sum={}", 
					(String) mmm.get("categoryNo"), (String) mmm.get("name"), 
					(String) mmm.get("price"), (String) mmm.get("quan"), (String) mmm.get("sum"));
		}
		*/
		
		model.addAttribute("userVo", vo);
		model.addAttribute("list", list);
		model.addAttribute("paramPrice", paramPrice);
		return "/laundryService/order/orderConfirm";
	}
	
	@PostMapping("/orderComplete")
	public String orderConfirmed_post(@RequestParam int totalPrice, Model model,@RequestParam (defaultValue = "없음", required = false)String orderRequest ) {
		logger.info("totalPrice={}",totalPrice);
		int no = 1000;
		
		OrderViewVO orderViewVo = new OrderViewVO();
		
		orderViewVo = orderService.selectUsersOrderView(no);
		logger.info("vo={}",orderViewVo);
		
		int usersNo = orderViewVo.getUsersNo();
		logger.info("usersNo={}",usersNo);
		int addressNo = orderViewVo.getAddressNo();
		logger.info("addressNo={}",addressNo);
		
		OrderVO vo = new OrderVO();
		vo.setUsersNo(usersNo);
		vo.setUsersAddressNo(addressNo);
		vo.setTotalPrice(totalPrice);
		vo.setOrderRequest(orderRequest);
		
		logger.info("vo={}",vo);
		
		int result = orderService.insertOrder(vo);
		
		model.addAttribute("result", result);
		return "/laundryService/order/orderComplete";
		
	}
	 
	   
	   
	   
	
	
}
