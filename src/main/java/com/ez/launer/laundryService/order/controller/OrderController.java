package com.ez.launer.laundryService.order.controller;

import java.util.ArrayList;
import java.util.Arrays;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Locale.Category;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ez.launer.category.model.CategoryService;
import com.ez.launer.category.model.CategoryVO;
import com.ez.launer.laundryService.order.model.OrderConfirmVO;

import lombok.RequiredArgsConstructor;



@Controller
@RequestMapping("/laundryService/order")
@RequiredArgsConstructor
public class OrderController {
	
	private static final Logger logger
		 = LoggerFactory.getLogger(OrderController.class);
	
	private final CategoryService categoryService;
	
	
	
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
	public String orderConfirm_get() {
		logger.info("결제전 최종확인 화면");
		
		return "/laundryService/order/orderConfirm";
	}
	
	
	@ResponseBody
	@PostMapping("/ajaxTest")
	public String orderConfirm_post(@RequestParam List<Map<String, Object>> map, Model model){
		logger.info("json-list");
		
		model.addAttribute("list",map);
		return "/laundryService/order/ajaxTest";
		
		
	}
	 
	   
	   
	   
	
	
}
