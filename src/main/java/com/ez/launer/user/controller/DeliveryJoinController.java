package com.ez.launer.user.controller;

import java.security.NoSuchAlgorithmException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.launer.office.model.OfficeVO;
import com.ez.launer.user.model.DriverAllVO;
import com.ez.launer.user.model.SHA256Encryption;
import com.ez.launer.user.model.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/delivery")
@RequiredArgsConstructor
public class DeliveryJoinController {
    private static final Logger logger = LoggerFactory.getLogger(DeliveryJoinController.class);
    
    private final UserService userService;
    private final SHA256Encryption sha256;
    
    @GetMapping("/join")
    public String register(Model model) {
        logger.info("배송기사 회원가입 화면");
        
        List<OfficeVO> list= userService.selectOffice();

        model.addAttribute("classNo", 2);
        model.addAttribute("list", list);
        return "/user/join";
    }
    
    @PostMapping("/join")
	public String join_post(@ModelAttribute DriverAllVO vo, Model model) throws NoSuchAlgorithmException {
    	logger.info("배송기사 회원가입 처리, 파라미터 vo={}", vo);
		
    	//비밀번호 암호화
    	String pwd = sha256.encrypt(vo.getPwd());
    	vo.setPwd(pwd);
    	logger.info("암호화 pwd ={}",pwd);
    	
		int cnt=userService.insertDriver(vo);
		logger.info("배송기사 회원가입 결과, cnt={}", cnt);
		
		int cnt2=userService.insertAccount(vo);
		logger.info("계좌 입력 결과, cnt2={}", cnt2);
		
		List<OfficeVO> list= userService.selectOffice();

		String msg="회원가입 실패", url="/delivery/join";
		if(cnt>0 && cnt2>0) {
			msg="회원가입되었습니다.";
			url="/";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "/common/message";
    }
    
    @RequestMapping("/checkDmail")
	public String checkEmail(@RequestParam String email, Model model) {
		logger.info("배송기사 이메일 중복확인, 파라미터 email={}", email);

		int result=0;
		if(email!=null && !email.isEmpty()) {		
			result=userService.chkDmail(email);
	
			logger.info("배송기사 이메일 중복확인 결과, result={}", result);
		}

		model.addAttribute("result", result);
		model.addAttribute("USABLE_EMAIL", userService.USABLE_EMAIL);
		model.addAttribute("UNUSABLE_EMAIL", userService.UNUSABLE_EMAIL);

		return "/delivery/checkDmail";
	}
	@RequestMapping("/checkDhp")
	public String checkDhp(@RequestParam(required=false) String hp, Model model) {
		logger.info("배송기사 휴대전화 번호 중복확인, 파라미터 hp={}", hp);
		
		int result=0;
		if(hp!=null && !hp.isEmpty()) {		
			result=userService.chkDhp(hp);
			logger.info("배송기사 휴대전화 번호 중복확인 결과, result={}", result);
			if(result==userService.USABLE_HP) {
				int randomNum = (int)(Math.random() * (999999 - 100000 + 1)) + 100000;
				String randomCode=Integer.toString(randomNum);
				logger.info("인증번호 생성 체크, randomCode={}", randomCode);
				
				model.addAttribute("randomCode", randomCode);
				//smsSender.certifySms(hp, randomCode);
			}
		}
		
		model.addAttribute("result", result);
		model.addAttribute("USABLE_HP", userService.USABLE_HP);
		model.addAttribute("UNUSABLE_HP", userService.UNUSABLE_HP);
		
		return "/delivery/checkDhp";
	}
	
}