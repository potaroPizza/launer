package com.ez.launer.controller;


import java.io.PrintWriter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.servlet.HandlerInterceptor;

public class LoginInterceptor implements HandlerInterceptor {
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		logger.info("LoginInterceptor 발생");

		String sClassNo = (String)session.getAttribute("classNo");

		int cnt = 0;
		String msg = "", url = "";
		if(sClassNo == null || sClassNo.isEmpty()) {
			cnt++;
			/*msg = "접근 권한이 없습니다.";
			url = "location.href = '" + request.getContextPath() + "/';";*/
			msg = "로그인 후 이용해주세요.";
			url = "location.href = '" + request.getContextPath() + "/user/login';";
		}else {
			int classNo = Integer.parseInt(sClassNo);

			if(((request.getContextPath() + "/user/board/notice").equals(request.getRequestURI())) ||
					((request.getContextPath() + "/user/board/review").equals(request.getRequestURI()))) {
				if(classNo == 2) {
					cnt++;
					msg = "접근 권한이 없습니다. (배송기사 접속중)";
					url = "location.href = '" + request.getContextPath() + "/delivery/';";
				}
			}else {
				if(classNo == 2 || classNo == 3 || classNo == 4) {
					cnt++;

					String className = "관리자";
					if(classNo == 2) className = "배송기사";

					msg = "접근 권한이 없습니다. (" + className + " 접속중)";
					url = "history.back();";
				}
			}


			/*if(classNo == 2 || classNo == 3 || classNo == 4) {
				String className = "관리자";
				if(classNo == 2) className = "배송기사";

				msg = "접근 권한이 없습니다. (" + className + " 접속중)";
				url = "history.back();";
			}*/
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

		return true;
	}

	/*@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("preHandle() 실행");

		HttpSession session = request.getSession();

		String sClassNo= (String.valueOf(session.getAttribute("classNo")));
		logger.info("classNo = {}", sClassNo);

		String email = (String) request.getSession().getAttribute("email");
		logger.info("email = {}", email);

		if (sClassNo == null || sClassNo.isEmpty()) {
			logger.info("현재 위치 : " + request.getRequestURI());
			String tempURL = request.getRequestURI();
			tempURL = tempURL.substring(tempURL.indexOf("/", 2));

			Cookie cookie = new Cookie("tempURL", tempURL);
			cookie.setPath("/");
			response.addCookie(cookie);

			response.setContentType("text/html; charset = UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script type='text/javascript'>");
			out.print("alert('먼저 로그인하세요.');");
			out.print("location.href = '" + request.getContextPath() + "/user/login';");
			out.print("</script>");

			return false;
		}

		int classNo = Integer.parseInt(sClassNo);
		if(classNo == 2) {
			response.setContentType("text/html; charset = UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script type='text/javascript'>");
			out.print("alert('접근 권한이 없습니다.');");
			out.print("location.href = '" + request.getContextPath() + "/delivery/';");
			out.print("</script>");

			return false;
		}

		session.setAttribute("CHK_LOGIN", true);	//이게 될까~
		return true;	//다음 컨트롤러가 수행됨
	}*/
}
