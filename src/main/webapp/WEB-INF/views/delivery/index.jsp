<%--
  Created by IntelliJ IDEA.
  User: p__mp4
  Date: 2022/06/13
  Time: 10:01 PMs| Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/layouts/delivery" %>
<t:wrapper>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <div id="delivery-main" class="main-width">
        <script src="<c:url value="/delivery/js/main.js"/>"></script>
        <div id="map"></div>
        <script>
            const defaultY = ${officeVO.latY};
            const defaultX = ${officeVO.lonX};

            const defaultPoint = new kakao.maps.LatLng(defaultY, defaultX);

            let map;

            window.onload = function () {
                let mapContainer = document.getElementById('map'), // 지도를 표시할 div
                    mapOption = {
                        center: defaultPoint, // 지도의 중심좌표
                        level: 5 // 지도의 확대 레벨
                    };
                // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
                map = new kakao.maps.Map(mapContainer, mapOption);


                var polygonPath = [
                    <c:set var = "c" value="0"/>
                    <c:forEach var="i" items="${polygon}">
                        <c:set var = "c" value="${c + 1}"/>
                        new kakao.maps.LatLng(${i[0]}, ${i[1]})
                        <c:if test="${fn:length(polygon) != c}">,</c:if>
                    </c:forEach>
                ];

                // 지도에 표시할 다각형을 생성합니다
                var polygon = new kakao.maps.Polygon({
                    path: polygonPath, // 그려질 다각형의 좌표 배열입니다
                    strokeWeight: 3, // 선의 두께입니다
                    strokeColor: '#39DE2A', // 선의 색깔입니다
                    strokeOpacity: 0.8, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
                    strokeStyle: 'solid', // 선의 스타일입니다
                    fillColor: '#A2FF99', // 채우기 색깔입니다
                    fillOpacity: 0.2 // 채우기 불투명도 입니다
                });
                console.log(polygon.strokeStyle);

                // 지도에 다각형을 표시합니다
                polygon.setMap(map);
            }

            //위치 초기화
            //위치 초기화
            //위치 초기화
            //위치 초기화
            function panTo() {
                map.panTo(defaultPoint);
            }
        </script>
        <div class="zone-box">
            <h3><strong>${deliveryName}</strong> 기사님</h3>
            <p>
                <button onclick="panTo()"><strong>${officeVO.officeName}</strong></button>
                <a href="#"><i class="fa-solid fa-gear"></i></a>
            </p>
            <%--<c:forEach var="a1" items="${ab}">
                <c:forEach var="a2" items="${a1}">
                    ${a2}
                </c:forEach>
                <br/>
            </c:forEach>--%>
        </div>
        <div id="list-part" class="main-width">
            <div id="list-box">
                <div class="line"></div>
            </div>
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
</t:wrapper>