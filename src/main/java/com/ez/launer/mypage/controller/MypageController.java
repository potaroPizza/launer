package com.ez.launer.mypage.controller;

import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

import com.ez.launer.common.ConstUtil;
import com.ez.launer.common.PaginationInfo;
import com.ez.launer.common.PaymentSearchVO;
import com.ez.launer.common.PointSearchVO;
import com.ez.launer.office.model.OfficeVO;
import com.ez.launer.payment.model.PaymentDetailAllVO;
import com.ez.launer.payment.model.PaymentHistoryAllVO;
import com.ez.launer.payment.model.PaymentHistoryViewVO;
import com.ez.launer.payment.model.PaymentService;
import com.ez.launer.point.model.PointService;
import com.ez.launer.user.model.KakaoAPI;
import com.ez.launer.user.model.SHA256Encryption;
import com.ez.launer.user.model.UserAllVO;
import com.ez.launer.user.model.UserService;
import com.ez.launer.user.model.UserVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/mypage")
public class MypageController {

	private static final Logger logger
	=LoggerFactory.getLogger(MypageController.class);

	private final UserService userService;
	private final PointService pointService;
	private final PaymentService paymentService;
	private final KakaoAPI kakaoApi;
	private final SHA256Encryption sha256;


	@GetMapping("/") 
	public String mypage_get(HttpSession session, 
			Model model) { 
		int no=(int)session.getAttribute("no");
		logger.info("마이페이지 화면, 파라미터 userid={}", no);

		UserVO vo= userService.selectById(no);
		logger.info("회원 정보 조회 결과, vo={}",vo);

		model.addAttribute("vo",vo);

		return "/mypage/mypage";

	}
	
	@RequestMapping("/mypoint")
	public String mypoint(HttpSession session, @ModelAttribute PointSearchVO searchVo,
			Model model) {
		int no=(int)session.getAttribute("no");
		logger.info("마이페이지 포인트 화면, 파라미터 userid={}", no);
		
		UserVO vo= userService.selectById(no);
		logger.info("회원 정보 조회 결과, vo={}",vo);
		
		if(searchVo.getCountPerPage() == 0) {	
			searchVo.setCountPerPage(5);
		}
		logger.info("페이징, searchVo={}", searchVo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(searchVo.getCountPerPage());
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		searchVo.setRecordCountPerPage(searchVo.getCountPerPage());
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setUsersNo(no);
		
		
		
		//List<PointDetailAllVO> list = pointService.selectPointHistory(no);
		//logger.info("포인트 내역 조회, list={}",list);
		
		List<Map<String, Object>> searchList=pointService.PointSelectList(searchVo);
		logger.info("포인트 내역 조회 페이징, searchList={}",searchList);
		
		
		int totalRecord = pointService.PointSelectTotalRecord(searchVo);
		logger.info("포인트 내역 결과, totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);

		model.addAttribute("vo",vo);
		//model.addAttribute("list", list);
		model.addAttribute("searchList", searchList);
		model.addAttribute("pagingInfo", pagingInfo);

		return "/mypage/mypoint";
	}
	
	@GetMapping("/myinfo")
	public String myinfo(HttpSession session, 
			Model model) {
		int no=(int)session.getAttribute("no");
		logger.info("마이페이지 내정보 화면, 파라미터 userid={}", no);

		UserVO vo= userService.selectById(no);
		logger.info("회원정보 조회 kakao={}",no);
		HashMap<String, Object> map= userService.selectByIdAddress(no);
		logger.info("회원 정보 조회 결과, map={}",map);

		model.addAttribute("map",map);

		return "/mypage/myinfo";
	}

	@GetMapping("/useredit") 
	public String edit_get(HttpSession session, 
			Model model) { 
		int no=(int)session.getAttribute("no");
		logger.info("회원정보 수정 화면, 파라미터 userid={}", no);

		HashMap<String, Object> map= userService.selectByIdAddress(no);
		logger.info("회원 정보 조회 결과, map={}",map);
		

		model.addAttribute("map",map);

		return "/mypage/useredit";

	}

	@PostMapping("/useredit")
	public String edit_post(@ModelAttribute UserAllVO vo,
			HttpSession session, Model model) throws NoSuchAlgorithmException {
		int no=(int)session.getAttribute("no");

		vo.setNo(no);
		logger.info("회원정보 수정 파라미터, UserAllVO={}", vo);

		String hp=vo.getHp();
		String address=vo.getAddress(); 
		String addressDetail=vo.getAddressDetail();
		String zipcode=vo.getZipcode();
		String entermethod=vo.getEntermethod();
		double lonX=vo.getLonX();
		double latY=vo.getLatY();
		
		
		vo.setHp(hp);
		vo.setAddress(address); 
		vo.setAddressDetail(addressDetail);	
		vo.setZipcode(zipcode);
		vo.setEntermethod(entermethod);
		vo.setLonX(lonX);
		vo.setLatY(latY);
		
		
		String str = vo.getAddress();
		String[]str2= str.split("\\s");
		String office=str2[1];
		
		List<OfficeVO> list= userService.selectOffice();
		
		int resCnt = 0;
		for(OfficeVO officeVo : list) {
			String dbOffice = officeVo.getAddress().split("\\s")[1];
			
			logger.info("스플릿한 주소 office={},dbOffice={}",office,dbOffice);
			if(dbOffice.equals(office)) {
				vo.setOfficeNo(officeVo.getNo());
				resCnt++;
				break;
			}else {
				vo.setOfficeNo(vo.getOfficeNo());
			}
			
		} 
		
		

		String msg="비밀번호 확인 실패", url="/mypage/useredit";
		String pwd = sha256.encrypt(vo.getPwd());
		vo.setPwd(pwd);
		
		int result=userService.checkLogin(vo.getNo(), vo.getPwd());
		logger.info("회원정보 수정 - 비밀번호 확인 결과, result ={}", result);

		if(result==UserService.LOGIN_OK) {

			if(resCnt > 0) {
				int cnt = userService.updateUserHp(vo);
				logger.info("회원정보 수정 결과, cnt ={}", cnt);
				int cnt2 = userService.updateUserAddress(vo);
				logger.info("회원정보 수정 결과, cnt2={} ", cnt2);
				if(cnt>0 && cnt2>0) { 
					msg="회원정보를 수정하였습니다."; 
				}else { msg="회원정보 수정 실패"; }
			}else {
				msg = "서비스 미지원 지역입니다.";
				url="/mypage/useredit";
			}
		}else if(result==UserService.DISAGREE_PWD) {
			msg="비밀번호가 일치하지 않습니다.";			
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "/common/message";

	}
	
	
	@PostMapping("/usereditSocial")
	public String editKakao_post(@ModelAttribute UserAllVO vo,
			HttpSession session, Model model) {
		int no=(int)session.getAttribute("no");

		vo.setNo(no);
		logger.info("카카오회원정보 수정 파라미터, UserAllVO={}", vo);

		String hp=vo.getHp();
		
		String address=vo.getAddress(); 
		String addressDetail=vo.getAddressDetail();
		String zipcode=vo.getZipcode();
		String entermethod=vo.getEntermethod();
		double lonX=vo.getLonX();
		double latY=vo.getLatY();
		
		vo.setHp(hp);
		vo.setAddress(address); 
		vo.setAddressDetail(addressDetail);
		vo.setZipcode(zipcode);
		vo.setEntermethod(entermethod);
		vo.setLonX(lonX);
		vo.setLatY(latY);
		
		String str = vo.getAddress();
		String[]str2= str.split("\\s");
		String office=str2[1];
		
		
		List<OfficeVO> list= userService.selectOffice();
		
		int resCnt = 0;
		for(OfficeVO officeVo : list) {
			String dbOffice = officeVo.getAddress().split("\\s")[1];
			
			if(dbOffice.equals(office)) {
				vo.setOfficeNo(officeVo.getNo());
				resCnt++;
				break;
			}else {
				vo.setOfficeNo(vo.getOfficeNo());
			}
		} 
		
		String msg="", url="/mypage/useredit";
		
		if(resCnt > 0) {
			int cnt = userService.updateUserHp(vo);
			logger.info("카카오회원정보 수정 결과, cnt ={},vo={}", cnt,vo);
			int cnt2 = userService.updateUserAddress(vo);
			logger.info("카카오회원정보 수정 결과, cnt2={} ", cnt2);


			if(cnt>0 && cnt2>0 ) { 
				msg="회원정보를 수정하였습니다.";
			}else { msg="회원정보 수정 실패"; }
		}else {
			msg = "서비스 미지원 지역입니다.";
			url="/mypage/useredit";
		}
		

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		


		return "/common/message";

	}
	

	@GetMapping("/editPwd")
	public String editPwd_get(HttpSession session,
			Model model) {
		int no=(int)session.getAttribute("no");
		logger.info("비밀번호 변경 화면, 파라미터 userid={}", no);

		UserVO vo= userService.selectById(no);
		logger.info("회원 정보 조회 결과, vo={}",vo);

		model.addAttribute("vo",vo);

		return "/mypage/editPwd";
	}

	@PostMapping("/editPwd")
	public String editPwd_post(@ModelAttribute UserVO vo, @RequestParam String newPwd,
			HttpSession session, Model model) throws NoSuchAlgorithmException {
		int no=(int)session.getAttribute("no");
		vo.setNo(no);
		logger.info("비밀번호 변경, vo={} ,파라미터 newPwd={}",vo,newPwd);

		String pwd = sha256.encrypt(vo.getPwd());
		vo.setPwd(pwd);
		
		int result=userService.checkLogin(vo.getNo(), vo.getPwd());
		logger.info("비밀번호 변경 처리, 비밀번호 조회 결과 result={}", result);
		
		String encNewPwd = sha256.encrypt(newPwd);
		vo.setPwd(encNewPwd);
		logger.info("변경된 암호화된 비밀번호, encNewPwd={}",encNewPwd);
		String msg="비밀번호 확인 실패",url="/mypage/editPwd";
		if(result == userService.LOGIN_OK) {
			int cnt=userService.editPwd(vo);
			if(cnt>0) {
				msg="비밀번호가 변경되었습니다.";
				url="/mypage/myinfo";
			}else {
				msg="비밀번호 변경이 불가능합니다.";				
			}
		}else if(result==userService.DISAGREE_PWD) {
			msg="비밀번호가 일치하지 않습니다.";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "/common/message";


	}

	@GetMapping("/withdraw")
	public String userdelete_get(HttpSession session, Model model) {
		logger.info("회원 탈퇴 화면");
		int no=(int)session.getAttribute("no");
		logger.info("회원탈퇴 화면, 파라미터 no={}", no);

		UserVO vo= userService.selectById(no);
		logger.info("회원 정보 조회 결과, vo={}",vo);

		model.addAttribute("vo",vo);

		return "/mypage/withdraw";
	}

	@PostMapping("/withdraw")
	public String userdelete_post(@RequestParam String pwd,
			HttpSession session, HttpServletResponse response,
			Model model) throws NoSuchAlgorithmException {
		int no=(int)session.getAttribute("no");
		String email=(String)session.getAttribute("email");
		logger.info("회원 탈퇴 처리, 파라미터 no={}, pwd={}",no,pwd);
		
		pwd = sha256.encrypt(pwd);
		logger.info("암호화로 불러온pwd={}",no,pwd);

		int result=userService.checkLogin(no, pwd);
		logger.info("회원 탈퇴 처리, 비밀번호 조회 결과 result={}", result);

		String msg="비밀번호 체크 실패",url="/mypage/withdraw";
		if(result == userService.LOGIN_OK) {
			int cnt=userService.deleteUser(no);
			if(cnt>0) {
				msg="회원탈퇴 처리가 되었습니다.";
				url="/mypage/signout";
				
				  Cookie ck = new Cookie("chkUseremail", email);
				   ck.setPath("/"); 
				   ck.setMaxAge(0);
				  response.addCookie(ck);
				  session.invalidate();
				 
			}else {
				msg="회원탈퇴 실패";				
			}
		}else if(result==userService.DISAGREE_PWD) {
			msg="비밀번호가 일치하지 않습니다.";
		}

		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		
		return "/common/message";
	}
	@PostMapping("/withdrawSocial")
	public String userdeleteSocial_post(
			HttpSession session, HttpServletResponse response,
			Model model) {
		int no=(int)session.getAttribute("no");
		
		String msg="",url="";
		int cnt =0;
		
		//카카오 회원탈퇴
		String access_Token = (String)session.getAttribute("access_Token");
		logger.info("access_Token={}",access_Token);
		
		if(access_Token!=null) {
			
			cnt = userService.deleteUser(no);
			kakaoApi.unlink(access_Token);
			logger.info("카카오 회원탈퇴완료");
			msg ="회원탈퇴 처리가 되었습니다.";
			url ="/mypage/signout";
			
			session.removeAttribute("no");
			session.removeAttribute("access_Token");
			session.removeAttribute("email");
		}else {
			String email=(String)session.getAttribute("email");
			logger.info("회원 탈퇴 처리, 파라미터 no={}",no);

				cnt=userService.deleteUser(no);
				if(cnt>0) {
					msg="회원탈퇴 처리가 되었습니다.";
					url="/mypage/signout";
					
					Cookie ck = new Cookie("chkUseremail", email);
					ck.setPath("/"); 
					ck.setMaxAge(0);
					response.addCookie(ck);
					session.invalidate();
					
				}else {
					msg="회원탈퇴 실패";				
				}
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "/common/message";
	}



	@RequestMapping("/paymentdetails")
	public String paymentdetails(HttpSession session,@ModelAttribute PaymentSearchVO searchVo, Model model) {
		
		int no=(int)session.getAttribute("no");
		logger.info("마이페이지 결제내역 화면, 파라미터 userid={}", no);
		
		if(searchVo.getCountPerPage() == 0) {	
			searchVo.setCountPerPage(10);
		}
		
		if(searchVo.getStartDay() == null || searchVo.getStartDay().isEmpty()) {
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String str = sdf.format(today);
			searchVo.setStartDay(str);
			searchVo.setEndDay(str);
			
			logger.info("페이징, searchVo={}", searchVo);
		}
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(searchVo.getCountPerPage());
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		searchVo.setRecordCountPerPage(searchVo.getCountPerPage());
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setUsersNo(no);
		
		
		UserVO vo= userService.selectById(no);
		logger.info("회원 정보 조회 결과 vo={}", vo);
		
		/*List<PaymentDetailAllVO> list = paymentService.selectPaymentDetail(searchVo);
		logger.info("마이페이지 결제내역 결과 list={}", list);*/

		List<PaymentDetailAllVO> paymentList = paymentService.selectPaymentList(searchVo);
		logger.info("마이페이지 결제내역 결과, paymentList.size={}", paymentList.size());

		int totalRecord = paymentService.paymentSelectTotalRecord(searchVo);
		logger.info("마이페이지 결제내역 결과, totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);


		
		model.addAttribute("vo",vo);
//		model.addAttribute("list",list);
		model.addAttribute("list",paymentList);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "/mypage/paymentdetails";
	}
	
	
	@RequestMapping("/detailedPaymentHistory")
	public String detailedPaymentHistory(HttpSession session, @RequestParam(defaultValue = "0") int orderNo, Model model) {
		int no=(int)session.getAttribute("no");
		
		logger.info("마이페이지 주문내역 상세 화면, 파라미터 userid={},orderNo={}",no,orderNo);
		
		if(orderNo == 0) {
			model.addAttribute("msg", "잘못된 url 접근입니다.");
			model.addAttribute("url", "/mypage/paymentdetails");
	
			return "/common/message";
		}
		
		UserVO vo= userService.selectById(no);
		logger.info("회원 정보 조회 결과 vo={}", vo);
		
		PaymentHistoryViewVO paymentHistoryViewVO = new PaymentHistoryViewVO();
		paymentHistoryViewVO.setUsersNo(no);
		paymentHistoryViewVO.setOrderNo(orderNo);
		
		List<PaymentHistoryAllVO> list =paymentService.selectPaymentHistoryList(paymentHistoryViewVO);
		logger.info("list.size={}",list.size());
		logger.info("list={}",list);
		
		
		
		model.addAttribute("vo",vo);
		model.addAttribute("list", list);
		
		return "/mypage/detailedPaymentHistory";
		
		
		
	}
	@GetMapping("/signout")
	public void singOut() {
		logger.info("탈퇴 완료 페이지 화면");
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
}
