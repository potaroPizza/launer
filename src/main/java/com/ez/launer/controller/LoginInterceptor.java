package com.ez.launer.controller;


import java.io.PrintWriter;

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
		logger.info("preHandle() 실행");

		HttpSession session = request.getSession();

		String email = (String) request.getSession().getAttribute("email");
		logger.info("email = {}", email);

		if(email == null || email.isEmpty()) {
			response.setContentType("text/html; charset = UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script type='text/javascript'>");
			out.print("alert('먼저 로그인하세요.');");
			out.print("location.href = '" + request.getContextPath() + "/user/login';");
			out.print("</script>");

			return false;
		}

		session.setAttribute("CHK_LOGIN", true);	//이게 될까~
		return true;	//다음 컨트롤러가 수행됨
	}
}
