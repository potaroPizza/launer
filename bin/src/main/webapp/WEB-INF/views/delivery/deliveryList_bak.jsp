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
        /*function mapDraw(element, aaa, bbb) {
            if($(element).hasClass("on")) {
                let clearMap = document.getElementById('deliveryList').getElementsByClassName('detail-map on');
                for(let i = 0; i < clearMap.length; i++) clearMap[i].classList.remove('on');
                $(".text-box").removeClass("on");
                $(".detail-map").html("");
            }else {
                $(".text-box").removeClass("on");
                $(element).addClass("on");
                $(".detail-map").html("");

                $(element.parentNode).find(".detail-map").html("<div id='map'></div>");
                /!*let clearMap = document.getElementById('deliveryList').getElementsByClassName('detail-map on');
                for(let i = 0; i < clearMap.length; i++) clearMap[i].classList.remove('on');*!/

                let mapCon = document.getElementById("map");
                // element.parentNode.getElementsByClassName('detail-map')[0].classList.toggle('on');



                /!*$(".text-box").removeClass("on");
                $(element).addClass("on");

                let clearMap = document.getElementById('deliveryList').getElementsByClassName('detail-map on');
                for(let i = 0; i < clearMap.length; i++) clearMap[i].classList.remove('on');

                let mapCon = element.parentNode.getElementsByClassName('detail-map')[0];
                mapCon.classList.toggle('on');*!/

                let mapContainer = document.getElementById("map"), // ????????? ????????? div
                    mapOption = {
                        center: new kakao.maps.LatLng(aaa, bbb), // ????????? ????????????
                        level: 3 // ????????? ?????? ??????
                    };
                // ????????? ????????? div???  ?????? ????????????  ????????? ???????????????
                let map = new kakao.maps.Map(mapContainer, mapOption);

                // ????????? ????????? ???????????????
                let markerPosition = new kakao.maps.LatLng(aaa, bbb);

                // ????????? ???????????????
                let marker = new kakao.maps.Marker({
                    position: markerPosition
                });

                // ????????? ?????? ?????? ??????????????? ???????????????
                marker.setMap(map);
            }
        }*/

        window.onload = () => {
            markerSet(${officeVO.latY}, ${officeVO.lonX});
        }



        function markerSet(x, y) {
            $("html, body").animate({
                scrollTop: 0
            }, 200);

            let mapContainer = document.getElementById("map"), // ????????? ????????? div
                mapOption = {
                    center: new kakao.maps.LatLng(x, y), // ????????? ????????????
                    level: 3 // ????????? ?????? ??????
                };
            // ????????? ????????? div???  ?????? ????????????  ????????? ???????????????
            let map = new kakao.maps.Map(mapContainer, mapOption);

            // ????????? ????????? ???????????????
            let markerPosition = new kakao.maps.LatLng(x, y);

            // ????????? ???????????????
            let marker = new kakao.maps.Marker({
                position: markerPosition
            });

            // ????????? ?????? ?????? ??????????????? ???????????????
            marker.setMap(map);
        }


        function clearEvent(element, orderNo) {
            const $formData = setForm(element, orderNo);

            $.ajax({
                url: "<c:url value='/delivery/process'/>",
                data: $formData.serialize(),
                method: "POST",
                success: (res) => {
                    console.log("ajax ?????? : " + JSON.stringify(res));
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


        //??????
        function cancellation(element, orderNo) {
            let dataForm = {
                orderNo,
                groupNo
            }

            $.ajax({
                url: "<c:url value='/delivery/return/process'/>",
                data: dataForm,
                method: "POST",
                success: (res) => {
                    console.log("ajax ?????? : " + JSON.stringify(res));
                    if(res === "??????") {

                    }
                },
                error: (xhr, status, error) => alert("error : " + error)
            });
        }



        //form??? input??? ??????
        function setForm(element, orderNo) {
            const $formData = $("form[name=process-form]");
            let pay = $(element).parent().parent().find("input[name=payValue]").val();
            $formData.find("input[name=orderNo]").val(orderNo).end().find("input[name=pay]").val(pay);

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
                ?????? ?????? ${groupNo == 1 ? "????????????" : groupNo == 2 ? "????????????" : "????????? ?????? ??????"}
            </h1>
            <p>??? ${countList}???</p>
        </div>
        <form name="process-form">
            <input type="hidden" name="orderNo"/>
            <input type="hidden" name="groupNo" value="${groupNo}"/>
            <input type="hidden" name="pay"/>
            <input type="hidden" name="orderStatusNo" value="${groupNo == 1 ? 3 : groupNo == 2 ? 6 : 0}"/>
        </form>
        <div class="list-part">
            <c:if test="${empty list}">
                <h3 style="text-align: center">????????? ????????????.</h3>
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
                                    <p>????????? <strong>${vo.orderOfficeView['NAME']}</strong></p>
                                    <p>?????? <strong>${vo.orderOfficeView['SUM']}</strong></p>
                                    <p>?????? <strong><fmt:formatNumber value="${pay}" pattern="#,###"/> ???</strong></p>
                                    <input type="hidden" name="payValue" value="${pay}"/>
                                </div>
                                <div class="text-list">
                                    <p>?????? <strong>${vo.orderOfficeView['ADDRESS']}</strong></p>
                                </div>
                            </div>
                        </div>
                        <div class="detail-map"></div>
                        <div class="btn-box">
                            <button onclick="cancellation(this, ${vo.orderOfficeView['NO']})">??????</button>
                            <button onclick="clearEvent(this, ${vo.orderOfficeView['NO']})">??????</button>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
            <%--<div class="list-box">
                <h3>?????????</h3>
                <div class="text-box" onclick="mapDraw(this, 37.572713983772275, 126.96683255214562)">
                    <div class="left">
                        <div class="text-list">
                            <p>????????? <strong>?????????</strong></p>
                            <p>?????? <strong>????????????</strong></p>
                            <p>?????? <strong> ???</strong></p>
                        </div>
                        <div class="text-list">
                            <p>?????? <strong>????????? ????????? ????????????213??? 123</strong></p>
                        </div>
                    </div>
                </div>
                <div class="detail-map"></div>
                <div class="btn-box">
                    <button>??????</button>
                    <button>??????</button>
                </div>
            </div>--%>
        </div>

    </div>
</t:wrapper>