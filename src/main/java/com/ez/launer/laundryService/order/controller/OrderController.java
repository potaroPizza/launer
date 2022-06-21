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
	
	@GetMapping("/orderConfirm")
	public String orderConfirm_get(HttpSession session, Model model) {
		int no = 1000;
				//(String) session.getAttribute("userid");
		logger.info("결제전 최종확인 화면, 파라미터 userid ={}", no);
		
		UserVO vo = userService.selectById(no);
		
		logger.info("회원정보조회 vo={}",vo);
		model.addAttribute("userVo",vo);

		return "/laundryService/order/orderConfirm";
	}
	
	

	@PostMapping("/orderConfirm")
	public String orderConfirm_post(@RequestParam String param, Map<String, Object> map, Model model) {
		logger.info("param_string 파라미터 = {}",param);
		logger.info("진입!");
		List<Map<String, Object>> list= new ArrayList<Map<String,Object>>();
		
		String paramString[] = param.split("[|]");
		String setParamString[];
		
		
		int result = 0;
		for(int i=0;i<paramString.length;i++) {
			setParamString = paramString[i].split(",");
			
			map.put("categoryNo", setParamString[0]);
			map.put("quan", setParamString[1]);
			map.put("aum", setParamString[2]);
			
			list.add(map);
		}
		
		model.addAttribute(list);
		return "/laundryService/order/orderConfirm";
		
		
		
	}
	 
	   
	   
	   
	
	
}
