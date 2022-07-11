<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<header id="header-wrap" class="main-width">
    <div class="menu-btn">
        <a href="#"><i class="fa-solid fa-circle-arrow-right"></i></a>
    </div>
    <div id="logo">
        <a href="<c:url value="/delivery/"/>">
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
                    <li><a href="<c:url value="/delivery/pass"/>">내 배송목록</a></li>
                </ul>
            </li>
            <li><a href="<c:url value="/delivery/board/notice"/>">공지사항</a></li>
            <li><span class="sub-btn">마이페이지</span>
                <ul class="sub-nav">
                    <li><a href="<c:url value="/delivery/income"/>">내 수입</a></li>
                    <li><a href="<c:url value="/delivery/useredit"/>">내 정보 수정</a></li>
                    <li><a href="<c:url value="/delivery/editPwd"/>">비밀번호 변경</a></li>
                    <li><a href="<c:url value="/delivery/withdrawDelivery"/>">회원탈퇴</a></li>
                </ul>
            </li>
            <li><a href="#"></a></li>
        </ul>
        <button class="logout-btn" onclick="location.href = '<c:url value="/delivery/logout"/>'">
            <p><i class="fa-solid fa-arrow-right-from-bracket"></i></p>
        </button>
        <div class="content">
            <div class="close">
                <div>CLOSE</div>
            </div>
        </div>
    </nav>
</aside>