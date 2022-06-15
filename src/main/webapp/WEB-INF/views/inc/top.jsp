<%--
  Created by IntelliJ IDEA.
  User: p__mp4
  Date: 2022/06/13
  Time: 4:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main_fixed_wrap.css" type="text/css" />
    <script src="<c:url value="/js/jquery-3.6.0.min.js"/>" type="text/javascript" text="javascript"></script>
    <script src="<c:url value="/js/jquery-ui.min.js"/>" type="text/javascript" text="javascript"></script>
    <script src="<c:url value="/js/jquery.animate-shadow-min.js"/>" type="text/javascript" text="javascript"></script>
    <script src="<c:url value="/js/main-fixed-wrap.js"/>"></script>
    <script src="https://kit.fontawesome.com/d4af3bb512.js" crossorigin="anonymous"></script>
    <title>MAIN</title>
</head>

<body>
    <div id="fixed-wrap">
        <aside id="nav-bar" class="left clearfix">
            <div id="menu-part">
                <nav>
                    <ul>
                        <li class="sub-title on">
                            <a href="<c:url value="/"/>">소개</a>
                            <ul class="sub-nav">
                                <li><a href="#">사이트 소개</a></li>
                                <li><a href="#">가격표</a></li>
                                <li><a href="#">가이드</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/laundryService/order/orderMake">세탁서비스</a>
                        </li>
                        <li>
                            <a href="#">라이프</a>
                        </li>
                        <li class="sub-title">
                            <a href="#" onclick="event.preventDefault();">고객소통게시판</a>
                            <ul class="sub-nav">
                                <li><a href="#">공지사항 / FAQ</a></li>
                                <li><a href="#">문의 게시판</a></li>
                                <li><a href="#">후기 게시판</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>
            <a href="#" id="side-btn">
                <div></div>
                <i class="fa-solid fa-caret-right"></i>
            </a>
        </aside>
        <div id="modal-background"></div>
        <header id="header-wrap">
            <div class="header-slide-down"></div>
            <div id="header" class="clearfix">
                <h1 id="logo">
                    <a href="<c:url value="/"/>">
                        <img src="${pageContext.request.contextPath}/images/logo_3.svg" alt="logo">
                    </a>
                </h1>
                <div id="header-right">
                    <a href="#">
                        <i class="fa-solid fa-right-from-bracket"></i>
                    </a>
                    <a href="#">
                        <i class="fa-solid fa-circle-user"></i>
                    </a>
                </div>
            </div>
        </header>
    </div>
