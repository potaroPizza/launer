<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div id="fixed-wrap">
    <aside id="nav-bar" class="left clearfix">
        <div id="menu-part">
            <nav>
                <ul>
                    <li class="sub-title on">
                        <a href="#" onclick="event.preventDefault()">소개</a>
                        <ul class="sub-nav">
                            <li><a href="<c:url value="/"/>">사이트 소개</a></li>
                            <li><a href="<c:url value="/user/pricelist"/>">가격표</a></li>
                            <li><a href="<c:url value="/"/>">가이드</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/laundryService/order/orderMake">세탁서비스</a>
                    </li>
                    <%--<li>
                        <a href="#">라이프</a>
                    </li>--%>
                    <li class="sub-title">
                        <a href="#" onclick="event.preventDefault();">고객소통게시판</a>
                        <ul class="sub-nav">
                            <li><a href="<c:url value="/user/board/notice"/>">공지사항 / FAQ</a></li>
<%--                            <li><a href="#">문의 게시판</a></li>--%>
                            <li><a href="<c:url value="/user/board/review"/>">후기 게시판</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
            <div class="sub-link">
                <nav>
                    <ul>
                        <li>
                            <a href="<c:url value="/delivery/"/>">러너크루</a>
                        </li>
                        <li>
                            <a href="<c:url value="/admin/"/>">관리자</a>
                        </li>
                    </ul>
                </nav>
            </div>
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
                    <img src="${pageContext.request.contextPath}/images/logo_4.svg" alt="logo">
                </a>
            </h1>
            <div id="header-right">
                <c:if test="${!empty sessionScope.email}">
                    <a href="<c:url value="/user/logout"/>">
                        <div class="line"></div>
                        <span>LOG OUT</span>
                        <div class="hover-text">로그아웃</div>
                    </a>
                    <a href="${pageContext.request.contextPath}/mypage/">
                        <div class="line"></div>
                        <span>MY PAGE</span>
                        <div class="hover-text">내 정보</div>
                    </a>
                </c:if>
                <c:if test="${empty sessionScope.email}">
                <a href="<c:url value='/user/login'/>">
                    <div class="line"></div>
                    <span>LOGIN</span>
                    <div class="hover-text">로그인</div>
                </a>
                </c:if>
            </div>
        </div>
    </header>
</div>