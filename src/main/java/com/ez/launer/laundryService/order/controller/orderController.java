package com.ez.launer.laundryService.order.controller;

import java.util.Arrays;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ez.launer.category.model.CategoryService;
import com.ez.launer.category.model.CategoryVO;

import lombok.RequiredArgsConstructor;



@Controller
@RequestMapping("/laundryService/order")
@RequiredArgsConstructor
public class orderController {
	
	private static final Logger logger
		 = LoggerFactory.getLogger(orderController.class);
	
	private final CategoryService categoryService;
	
	
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
	    @RequestMapping("/paramPost")
	    public Map<String, String> rrrr(HttpServletRequest request) {
	        logger.info("post넘김");
	        String[] itemArr = request.getParameterValues("categoryNo");

	        HashMap<String, String> mapmap = new HashMap<String, String>();   //아이템이랑 개수가 담길 변수? 맞나
	        HashSet<String> setset = new HashSet<>(Arrays.asList(itemArr));   //이걸로 중복 제거해줄 거임

	        String[] resultItemArr = setset.toArray(new String[0]);     //중복제거 완료?

	        for (String value : resultItemArr) {    //중복없는 값
	            int itemChk = 0;
	            for (String s : itemArr) {
	                if (s.equals(value)) itemChk++;
	            }

	            mapmap.put(value, String.valueOf(itemChk));
	        }

	        return mapmap;
	    }
	
	
}
