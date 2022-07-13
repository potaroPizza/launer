package com.ez.launer.admin.controller;

import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections4.map.HashedMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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
import com.ez.launer.user.model.SHA256Encryption;
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
	private final SHA256Encryption sha256;

	@RequestMapping("/stores")
	public String stores(Model model) {
		
		//지점 전체 조회
		//List<OfficeVO> officeList = officeService.selectAll();
		//logger.info("지점조회 officeList.size={}", officeList.size());
		
		//지점정보 조회 list
		List<Map<String, Object>> selectOfficeInfo = officeService.selectOfficeInfo();
		logger.info("지점 정보 조회결과 selectOfficeInfo.size={}",selectOfficeInfo.size());
		
		model.addAttribute("selectOfficeInfo",selectOfficeInfo);

		return "/admin/stores";
	}
	
	
	@GetMapping("/users")
	public String users_get(Model model) {

		//지점 select option 생성
		List<OfficeVO> officeList = officeService.selectAll();
		logger.info("전체 조회결과 officeList.size={}",officeList.size());
		
		//지점관리자 list vo
		List<Map<String, Object>> managerList = officeService.selectAllManager();
		logger.info("지점 관리자 조회결과 managerList.size={}",managerList.size());
		
		model.addAttribute("officeList",officeList);
		model.addAttribute("managerList",managerList);
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
	public Map<String, Object> insertManager(@ModelAttribute UserVO userVo, Model model,@RequestParam int office) throws NoSuchAlgorithmException{
		logger.info("파라미터 userVo ={}",userVo);
		logger.info("지점 officeNo ={}",office);
		
		//비밀번호 암호화 필요
		String pwd = sha256.encrypt(userVo.getPwd());
		userVo.setPwd(pwd);

		//user 테이블 insert
		int cnt =  userService.insertBranchManager(userVo);
		logger.info("관리자 user 등록 결과={}",cnt);

		int usersNo = 0;
		if(cnt>0) {
			//userNo 가져오기
			userVo = userService.selectByEmail(userVo.getEmail());
			usersNo = userVo.getNo();
			
			//office_admin insert
			Map<String, Object> map = new HashMap<>();
			map.put("usersNo", usersNo);
			map.put("officeNo", office);
			
			int result = officeService.insertOfficeAdmin(map);
			logger.info("관리자 OfficeAdmin 등록 결과={}",result);
			
		}
		//반환될 뷰 select
		Map<String, Object> managerMap = officeService.selectManagerByNo(usersNo);
		logger.info("반환 뷰 map ={}",managerMap.get("NAME"));
		model.addAttribute("userVo",userVo);
		model.addAttribute("map",managerMap);
		return managerMap;

	}

	@DeleteMapping("/user/{no}")
	@ResponseBody
	public Map<String, Object> deleteAdmin(@PathVariable("no") int no) {
		System.out.println("no "+no);
		int result = userService.deleteUser(no);
		officeService.deleteOfficeAdmin(no);
		System.out.println("result "+result);

		Map<String, Object> resMap = new HashMap<>();
		resMap.put("SUCCESS", false);
		if(result > 0) resMap.put("SUCCESS", true);

//		return "redirect:/admin/users";
		return resMap;
	}
	
	@DeleteMapping("/delivery-user/{no}")
	@ResponseBody
	public Map<String, Object> deleteDelivery(@PathVariable("no") int no) {
		System.out.println("no "+no);
		int result = deliveryService.deleteDelivery(no);
		System.out.println("result "+result);

		Map<String, Object> resMap = new HashMap<>();
		resMap.put("SUCCESS", false);
		if(result > 0) resMap.put("SUCCESS", true);

//		return "redirect:/admin/users";
		return resMap;
	}
	
	
	@RequestMapping("getWithdrawUser")
	@ResponseBody
	public List<UserVO> getWithdrawUsers(){
		
		List<UserVO> withdrawList = userService.withdrawUsers();
		logger.info("탈퇴회원 list size ={}",withdrawList.size());
		
		return withdrawList;
	}
	
	@DeleteMapping("/stores/{no}")
	@ResponseBody
	public Map<String, Object> deleteOffice(@PathVariable("no") int no) {
		System.out.println("no "+no);
		int result = officeService.deleteOffice(no);
		System.out.println("result "+result);

		Map<String, Object> resMap = new HashMap<>();
		resMap.put("SUCCESS", false);
		if(result > 0) resMap.put("SUCCESS", true);

		return resMap;
	}

}
