<%--
  Created by IntelliJ IDEA.
  User: p__mp4
  Date: 2022/06/17
  Time: 5:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/layouts/delivery" %>
<t:wrapper>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <script type="text/javascript">
        const groupNo = ${groupNo};

        window.onload = () => markerSet(${officeVO.latY}, ${officeVO.lonX});


        function markerSet(x, y) {
            $("html, body").animate({
                scrollTop: 0
            }, 200);

            let mapContainer = document.getElementById("map"), // 지도를 표시할 div
                mapOption = {
                    center: new kakao.maps.LatLng(x, y), // 지도의 중심좌표
                    level: 3 // 지도의 확대 레벨
                };
            // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
            let map = new kakao.maps.Map(mapContainer, mapOption);

            // 마커가 표시될 위치입니다
            let markerPosition = new kakao.maps.LatLng(x, y);

            // 마커를 생성합니다
            let marker = new kakao.maps.Marker({
                position: markerPosition
            });

            // 마커가 지도 위에 표시되도록 설정합니다
            marker.setMap(map);
        }

        function processing(formData, element) {
            $.ajax({
                url: "<c:url value='/delivery/process'/>",
                data: formData.serialize(),
                method: "POST",
                success: (res) => {
                    console.log("ajax 응답 : " + JSON.stringify(res));
                    let $list = $(element).parent().parent();
                    $list.animate({
                        left: "200%"
                    }, 100, () => {
                        setTimeout(() => {
                            $list.remove();
                        }, 400);
                    })
                },
                error: (xhr, status, error) => alert("error : " + error)
            });
        }

        //완료
        function clearEvent(element, orderNo) {
            const $formData = setForm(element, orderNo, "clear");

            processing($formData, element);
        }


        //취소
        function cancellation(element, orderNo) {
            const $formData = setForm(element, orderNo, "remove");

            processing($formData, element);
        }



        //form의 input을 설정
        function setForm(element, orderNo, type) {
            const $formData = $("form[name=process-form]");
            let pay = $(element).parent().parent().find("input[name=payValue]").val();
            $formData.find("input[name=orderNo]").val(orderNo).end().find("input[name=pay]").val(pay);

            let resultStatus;
            if(type === "clear") {  //완료 처리버튼일 경우
                resultStatus = groupNo === 1 ? 3 : groupNo === 2 ? 6 : 0;
            }else if(type === "remove") {
                resultStatus = groupNo === 1 ? 1 : groupNo === 2 ? 4 : 0;
            }

            $formData.find("input[name=orderStatusNo]").val(resultStatus);
            return $formData;
        }

        function removeForm() {
            const $formData = $("form[name=process-form]");
            $formData.find("input[name=payValue]").val("").end().find("input[name=pay]").val("");
        }
    </script>
    <div class="fixed-margin-top"></div>
    <div id="map" style="width: 100%; height: 350px"></div>
    <div id="deliveryList">
        <div class="title-part">
            <h1 id="title">
                <strong>${deliveryName }</strong>
                님의 현재 ${groupNo == 1 ? "수거목록" : groupNo == 2 ? "배송목록" : "유효한 값이 아님"}
            </h1>
            <p>총 ${countList}건</p>
        </div>
        <form name="process-form">
            <input type="hidden" name="orderNo"/>
            <input type="hidden" name="groupNo" value="${groupNo}"/>
            <input type="hidden" name="pay"/>
            <input type="hidden" name="orderStatusNo" value="${groupNo == 1 ? 3 : groupNo == 2 ? 6 : 0}"/>
        </form>
        <div class="list-part">
            <c:if test="${empty list}">
                <h3 style="text-align: center">항목이 없습니다.</h3>
            </c:if>
            <c:if test="${!empty list}">
                <c:forEach var="vo" items="${list }">
                    <c:set var="title" value=""/>
                    <c:set var="titleCnt" value="0"/>
                    <c:set var="pay" value="${(vo.orderOfficeView['TOTAL_PRICE'] / 100) * 10}"/>
                    <c:forEach var="titleMap" items="${vo.orderDetails}">
                        <c:if test="${titleCnt == 0}">
                            <c:set var="title" value="${titleMap.CATEGORY_NAME}"/>
                        </c:if>
                        <c:if test="${titleCnt != 0}">
                            <c:set var="title" value="${title}, ${titleMap.CATEGORY_NAME}"/>
                        </c:if>
                        <c:set var="titleCnt" value="${titleCnt + 1}"/>
                    </c:forEach>
                    <div class="list-box">
                        <h3>${title}</h3>
                        <div class="text-box" onclick="markerSet('${vo.orderOfficeView['LON_X']}', '${vo.orderOfficeView['LAT_Y']}')">
                            <div class="left">
                                <div class="text-list">
                                    <p>신청자 <strong>${vo.orderOfficeView['NAME']}</strong></p>
                                    <p>수량 <strong>${vo.orderOfficeView['SUM']}</strong></p>
                                    <p>수당 <strong><fmt:formatNumber value="${pay}" pattern="#,###"/> 원</strong></p>
                                    <input type="hidden" name="payValue" value="${pay}"/>
                                </div>
                                <div class="text-list">
                                    <p>위치 <strong>${vo.orderOfficeView['ADDRESS']}</strong></p>
                                </div>
                            </div>
                        </div>
                        <div class="detail-map"></div>
                        <div class="btn-box">
                            <button onclick="cancellation(this, ${vo.orderOfficeView['NO']})">취소</button>
                            <button onclick="clearEvent(this, ${vo.orderOfficeView['NO']})">완료</button>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
            <%--<div class="list-box">
                <h3>상품명</h3>
                <div class="text-box" onclick="mapDraw(this, 37.572713983772275, 126.96683255214562)">
                    <div class="left">
                        <div class="text-list">
                            <p>신청자 <strong>홍길동</strong></p>
                            <p>위치 <strong>지역주소</strong></p>
                            <p>수당 <strong> 원</strong></p>
                        </div>
                        <div class="text-list">
                            <p>위치 <strong>서울시 금천구 시흥대로213길 123</strong></p>
                        </div>
                    </div>
                </div>
                <div class="detail-map"></div>
                <div class="btn-box">
                    <button>취소</button>
                    <button>완료</button>
                </div>
            </div>--%>
        </div>

    </div>
</t:wrapper>