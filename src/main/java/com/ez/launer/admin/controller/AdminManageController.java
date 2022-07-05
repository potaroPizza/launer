package com.ez.launer.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections4.map.HashedMap;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.ez.launer.category.model.CategoryVO;
import com.ez.launer.common.ConstUtil;
import com.ez.launer.common.DeliverySearchVO;
import com.ez.launer.common.PaginationInfo;
import com.ez.launer.common.SearchVO;
import com.ez.launer.common.UserSearchVO;
import com.ez.launer.delivery.model.DeliveryDriverService;
import com.ez.launer.delivery.model.DeliveryDriverVO;
import com.ez.launer.office.model.OfficeService;
import com.ez.launer.office.model.OfficeVO;
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
	private final OfficeService officeService;

	@RequestMapping("/stores")
	public String stores() {
		logger.info("지점관리 페이지");

		return "/admin/manage/stores";
	}

	@GetMapping("/users")
	public String users_get(Model model) {

		//지점 select
		List<OfficeVO> officeList = officeService.selectAll();
		logger.info("전체  조회결과 officeList.size={}",officeList.size());

		model.addAttribute("officeList",officeList);
		return"/admin/users";
	}

	@PostMapping("/users")
	public String users_post(@RequestParam (required = false  )String userSearchKeyword, @RequestParam (required = false  )String userSearchCondition,
			@RequestParam (required = false  )String driverSearchKeyword,@RequestParam (required = false  )String driverSearchCondition  ,Model model) {

		int tabNo = 0;

		if(userSearchKeyword!=null) {
			tabNo = 1;
		}else if(driverSearchKeyword!=null) {
			tabNo = 2;
		}else {
			tabNo =3;
		}
		logger.info("tabNo={}",tabNo);

		model.addAttribute("userSearchKeyword",userSearchKeyword);
		model.addAttribute("userSearchCondition",userSearchCondition);
		model.addAttribute("driverSearchCondition",driverSearchCondition);
		model.addAttribute("driverSearchKeyword",driverSearchKeyword);
		model.addAttribute("tabNo",tabNo);
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

		logger.info("일반회원 searchKeyword ={}",searchKeyword);
		logger.info("일반회원 searchCondition ={}",searchCondition);

		searchVo.setSearchKeyword(searchKeyword);
		searchVo.setSearchCondition(searchCondition);

		List<UserVO> list= userService.selectUser(searchVo);
		logger.info("일반회원 조회, list.size()={}",list.size());

		int totalRecord=userService.getUserTotalRecord(searchVo);
		logger.info("조회결과 totalRecord = {}",totalRecord);

		model.addAttribute("list",list);
		model.addAttribute("totalRecord",totalRecord);
		model.addAttribute("searchKeyword",searchKeyword);


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

		logger.info("배달기사 searchKeyword ={}",searchKeyword);
		logger.info("배달기사 searchCondition ={}",searchCondition);

		deliverySearchVo.setSearchKeyword(searchKeyword);
		deliverySearchVo.setSearchCondition(searchCondition);

		List<DeliveryDriverVO> list = deliveryService.selectDeliveryUser(deliverySearchVo);
		logger.info("배달기사 조회, list.size() ={}",list.size());

		int totalRecord=deliveryService.getDriverTotalRecord(deliverySearchVo);
		logger.info("조회결과 totalRecord = {}",totalRecord);

		model.addAttribute("list",list);
		model.addAttribute("totalRecord",totalRecord);
		model.addAttribute("searchKeyword",searchKeyword);

		return "/admin/usersDelivery";
	}



	@RequestMapping("/insertManager")
	@ResponseBody
	public UserVO insertManager(@ModelAttribute UserVO userVo, Model model,@RequestParam int office){
		logger.info("파라미터 userVo ={}",userVo);
		logger.info("지점 officeNo ={}",office);
		
		int cnt =  userService.insertBranchManager(userVo);
		logger.info("관리자 user 등록 결과={}",cnt);
		if(cnt>0) {
			userVo = userService.selectByEmail(userVo.getEmail());
			int usersNo = userVo.getNo();
			
			Map<String, Object> map = new HashMap<>();
			map.put("usersNo", usersNo);
			map.put("officeNo", office);
			
			int result = officeService.insertOfficeAdmin(map);
			logger.info("관리자 OfficeAdmin 등록 결과={}",result);
			model.addAttribute("userVo",userVo);
		}
		return userVo;
	}
	
	
	@RequestMapping("getWithdrawUser")
	@ResponseBody
	public List<UserVO> getWithdrawUsers(){
		
		List<UserVO> withdrawList = userService.withdrawUsers();
		logger.info("탈퇴회원 list size ={}",withdrawList.size());
		
		return withdrawList;
	}
	
	
	
	
	
	
	
	
}
