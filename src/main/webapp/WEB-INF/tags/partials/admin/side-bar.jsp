<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="side-bar-warper" id="side-bar-warper">
    <div class="side-bar">
        <ul class="nav">
            <a href="<c:url value='/admin/'/>">
                <li class="nav-item">
	                <span>
	                    <i class="nav-item-icon fa-solid fa-chalkboard"></i>러너보드
	                </span>
                </li>
            </a>
            <a href="<c:url value='/admin/stores'/>"> 
                <li class="nav-item"> 
	                <span>
                    <i class="nav-item-icon fa-solid fa-store"></i>지점관리
                    </span>
                </li>
            </a>
            <a href="<c:url value='/admin/orders'/>">
                <li class="nav-item">
	                <span>
                    <i class="nav-item-icon fas fa-table"></i>주문관리
                    </span>
                </li>
            </a>
            <li class="nav-item">
                <a href="<c:url value='/admin/users'/>">
	                <span>
                    <i class="nav-item-icon fa-regular fa-user"></i>사용자관리
                    </span>
                </a>
            </li>
            <a href="<c:url value='/admin/charts'/>">
                <li class="nav-item">
	                <span>
                    <i class="nav-item-icon fa-solid fa-chart-line"></i>서비스통계
                    </span>
                </li>
            </a>
            <li class="nav-item has-child">
                <span>
                게시판 관리
                </span>
                <ul class="nav">
                	<a href="<c:url value='/user/board/notice'/>">
		                <li class="nav-item">
	                <span>
		                    고객공지 게시판
		                    </span>
		                </li>
		            </a>
		            <a href="<c:url value='/delivery/board/notice'/>"> 
		                <li class="nav-item"> 
	                <span>
		                    배송공지 게시판
		                    </span>
		                </li>
		            </a>
		            <a href="<c:url value='/user/board/review'/>">
		                <li class="nav-item">
	                <span>
		                	이용후기 게시판
		                	</span>
		                </li>
		            </a>
                </ul>
            </li>

        </ul>
    </div>
    <div class="side-bar-footer">
        <small>현재 로그인된 아이디:</small><br>
        <c:if test="${!empty sessionScope.adminName}">
        	${sessionScope.adminName}님
        </c:if>
        <c:if test="${empty sessionScope.adminName}">
        	
        </c:if>
    </div>
</div>