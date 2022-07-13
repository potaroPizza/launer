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
                            <li><a href="<c:url value="/laundryService/order/guide"/>">가이드</a></li>
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
                            <a href="<c:url value="/admin/adminLogin"/>">관리자</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
        <c:if test="${!(sessionScope.classNo == 2 || sessionScope.classNo == 3 || sessionScope.classNo == 4)}">
            <a href="#" id="side-btn">
                <div></div>
                <i class="fa-solid fa-caret-right"></i>
            </a>
        </c:if>
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
                <c:if test="${empty sessionScope.classNo}">
                    <a href="<c:url value='/user/login'/>">
                        <div class="line"></div>
                        <span>LOGIN</span>
                        <div class="hover-text">로그인</div>
                    </a>
                </c:if>
                <c:if test="${!empty sessionScope.classNo}">
                    <c:if test="${sessionScope.classNo == 1}">
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
                    <c:if test="${sessionScope.classNo != 1}">
                        <c:set var="classNo" value="${sessionScope.classNo}"/>
                        <c:set var="classURL" value='${pageContext.request.contextPath}${classNo == 2 ? "/delivery/" : "/admin/"}'/>

                        <a href="${classURL}">
                            <div class="line"></div>
                            <span>RETURN</span>
                            <div class="hover-text">돌아가기</div>
                        </a>
                    </c:if>
                </c:if>

                <%--<c:if test="${!empty sessionScope.email}">
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
                    <c:if test="${!empty sessionScope.dmail}">
                        <a href="<c:url value="/delivery/"/>">
                            <div class="line"></div>
                            <span>RETURN</span>
                            <div class="hover-text">돌아가기</div>
                        </a>
                    </c:if>
                    <c:if test="${empty sessionScope.dmail}">
                        <a href="<c:url value='/user/login'/>">
                            <div class="line"></div>
                            <span>LOGIN</span>
                            <div class="hover-text">로그인</div>
                        </a>
                    </c:if>
                </c:if>--%>
            </div>
        </div>
    </header>
</div>