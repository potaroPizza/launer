<%@page contentType="text/html" pageEncoding="UTF-8"%>


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
                    <img src="${pageContext.request.contextPath}/images/logo_4.svg" alt="logo">
                </a>
            </h1>
            <div id="header-right">
                <a href="#">
                    <%--                        <i class="fa-solid fa-right-from-bracket"></i>--%>
                    <div class="line"></div>
                    <span>LOG OUT</span>
                    <div class="hover-text">로그아웃</div>
                </a>
                <a href="${pageContext.request.contextPath}/mypage/mypage">
                    <%--                        <i class="fa-solid fa-circle-user"></i>--%>
                    <div class="line"></div>
                    <span>MY PAGE</span>
                    <div class="hover-text">내 정보</div>
                </a>
            </div>
        </div>
    </header>
</div>