<%--
  Created by IntelliJ IDEA.
  User: p__mp4
  Date: 2022/06/13
  Time: 10:01 PMs| Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <title>Launer Delivery</title>
    <link href="<c:url value="/delivery/css/delivery-fixed.css"/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="/delivery/css/main.css"/>" rel="stylesheet" type="text/css"/>
    <script src="<c:url value="/js/jquery-3.6.0.min.js"/>"></script>
    <script src="<c:url value="/js/jquery-ui.min.js"/>"></script>
    <script src="https://kit.fontawesome.com/d4af3bb512.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2105ed82df9c00048785f53fbd42044d"></script>
    <script src="<c:url value="/delivery/js/delivery-fixed.js"/>"></script>
    <script src="<c:url value="/delivery/js/main.js"/>"></script>
    <script>
        window.onload = function() {
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                mapOption = {
                    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                    level: 3 // 지도의 확대 레벨
                };

            // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
            var map = new kakao.maps.Map(mapContainer, mapOption);
        }
    </script>
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
                <li><a href="#">요청 리스트</a></li>
                <li class="sub-btn">내 할일
                    <ul class="sub-nav">
                        <li><a href="#">내 수거목록</a></li>
                        <li><a href="#">내 배송목록</a></li>
                    </ul>
                </li>
                <li><a href="#">공지사항</a></li>
                <li class="sub-btn">마이페이지
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
<%--            <p class="close-btn"><i class="fa-solid fa-arrow-left-long"></i></p>--%>
        </nav>
    </aside>
    <div id="wrap" class="main-width">
        <div id="map"></div>
        <div id="list-part" class="main-width">
            <div id="list-box"><div class="line"></div></div>
            <div id="order-tab-box">
                <div class="pickup-tab on">수거</div>
                <div class="delivery-tab">배송</div>
            </div>
            <div id="orders-list">
                <div class="order-box">
                    <h3>상품명</h3>
                    <div class="order-text-box">
                        <div class="left">
                            <div class="order-text-list">
                                <p>신청자 <strong>홍길동</strong></p>
                                <p>위치 <strong>지역주소</strong></p>
                            </div>
                            <div class="order-text-list">
                                <p>위치 <strong>서울시 금천구 시흥대로213길 123</strong></p>
                            </div>
                        </div>
                        <div class="right">
                            <button>수거하기</button>
                        </div>
                    </div>
                </div>
                <div class="order-box">
                    <h3>상품명</h3>
                    <div class="order-text-box">
                        <div class="left">
                            <div class="order-text-list">
                                <p>신청자 <strong>홍길동</strong></p>
                                <p>위치 <strong>지역주소</strong></p>
                            </div>
                            <div class="order-text-list">
                                <p>위치 <strong>서울시 금천구 시흥대로213길 123</strong></p>
                            </div>
                        </div>
                        <div class="right">
                            <button>수거하기</button>
                        </div>
                    </div>
                </div>
                <div class="order-box">
                    <h3>상품명</h3>
                    <div class="order-text-box">
                        <div class="left">
                            <div class="order-text-list">
                                <p>신청자 <strong>홍길동</strong></p>
                                <p>위치 <strong>지역주소</strong></p>
                            </div>
                            <div class="order-text-list">
                                <p>위치 <strong>서울시 금천구 시흥대로213길 123</strong></p>
                            </div>
                        </div>
                        <div class="right">
                            <button>수거하기</button>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</body>
</html>
