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
	public String users(ModelMap model) {
		logger.info("회원관리 페이지");


		return "/admin/users";
	}

	@RequestMapping("/usersCommon")
	public String usersCommon(@ModelAttribute SearchVO searchVo,@RequestParam int userCode,Model model) {
		logger.info("회원종류 userCode={}",userCode);

		//[1] PaginationInfo 생성
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());

		//[2] searchVo에 페이징 처리 관련 변수의 값 셋팅
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);

		List<UserVO> list= userService.selectUser(userCode);
		logger.info("list.size={}",list.size());

		pagingInfo.setTotalRecord(list.size());

		model.addAttribute("list",list);
		model.addAttribute("pagingInfo", pagingInfo);

		return"/admin/usersCommon";

	}

}
