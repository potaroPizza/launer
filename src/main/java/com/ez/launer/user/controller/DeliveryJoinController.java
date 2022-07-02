package com.ez.launer.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.launer.user.model.DriverAllVO;
import com.ez.launer.user.model.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/delivery")
@RequiredArgsConstructor
public class DeliveryJoinController {
    private static final Logger logger = LoggerFactory.getLogger(DeliveryJoinController.class);
    
    private final UserService userService;
    
    @GetMapping("/join")
    public String register(Model model) {
        logger.info("회원가입 화면");

        model.addAttribute("classNo", 2);
        return "/user/join";
    }
    
    @PostMapping("/join")
	public String join_post(@ModelAttribute DriverAllVO vo, Model model) {
    	logger.info("배송기사 회원가입 처리, 파라미터 vo={}", vo);
		
		int cnt=userService.insertDriver(vo);
		logger.info("배송기사 회원가입 결과, cnt={}", cnt);
		
		int cnt2=userService.insertAccount(vo);
		logger.info("주소입력 결과, cnt2={}", cnt2);

		String msg="회원가입 실패", url="/delivery/join";
		if(cnt>0 && cnt2>0) {
			msg="회원가입되었습니다.";
			url="/";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "/common/message";
    }

}