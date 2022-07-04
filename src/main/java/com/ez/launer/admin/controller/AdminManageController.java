package com.ez.launer.admin.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.launer.common.ConstUtil;
import com.ez.launer.common.DeliverySearchVO;
import com.ez.launer.common.PaginationInfo;
import com.ez.launer.common.SearchVO;
import com.ez.launer.common.UserSearchVO;
import com.ez.launer.delivery.model.DeliveryDriverService;
import com.ez.launer.delivery.model.DeliveryDriverVO;
import com.ez.launer.user.model.UserService;
import com.ez.launer.user.model.UserVO;
import com.fasterxml.jackson.annotation.JsonCreator.Mode;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
public class AdminManageController {

	private static final Logger logger
	= LoggerFactory.getLogger(AdminManageController.class);

	private final UserService userService;
	private final DeliveryDriverService deliveryService;

	@RequestMapping("/stores")
	public String stores() {
		logger.info("지점관리 페이지");

		return "/admin/manage/stores";
	}
	
	@GetMapping("/users")
	public String users_get() {
		return"/admin/users";
		
		
	}
	
	@PostMapping("/users")
	public String users_post(@RequestParam (required = false  )String userSearchKeyword, @RequestParam (required = false  )String userSearchCondition,
			@RequestParam (required = false  )String driverSearchKeyword,@RequestParam (required = false  )String driverSearchCondition  ,Model model) {
		
		model.addAttribute("userSearchKeyword",userSearchKeyword);
		model.addAttribute("userSearchCondition",userSearchCondition);
		model.addAttribute("driverSearchCondition",driverSearchCondition);
		model.addAttribute("driverSearchKeyword",driverSearchKeyword);
		return"/admin/users";
	}
	
	

	@RequestMapping("/usersCommon")
	public String usersCommon(
			@ModelAttribute UserSearchVO searchVo,Model model) {
		
		String searchKeyword = searchVo.getSearchKeyword();
		String searchCondition = searchVo.getSearchCondition();
		
		String temp1 [] = searchKeyword.split("[,]");
		String temp2 [] = searchCondition.split("[,]");
		
		searchKeyword = temp1[0];
		searchCondition = temp2[0];
		
		logger.info("컨트롤러 searchKeyword ={}",searchKeyword);
		logger.info("searchCondition ={}",searchCondition);
		
		searchVo.setSearchKeyword(searchKeyword);
		searchVo.setSearchCondition(searchCondition);

		List<UserVO> list= userService.selectUser(searchVo);
		logger.info("일반회원 조회, list.size()={}",list.size());
		
		int totalRecord=userService.getUserTotalRecord(searchVo);
		logger.info("조회결과 totalRecord = {}",totalRecord);

		model.addAttribute("list",list);
		model.addAttribute("totalRecord",totalRecord);

		return"/admin/usersCommon";
	}
	
	
	@RequestMapping("/usersDelivery")
	public String usersDelivery(@ModelAttribute DeliverySearchVO deliverySearchVo,Model model) {
		
		String searchKeyword = deliverySearchVo.getSearchKeyword();
		String searchCondition = deliverySearchVo.getSearchCondition();
		
		String temp1 [] = searchKeyword.split("[,]");
		String temp2 [] = searchCondition.split("[,]");
		
		searchKeyword = temp1[0];
		searchCondition = temp2[0];
		
		logger.info("컨트롤러 searchKeyword ={}",searchKeyword);
		logger.info("searchCondition ={}",searchCondition);
		
		deliverySearchVo.setSearchKeyword(searchKeyword);
		deliverySearchVo.setSearchCondition(searchCondition);
		
		List<DeliveryDriverVO> list = deliveryService.selectDeliveryByClass(deliverySearchVo);
		logger.info("배달기사 조회, list.size() ={}",list.size());
		
		model.addAttribute("list",list);
		
		return "/admin/usersDelivery";
	}
	
	
	

}
