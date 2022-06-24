package com.ez.launer.laundryService.order.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.ez.launer.category.model.CategoryService;
import com.ez.launer.category.model.CategoryVO;
import com.ez.launer.laundryService.order.model.OrderDetailVO;
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
		
		
		int paramPrice = 0;
		for(int i=0;i<paramString.length;i++) {
			Map<String, Object> map = new HashMap<>();
			setParamString = paramString[i].split(",");

			map.put("categoryNo", setParamString[0]);
			map.put("name", setParamString[1]);
			map.put("price", setParamString[2]);
			map.put("quan", setParamString[3]);
			map.put("sum", setParamString[4]);
			
			//총 결제금액 int 로 실어보내기
			paramPrice += Integer.parseInt( setParamString[4]);

			list.add(map);
		}
		
		logger.info("최종금액 ={}",paramPrice);

		model.addAttribute("userVo", vo);
		model.addAttribute("list", list);
		model.addAttribute("paramPrice", paramPrice);
		model.addAttribute("param", param);
		return "/laundryService/order/orderConfirm";
	}
	
	
	
	@PostMapping("/orderComplete")
	public String orderConfirmed_post(@RequestParam int totalPrice,@RequestParam String param,
			Model model, @RequestParam (defaultValue = "없음", required = false)String orderRequest,
			@RequestParam (defaultValue="0")int usePoint,@RequestParam int savePoint) {
		logger.info("totalPrice={}",totalPrice);
		logger.info("param={}",param);
		int no = 1000; //추후 session 으로 변경

		//orders 테이블 insert
		OrderViewVO orderViewVo = new OrderViewVO();
		
		orderViewVo = orderService.selectUsersOrderView(no);
		logger.info("vo={}",orderViewVo);
		
		//int usersNo = orderViewVo.getUsersNo();
		logger.info("usersNo={}",no);
		int addressNo = orderViewVo.getAddressNo();
		logger.info("addressNo={}",addressNo);
		
		OrderVO vo = new OrderVO();
		vo.setUsersNo(no);
		vo.setUsersAddressNo(addressNo);
		vo.setTotalPrice(totalPrice);
		vo.setOrderRequest(orderRequest);
		
		logger.info("vo={}",vo);
		
		int result = orderService.insertOrder(vo);
		logger.info("orderInsert 결과 ={}",result);
		
		//userNO 로 최신 orderNo 가져오기
		int orderNO = orderService.selectRecentOrderNo(no);
		logger.info("orderNo ={}",orderNO);
		
		//orderDetail에 들어갈 String 상세상품목록 split
		String temp1[] = param.split("[=]");
		String temp2[] =temp1[1].split("}");

		String paramString[] = temp2[0].split("[|]");
		String setParamString[];
		
		OrderDetailVO orderDetailVo = new OrderDetailVO();

		//order_details insert
		for(int i=0;i<paramString.length;i++) {
			setParamString = paramString[i].split(",");
			
			int categoryNo = Integer.parseInt(setParamString[0]);
			int price = Integer.parseInt(setParamString[2]);
			int quan= Integer.parseInt(setParamString[3]);
			int sum = Integer.parseInt(setParamString[4]);
			logger.info("categoryNo={}",categoryNo,"price={}",price,"quan={}",quan,"sum={}",sum);
			
			
			orderDetailVo.setOrderNo(orderNO);
			orderDetailVo.setCategoryNo(categoryNo);
			orderDetailVo.setQuan(quan);
			orderDetailVo.setSum(sum);
			
			int cnt  = orderService.insertOrderDetails(orderDetailVo);
			logger.info("order_detail insert cnt ={}",cnt);
		}

		//point_list 관련
		usePoint = usePoint*-1; //음수파라미터로 받으면 0으로 들어와서 컨트롤러에서 음수로 변경
		logger.info("usePoint={}",usePoint);
		logger.info("savePoint={}",savePoint);
		
		//포인트 사용
		Map<String, Object> map = new HashMap<>();
		map.put("usersNo", no);
		map.put("orderNo",orderNO);
		map.put("point", usePoint);
		
		int cnt = 0;
		cnt = orderService.insertPointList(map);
		
		//포인트 적립
		Map<String, Object> map2 = new HashMap<>();
		map2.put("usersNo", no);
		map2.put("orderNo",orderNO);
		map2.put("point", savePoint);
		cnt = orderService.insertPointList(map2);

		//users테이블 point update
		UserVO userVo = userService.selectById(no);	
		
		int userPoint = userVo.getPoint(); //변경 전 point 저장
		logger.info("결제 전 포인트={}",userPoint);
		int updatePoint= userPoint+savePoint+usePoint;
		userVo.setPoint(updatePoint);		
		logger.info("결제 후 포인트={}",updatePoint);
		
		int result2 = orderService.updateUserPoint(userVo);
			
		model.addAttribute("email",userVo.getEmail());
		model.addAttribute("name",userVo.getName());
		model.addAttribute("payPrice", totalPrice); //결제할 금액
		model.addAttribute("orderNO", orderNO); //fk 주문번호
		model.addAttribute("userPoint", userPoint);//결제취소대비한 결제 전 포인트
		return "/laundryService/payment/orderPayment";
	}
}
