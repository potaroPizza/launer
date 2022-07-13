package com.ez.launer.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

public class DeliveryInterceptor implements HandlerInterceptor {
	private static final Logger logger = LoggerFactory.getLogger(DeliveryInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("DeliveryInterceptor preHandle() 실행");

		HttpSession session = request.getSession();

		String sClassNo = (String)session.getAttribute("classNo");
		logger.info("sClassNo = {}", sClassNo);

		int cnt = 0;
		String msg = "", url = "";
		if(sClassNo == null || sClassNo.isEmpty()) {
			cnt++;
			/*msg = "접근 권한이 없습니다.";
			url = "location.href = '" + request.getContextPath() + "/';";*/
			msg = "러너크루 로그인 후 이용해주세요.";
			url = "location.href = '" + request.getContextPath() + "/user/login';";
		}else {
			int classNo = Integer.parseInt(sClassNo);

			if(!("/launer/delivery/board/notice".equals(request.getRequestURI()))) {
				if(classNo == 1 || classNo == 3 || classNo == 4) {
					cnt++;
					String userClass = "사용자";
					if(classNo == 3 || classNo == 4) userClass = "관리자";

					msg = "접근권한이 없습니다. (" + userClass + " 접속중)";
					url = "history.back();";
				}
			}else {
				if(classNo == 1) {
					cnt++;
					msg = "접근권한이 없습니다. (사용자 접속중)";
					url = "history.back();";
				}
			}
		}

		if(cnt > 0) {
			response.setContentType("text/html; charset = UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script type='text/javascript'>");
			out.print("alert('" + msg + "');");
			out.print(url);
			out.print("</script>");

			return false;
		}


		/*if (!(sClassNo.equals("null"))) {
			int classNo = Integer.parseInt(sClassNo);
			String returnText = classNo == 1 ? "사용자" : (classNo == 3 || classNo == 4) ? "관리자" : "";

			int chk = 0;
			if(classNo == 1) chk++;
			*//*else if(classNo == 3 || classNo == 4) {
				logger.info("request.getRequestURI() = {}", request.getRequestURI());
				if(!("/launer/delivery/board/notice".equals(request.getRequestURI()))) chk++;
			}*//*


			if(chk > 0) {
				response.setContentType("text/html; charset = UTF-8");
				PrintWriter out = response.getWriter();

				out.print("<script type='text/javascript'>");
				out.print("alert('" + returnText + " 로그인중입니다.');");
				out.print("history.back();");
				out.print("</script>");

				return false;
			}
		}*/

		/*String dmail = (String)(session.getAttribute("dmail"));
		logger.info("deliveryNo = {}", dmail);

		if(dmail == null || dmail.isEmpty()) {
			response.setContentType("text/html; charset = UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script type='text/javascript'>");
			out.print("alert('먼저 로그인하세요.');");
			out.print("location.href = '" + request.getContextPath() + "/user/login';");
			out.print("</script>");

			return false;
		}*/



		session.setAttribute("CHK_LOGIN", true);	//이게 될까~
		return true;	//다음 컨트롤러가 수행됨
	}
}
