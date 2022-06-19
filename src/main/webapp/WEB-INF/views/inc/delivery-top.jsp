<%--
  Created by IntelliJ IDEA.
  User: p__mp4
  Date: 2022/06/17
  Time: 5:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <title>Launer Delivery</title>
    <link href="<c:url value="/delivery/css/delivery-fixed.css"/>" rel="stylesheet" type="text/css"/>
    <script src="<c:url value="/js/jquery-3.6.0.min.js"/>"></script>
    <script src="<c:url value="/js/jquery-ui.min.js"/>"></script>
    <script src="https://kit.fontawesome.com/d4af3bb512.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2105ed82df9c00048785f53fbd42044d"></script>
    <script src="<c:url value="/delivery/js/delivery-fixed.js"/>"></script>
</head>
<body>
<header id="header-wrap" class="main-width">
    <div class="menu-btn">
        <a href="#"><i class="fa-solid fa-circle-arrow-right"></i></a>
    </div>
    <div id="logo">
        <a href="#">
            <img src="<c:url value="/images/logo_4.svg"/>"/>
        </a>
    </div>
</header>
<aside id="aside-wrap">
    <nav>
        <ul class="nav-part">
            <li><a href="<c:url value="/delivery/"/>">요청 리스트</a></li>
            <li><span class="sub-btn">내 할일</span>
                <ul class="sub-nav">
                    <li><a href="<c:url value="/delivery/pickup"/>">내 수거목록</a></li>
                    <li><a href="<c:url value="/delivery/"/>">내 배송목록</a></li>
                </ul>
            </li>
            <li><a href="#">공지사항</a></li>
            <li><span class="sub-btn">마이페이지</span>
                <ul class="sub-nav">
                    <li><a href="#">내 정보</a></li>
                    <li><a href="#">내 수입</a></li>
                </ul>
            </li>
        </ul>
        <div class="content">
            <div class="close">
                <div>CLOSE</div>
            </div>
        </div>
    </nav>
</aside>
