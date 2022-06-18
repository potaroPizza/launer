<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="side-bar-warper" id="side-bar-warper">
    <div class="side-bar">
        <ul class="nav">
            <a href="<c:url value='/admin/'/>">
                <li class="nav-item">
                    <i class="nav-item-icon fa-solid fa-chalkboard"></i>러너보드
                </li>
            </a>
            <li class="nav-item">
                <a href="<c:url value='/admin/stores'/>">  
                    <i class="nav-item-icon fa-solid fa-store"></i>지점관리
                </a>
            </li>
            <li class="nav-item">
                <a href="<c:url value='/admin/orders'/>">
                    <i class="nav-item-icon fas fa-table"></i>주문관리
                </a>
            </li>
            <li class="nav-item">
                <a href="<c:url value='/admin/users'/>">
                    <i class="nav-item-icon fa-regular fa-user"></i>사용자관리
                </a>
            </li>
            <li class="nav-item">
                <a href="<c:url value='/admin/charts'/>">
                    <i class="nav-item-icon fa-solid fa-chart-line"></i>서비스통계
                </a>
            </li>
            <li class="nav-item">
                게시판 관리<i class="fas fa-angle-down"></i>
            </li>

        </ul>
    </div>
    <div class="side-bar-footer">
        <small>현재 로그인된 아이디:</small><br>
        본사 관리자님
    </div>
</div>