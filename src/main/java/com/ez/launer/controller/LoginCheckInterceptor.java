package com.ez.launer.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

public class LoginCheckInterceptor implements HandlerInterceptor {
    private static final Logger logger = LoggerFactory.getLogger(LoginCheckInterceptor.class);

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        logger.info("preHandle() 실행");

        HttpSession session = request.getSession();

        String sClassNo= (String) session.getAttribute("classNo");
        logger.info("sClassNo = {}", sClassNo);

        if (sClassNo != null && !sClassNo.isEmpty()) {
            response.setContentType("text/html; charset = UTF-8");
            PrintWriter out = response.getWriter();

            out.print("<script type='text/javascript'>");
            out.print("alert('로그인중입니다.');");
            out.print("history.back();");
            out.print("</script>");

            return false;
        }

        return true;	//다음 컨트롤러가 수행됨
    }
}
