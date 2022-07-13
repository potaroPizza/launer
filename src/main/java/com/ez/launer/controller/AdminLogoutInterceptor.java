package com.ez.launer.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;

public class AdminLogoutInterceptor implements HandlerInterceptor {
	private static final Logger logger = LoggerFactory.getLogger(AdminLogoutInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("관리자 로그아웃체크 인터셉터 실행");

		HttpSession session = request.getSession();

		String adminEmail = (String) request.getSession().getAttribute("adminEmail");
		logger.info("adminEmail = {}", adminEmail);

		if(adminEmail != null && !adminEmail.isEmpty()) {
			response.setContentType("text/html; charset = UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script type='text/javascript'>");
			out.print("alert('관리자 페이지를 벗어나 보안을 위해,"
					+ "\\n자동적으로 관리자 계정은 로그아웃됩니다.');");
			out.print("location.href = '" + request.getContextPath() + "/';");
			out.print("</script>");

//			session.removeAttribute("adminEmail");
			session.invalidate();
//			session = request.getSession();

			/*response.setHeader("cache-control","no-cache");
			response.setHeader("expires","0");
			response.setHeader("pragma","no-cache");*/

			return false;
		}

		return true;
	}
}
