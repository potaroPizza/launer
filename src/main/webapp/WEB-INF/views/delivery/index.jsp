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
            //지도 관련
            //지도 관련
            //지도 관련
            //지도 관련
            //지도 관련
            //지도 관련
            const defaultY = ${officeVO.latY};
            const defaultX = ${officeVO.lonX};

            const defaultPoint = new kakao.maps.LatLng(defaultY, defaultX);

            let map;

            window.onload = function () {
                viewList(1);
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
            //지도 관련
            //지도 관련
            //지도 관련
            //지도 관련
            //지도 관련



            //지도 마커 관련
            //지도 마커 관련
            //지도 마커 관련
            //지도 마커 관련
            const MARKER_WIDTH = 33, // 기본, 클릭 마커의 너비
                MARKER_HEIGHT = 36, // 기본, 클릭 마커의 높이
                OFFSET_X = 12, // 기본, 클릭 마커의 기준 X좌표
                OFFSET_Y = MARKER_HEIGHT, // 기본, 클릭 마커의 기준 Y좌표
                OVER_MARKER_WIDTH = 40, // 오버 마커의 너비
                OVER_MARKER_HEIGHT = 42, // 오버 마커의 높이
                OVER_OFFSET_X = 13, // 오버 마커의 기준 X좌표
                OVER_OFFSET_Y = OVER_MARKER_HEIGHT, // 오버 마커의 기준 Y좌표
                SPRITE_MARKER_URL = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markers_sprites2.png', // 스프라이트 마커 이미지 URL
                SPRITE_WIDTH = 126, // 스프라이트 이미지 너비
                SPRITE_HEIGHT = 146, // 스프라이트 이미지 높이
                SPRITE_GAP = 10; // 스프라이트 이미지에서 마커간 간격

            let markerSize = new kakao.maps.Size(MARKER_WIDTH, MARKER_HEIGHT), // 기본, 클릭 마커의 크기
                markerOffset = new kakao.maps.Point(OFFSET_X, OFFSET_Y), // 기본, 클릭 마커의 기준좌표
                overMarkerSize = new kakao.maps.Size(OVER_MARKER_WIDTH, OVER_MARKER_HEIGHT), // 오버 마커의 크기
                overMarkerOffset = new kakao.maps.Point(OVER_OFFSET_X, OVER_OFFSET_Y), // 오버 마커의 기준 좌표
                spriteImageSize = new kakao.maps.Size(SPRITE_WIDTH, SPRITE_HEIGHT); // 스프라이트 이미지의 크기

            /*let positions = [  // 마커의 위치
                    new kakao.maps.LatLng(37.5768086518, 126.989058671)
                ],
                selectedMarker = null; // 클릭한 마커를 담을 변수*/


            function markerFor(positions) {      //이게 맞나?
                // 지도 위에 마커를 표시합니다
                for (let i = 0, len = positions.length; i < len; i++) {
                    let gapX = (MARKER_WIDTH + SPRITE_GAP), // 스프라이트 이미지에서 마커로 사용할 이미지 X좌표 간격 값
                        originY = (MARKER_HEIGHT + SPRITE_GAP) * i, // 스프라이트 이미지에서 기본, 클릭 마커로 사용할 Y좌표 값
                        overOriginY = (OVER_MARKER_HEIGHT + SPRITE_GAP) * i, // 스프라이트 이미지에서 오버 마커로 사용할 Y좌표 값
                        normalOrigin = new kakao.maps.Point(0, originY), // 스프라이트 이미지에서 기본 마커로 사용할 영역의 좌상단 좌표
                        clickOrigin = new kakao.maps.Point(gapX, originY), // 스프라이트 이미지에서 마우스오버 마커로 사용할 영역의 좌상단 좌표
                        overOrigin = new kakao.maps.Point(gapX * 2, overOriginY); // 스프라이트 이미지에서 클릭 마커로 사용할 영역의 좌상단 좌표

                    // 마커를 생성하고 지도위에 표시합니다
                    addMarker(positions[i], normalOrigin, overOrigin, clickOrigin);
                }
            }


            // 마커를 생성하고 지도 위에 표시하고, 마커에 mouseover, mouseout, click 이벤트를 등록하는 함수입니다
            function addMarker(position, normalOrigin, overOrigin, clickOrigin) {
                // 기본 마커이미지, 오버 마커이미지, 클릭 마커이미지를 생성합니다
                var normalImage = createMarkerImage(markerSize, markerOffset, normalOrigin),
                    overImage = createMarkerImage(overMarkerSize, overMarkerOffset, overOrigin),
                    clickImage = createMarkerImage(markerSize, markerOffset, clickOrigin);

                // 마커를 생성하고 이미지는 기본 마커 이미지를 사용합니다
                var marker = new kakao.maps.Marker({
                    map: map,
                    position: position
                });

                /*// 마커에 mouseover 이벤트를 등록합니다
                kakao.maps.event.addListener(marker, 'mouseover', function() {

                    // 클릭된 마커가 없고, mouseover된 마커가 클릭된 마커가 아니면
                    // 마커의 이미지를 오버 이미지로 변경합니다
                    if (!selectedMarker || selectedMarker !== marker) {
                        marker.setImage(overImage);
                    }
                });*/

                // 마커에 mouseout 이벤트를 등록합니다
                kakao.maps.event.addListener(marker, 'mouseout', function() {

                    // 클릭된 마커가 없고, mouseout된 마커가 클릭된 마커가 아니면
                    // 마커의 이미지를 기본 이미지로 변경합니다
                    /*if (!selectedMarker || selectedMarker !== marker) {
                        marker.setImage(normalImage);
                    }*/
                });

                // 마커에 click 이벤트를 등록합니다
                kakao.maps.event.addListener(marker, 'click', function() {
                    // 클릭된 마커가 없고, click 마커가 클릭된 마커가 아니면
                    // 마커의 이미지를 클릭 이미지로 변경합니다
                    /*if (!selectedMarker || selectedMarker !== marker) {

                        // 클릭된 마커 객체가 null이 아니면
                        // 클릭된 마커의 이미지를 기본 이미지로 변경하고
                        !!selectedMarker && selectedMarker.setImage(selectedMarker.normalImage);

                        // 현재 클릭된 마커의 이미지는 클릭 이미지로 변경합니다
                        marker.setImage(clickImage);
                    }*/

                    // 클릭된 마커를 현재 클릭된 마커 객체로 설정합니다
                    //selectedMarker = marker;
                });
            }




            // MakrerImage 객체를 생성하여 반환하는 함수입니다
            function createMarkerImage(markerSize, offset, spriteOrigin) {
                var markerImage = new kakao.maps.MarkerImage(
                    SPRITE_MARKER_URL, // 스프라이트 마커 이미지 URL
                    markerSize, // 마커의 크기
                    {
                        offset: offset, // 마커 이미지에서의 기준 좌표
                        spriteOrigin: spriteOrigin, // 스트라이프 이미지 중 사용할 영역의 좌상단 좌표
                        spriteSize: spriteImageSize // 스프라이트 이미지의 크기
                    }
                );

                return markerImage;
            }
            //지도 마커 관련
            //지도 마커 관련
            //지도 마커 관련




            function viewList(group) {
                let uriType = group == 1 ? "/listP" : "/listD";
                console.log("<c:url value='/delivery'/>" + uriType);
                $.ajax({
                    url: "<c:url value='/delivery'/>" + uriType,
                    method: "POST",
                    dataType: "JSON",
                    success: (res) => {
                        let listElement = "";
                        /*let positions = [  // 마커의 위치
                            new kakao.maps.LatLng(33.44975, 126.56967),
                            new kakao.maps.LatLng(33.450579, 126.56956),
                            new kakao.maps.LatLng(33.4506468, 126.5707)
                            ];*/
                        let positions = []; // 마커의 위치

                        $.each(res, (idx, item) => {
                            listElement +=
                                "<div class='order-box'>" +
                                "<h3>상품명</h3>" +
                                "<div class='order-text-box'>" +
                                "<div class='left'>" +
                                "<div class='order-text-list'>" +
                                "<p>신청자 <strong>" + item.NAME + "</strong></p>" +
                                "<p>수량 <strong>" + item.SUM + "</strong></p>" +
                                "</div>" +
                                "<div class='order-text-list'>" +
                                "<p>위치 <strong>" + item.ADDRESS +"</strong></p>" +
                                "</div>" +
                                "</div>" +
                                "<div class='right'>" +
                                "<button onclick='addList(" + item.NO + ")'>수거하기</button>" +
                                "</div>" +
                                "</div>" +
                                "</div>";

                            positions.push(new kakao.maps.LatLng(item.LON_X, item.LAT_Y));
                        });

                        console.log(positions);

                        $("#orders-list").html(listElement);

                        markerFor(positions);
                    },
                    error: (xhr, status, error) => {
                        alert("error : " + error);
                    }
                });
            }
        </script>
        <div class="zone-box">
            <h3><strong>${deliveryName}</strong> 기사님</h3>
            <p>
                <button onclick="panTo()"><strong>${officeVO.officeName}</strong></button>
                <a href="#"><i class="fa-solid fa-gear"></i></a>
            </p>
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
                <%--<div class="order-box">
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
                </div>--%>

            </div>
        </div>
    </div>
</t:wrapper>