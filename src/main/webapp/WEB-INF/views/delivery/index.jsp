<%--
  Created by IntelliJ IDEA.
  User: p__mp4
  Date: 2022/06/13
  Time: 10:01 PMs| Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/layouts/delivery" %>
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
                curUpdate();
                viewList(groupNo);
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
                    var marker = new kakao.maps.Marker({
                        map: map,
                        position: positions[i]
                    });
                }
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
            let positions = []; // 마커의 위치
            let bounds;

            function setBounds() {
                map.setBounds(bounds);
            }
            //지도 마커 관련
            //지도 마커 관련
            //지도 마커 관련


            //전부 초기화하는 함수
            function cleanList() {
                $("#orders-list").html("");
                $("#paging-form input[name=currentPage]").val(1);
                var marker = new kakao.maps.Marker({
                    map: map,
                    position: null
                });
            }


            let currentPage = 0;
            let dbCur = 0;
            let lastPage = 0;   //마지막 페이지
            let groupNo = 1;    //수거 : 1, 배송 : 2

            //currentPage 변수와 input value 업데이트 해주는 함수
            function curUpdate() {
                currentPage++;
                $("#paging-form input[name=currentPage]").val(currentPage);
                console.log(currentPage);
                viewList(groupNo);
            }

            function viewList(group) {
                const formSet = $("#paging-form");
                if(group === 1) {
                    formSet.find("input[name=orderStatusNo]").val(1);
                    formSet.find("input[name=listType]").val("PICKUP_DRIVER");
                }else if(group === 2) {
                    formSet.find("input[name=orderStatusNo]").val(4);
                    formSet.find("input[name=listType]").val("DELIVERY_DRIVER");
                }

                let listData = formSet.serialize();
                $.ajax({
                    url: "<c:url value='/delivery/list'/>",
                    method: "POST",
                    data: listData,
                    dataType: "JSON",
                    success: (res) => {
                        let listElement = "";

                        dbCur = res.dbCur;
                        lastPage = res.lastPage;
                        console.log("dbCur = " + dbCur);
                        console.log("lastPage = " + lastPage);

                        if(Array.isArray(res.listMap) && res.listMap.length === 0) {
                            panTo();
                            listElement += "<h1 style='text-align: center'>리스트가 없습니다.</h1>";
                        }else {
                            $.each(res.listMap, (idx, item) => {
                                console.log(item);
                                let titleStr = "";
                                for(let i = 0; i < item.orderDetails.length; i++) {
                                    titleStr += item.orderDetails[i].CATEGORY_NAME;
                                    if(i !== item.orderDetails.length - 1) titleStr += ", ";
                                }
                                let pay = (item.orderOfficeView.TOTAL_PRICE / 100) * 10;

                                listElement +=
                                    "<div class='order-box'>" +
                                    "<h3>" + titleStr +"</h3>" +
                                    "<div class='order-text-box'>" +
                                    "<div class='left'>" +
                                    "<div class='order-text-list'>" +
                                    "<p>신청자 <strong>" + item.orderOfficeView.NAME + "</strong></p>" +
                                    "<p>수량 <strong>" + item.orderOfficeView.SUM + "</strong></p>" +
                                    "<p>수당 <strong>" + pay.toLocaleString('ko-KR') + " 원</strong></p>" +
                                    "</div>" +
                                    "<div class='order-text-list'>" +
                                    "<p>위치 <strong>" + item.orderOfficeView.ADDRESS +"</strong></p>" +
                                    "</div>" +
                                    "</div>" +
                                    "<div class='right'>" +
                                    "<button onclick='addList(" + item.orderOfficeView.NO + ")'>수거하기</button>" +
                                    "</div>" +
                                    "</div>" +
                                    "</div>";

                                positions.push(new kakao.maps.LatLng(item.orderOfficeView.LON_X, item.orderOfficeView.LAT_Y));
                            });
                            console.log(positions);
                        }

                        $("#orders-list").append(listElement);

                        markerFor(positions);

                        bounds = new kakao.maps.LatLngBounds();
                        for (let i = 0; i < positions.length; i++) bounds.extend(positions[i]);
                        setBounds();
                    },
                    error: (xhr, status, error) => {
                        alert("error : " + error);
                    }
                });
            }

            $(() => {
                //스크롤 끝일 때 이벤트 호출
                //스크롤 끝일 때 이벤트 호출
                //스크롤 끝일 때 이벤트 호출
                //스크롤 끝일 때 이벤트 호출
                $("#orders-list").scroll(() => {
                    let scrollBody = $("#orders-list");
                    if((scrollBody[0].scrollHeight - scrollBody.scrollTop()) === scrollBody.outerHeight()) {
                        if(currentPage !== lastPage && (dbCur + 1) !== currentPage) {
                            curUpdate();
                            console.log("리스트 업데이트");
                        }
                    }
                });



                //탭 클릭 시 리스트 전환
                //탭 클릭 시 리스트 전환
                //탭 클릭 시 리스트 전환
                //탭 클릭 시 리스트 전환
                $("#order-tab-box div").click((e) => {
                    let $tabElement = $(e.target);
                    let $groupText = $tabElement.text();
                    console.log($groupText);
                    //수거 : 1, 배송 : 2

                    if($tabElement.hasClass("on")) {
                        $("#orders-list").animate({
                            scrollTop: 0
                        }, 200, "swing");
                    }else {
                        $("#order-tab-box div").removeClass("on");
                        $tabElement.addClass("on");
                        let emp = $groupText === '수거' ? 1 : '배송' ? 2 : 0;
                        console.log("탭 타입 : " + emp);
                        cleanList();
                        viewList(emp);
                    }
                });

            });





        </script>
        <div class="zone-box">
            <h3><strong>${deliveryName}</strong> 기사님</h3>
            <p>
                <button onclick="panTo()"><strong>${officeVO.officeName}</strong></button>
                <a href="#"><i class="fa-solid fa-gear"></i></a>
            </p>
        </div>
        <div id="list-part" class="main-width">
            <form id="paging-form">
                <input type="hidden" name="currentPage" value=""/>
                <input type="hidden" name="orderStatusNo" value=""/>    <%--배송상태 : 수거전 1, 배송대기 4--%>
                <input type="hidden" name="listType" value=""/>     <%--리스트 유형 : 픽업 PICKUP_DRIVER, 배송 DELIVERY_DRIVER--%>
            </form>
            <div id="list-box">
                <div class="line"></div>
            </div>
            <div id="order-tab-box">
                <div class="pickup-tab on">수거</div>
                <div class="delivery-tab">배송</div>
            </div>
            <div id="orders-list">
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
                </div>--%>

            </div>
        </div>
    </div>
</t:wrapper>