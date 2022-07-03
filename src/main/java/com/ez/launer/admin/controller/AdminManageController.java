package com.ez.launer.admin.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.launer.common.ConstUtil;
import com.ez.launer.common.PaginationInfo;
import com.ez.launer.common.SearchVO;
import com.ez.launer.common.UserSearchVO;
import com.ez.launer.user.model.UserService;
import com.ez.launer.user.model.UserVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
public class AdminManageController {

	private static final Logger logger
	= LoggerFactory.getLogger(AdminManageController.class);

	private final UserService userService;

	@RequestMapping("/stores")
	public String stores() {
		logger.info("지점관리 페이지");

		return "/admin/manage/stores";
	}
	
	@RequestMapping("/users")
	public String users_get() {
		return"/admin/users";
	}

	@RequestMapping("/usersCommon")
	public String usersCommon(@RequestParam int userCode,
			@ModelAttribute UserSearchVO searchVo,Model model) {
		
		logger.info("페이징, searchVo={}", searchVo);

		PaginationInfo pagingInfo = new PaginationInfo();
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setUserCode(userCode);
		

		List<UserVO> list= userService.selectUser(searchVo);
		logger.info("일반회원 조회 페이징, list.size()={}",list.size());
		
		int totalRecord = userService.userTotalRecord(searchVo);
		logger.info("조회결과 totalRecord = {}",totalRecord);

		model.addAttribute("list",list);
		model.addAttribute("totalRecord",totalRecord);

		return"/admin/usersCommon";
	}

}
