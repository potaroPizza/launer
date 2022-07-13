package com.ez.launer.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

public class AdminInterceptor implements HandlerInterceptor {
    private Logger logger = LoggerFactory.getLogger(AdminInterceptor.class);

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        logger.info("AdminInterceptor preHandle() 실행");

        HttpSession session = request.getSession();

        String sClassNo = (String)session.getAttribute("classNo");
        logger.info("sClassNo = {}", sClassNo);

        String msg = "", url = "";
        int cnt = 0;
        if(sClassNo == null || sClassNo.isEmpty()) {
            cnt++;
            msg = "관리자 페이지를 이용하시려면 \\n먼저 로그인 해주세요.";
            url = "location.href = '" + request.getContextPath() + "/admin/adminLogin';";
        }else {
            int classNo = Integer.parseInt(sClassNo);
            if(classNo == 1 || classNo == 2) {
                cnt++;
                String className = classNo == 1 ? "사용자" : "배송기사";

                msg = "관리자 페이지 접근 권한이 없습니다. (" + className + ");";
                url = "history.back();";
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


        return true;
    }
}
