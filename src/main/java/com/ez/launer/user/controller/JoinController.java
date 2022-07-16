package com.ez.launer.user.controller;

import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ez.launer.office.model.OfficeVO;
import com.ez.launer.user.model.SHA256Encryption;
import com.ez.launer.user.model.SmsSender;
import com.ez.launer.user.model.UserAllVO;
import com.ez.launer.user.model.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/user")
@RequiredArgsConstructor
public class JoinController {
	private static final Logger logger
	=LoggerFactory.getLogger(JoinController.class);
	
	private final UserService userService;
	private final SHA256Encryption sha256;
	private final SmsSender smsSender;
	
	@GetMapping("/join")
	public void join_get(Model model) {
		logger.info("일반회원가입 화면");
		
		model.addAttribute("classNo", 1);
	}
	
	@PostMapping("/join")
	public String join_post(@ModelAttribute UserAllVO vo, 
							@RequestParam String entermethod2, Model model) throws NoSuchAlgorithmException {
		logger.info("일반회원가입 처리, 파라미터 vo={}", vo);
		
		//비밀번호 암호화
		String pwd = vo.getPwd();
		logger.info("암호화 전 pwd ={}",pwd);
		
		String encryptedPwd = sha256.encrypt(pwd);
		vo.setPwd(encryptedPwd);
		logger.info("암호화 후 encryptedPwd={}",vo.getPwd());
		
		String str = vo.getAddress();
		String[]str2= str.split("\\s");
		String office=str2[1];
		
		List<OfficeVO> list= userService.selectOffice();
		
		for(OfficeVO officeVo : list) {
			String dbOffice = officeVo.getAddress().split("\\s")[1];
			
			logger.info("스플릿한 주소 office={},dbOffice={}",office,dbOffice);
			if(dbOffice.equals(office)) {
				vo.setOfficeNo(officeVo.getNo());
				break;
			}else {
				vo.setOfficeNo(vo.getOfficeNo());
			}
			
		}
		int officeNo=vo.getOfficeNo();
		
		String entermethod=vo.getEntermethod();
		if(entermethod==null || entermethod.isEmpty()) {
			entermethod=entermethod2;
		}
		vo.setEntermethod(entermethod);
		logger.info("서비스지역 및 지점 확인 결과, officeNo={}",officeNo);
		
		String msg="", url="";
		if(officeNo>0) {
			int cnt=userService.insertUser(vo);
			logger.info("일반회원가입 결과, cnt={}", cnt);
			int cnt2=userService.insertAddress(vo);
			logger.info("주소입력 결과, cnt2={}", cnt2);

			if(cnt>0 && cnt2>0) {
				msg="회원가입되었습니다.";
				url="/";
			}else {
				msg="회원가입 실패";
			}
		}else {
			msg="서비스 미지원 지역입니다.";
			url="/user/join";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "/common/message";
	}
	@GetMapping("/chkAddress")
	@ResponseBody
	public Map<String, Object> chkAddress(@RequestParam String address) {
		logger.info("ajax 주소 확인 address={}", address);
		
		String area = address.split("\\s")[1];
		
		List<OfficeVO> list= userService.selectOffice();
		
		boolean res = false;
		for(OfficeVO officeVo : list) {
			String dbOffice = officeVo.getAddress().split("\\s")[1];
			if(dbOffice.equals(area)) {
				res=true;
				break;
			}
		} 
		Map<String, Object> map = new HashMap<>();
		map.put("SUCCESS", res);
		
		return map;
	}
	
	@RequestMapping("/checkEmail")
	public String checkEmail(@RequestParam String email, Model model) {
		logger.info("이메일 중복확인, 파라미터 email={}", email);

		int result=0, socialchk=0;
		if(email!=null && !email.isEmpty()) {		
			result=userService.chkEmail(email);
			socialchk=userService.chkSocial(email);
			logger.info("이메일 중복확인 결과, result={}", result);
			logger.info("소셜계정여부 확인 결과, socialchk={}", socialchk);
		}

		model.addAttribute("result", result);
		model.addAttribute("USABLE_EMAIL", userService.USABLE_EMAIL);
		model.addAttribute("UNUSABLE_EMAIL", userService.UNUSABLE_EMAIL);
		model.addAttribute("socialchk", socialchk);
		model.addAttribute("SOCIAL_EMAIL", userService.SOCIAL_EMAIL);

		return "/user/checkEmail";
	}
	
	@RequestMapping("/checkHp")
	public String checkHp(@RequestParam(required=false)String hp, Model model) {
		logger.info("휴대전화 번호 중복확인, 파라미터 hp={}", hp);
		
		int result=0;
		if(hp!=null && !hp.isEmpty()) {		
			result=userService.chkHp(hp);
			logger.info("휴대전화 번호 중복확인 결과, result={}", result);
			
			if(result==userService.USABLE_HP) {
				int randomNum = (int)(Math.random() * (999999 - 100000 + 1)) + 100000;
				String randomCode=Integer.toString(randomNum);
				logger.info("인증번호 생성 체크, randomCode={}", randomCode);
				
				model.addAttribute("randomCode", randomCode);
				smsSender.certifySms(hp, randomCode);
			}
		}
		
		model.addAttribute("result", result);
		model.addAttribute("USABLE_HP", userService.USABLE_HP);
		model.addAttribute("UNUSABLE_HP", userService.UNUSABLE_HP);
		
		return "/user/checkHp";
	}
	
}
