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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
    <script>

    </script>
    <div class="fixed-margin-top"></div>
    <div id="delivery-income-wrap">
        <div id="income-part">
            <div class="date-picker-part card-padding">
                <div class="setter-box middle-font-size">
                    <button>Today</button>
                    <button>Week</button>
                    <button>Months</button>
                </div>
                <div class="date-picker">
                    <input name="startDate" class="date-picker"/>
                    <input name="endDate" class="date-picker"/>
                </div>
            </div>
            <script type="text/javascript">
                flatpickr.localize(flatpickr.l10ns.ko);
                flatpickr("input[name=startDate]", {
                    defaultDate: "today"
                });
                flatpickr("input[name=endDate]", {
                    defaultDate: "today"
                });

            </script>
            <div class="income-view-box card-padding" style="background-image: url('<c:url value="/images/logo_5.png"/>')">
                <h1 id="title" class="big-font-size"><strong>로켓맨</strong> 님의 총 수입</h1>
                <p class="big-big-font-size pay">&#8361; <span>320,000</span></p>
            </div>
        </div>
        <div class="order-list-wrap">
            <div class="tab-box big-font-size">
                <div class="tab on">수거<div class="action-box"></div></div>
                <div class="tab">배송<div class="action-box"></div></div>
                <div class="tab">전체<div class="action-box"></div></div>
            </div>
            <div class="list-scroll-wrap">
                <div class="list-part">
                    <div class="list-box card-padding">
                        <div class="left">
                            <h3 class="big-big-font-size">&#8361; <span>5,000</span></h3>
                            <p class="middle-font-size">주문번호 <span>10004</span></p>
                            <p class="middle-font-size mt_0">주소 <span>서울특별시 금천구 시흥대로888길 77</span></p>
                        </div>
                        <div class="right big-font-size">
                            수거요청
                        </div>
                    </div>
                    <div class="list-box card-padding">
                        <div class="left">
                            <h3 class="big-big-font-size">&#8361; <span>5,000</span></h3>
                            <p class="middle-font-size">주문번호 <span>10004</span></p>
                            <p class="middle-font-size mt_0">주소 <span>서울특별시 금천구 시흥대로888길 77</span></p>
                        </div>
                        <div class="right big-font-size">
                            수거요청
                        </div>
                    </div>
                    <div class="list-box card-padding">
                        <div class="left">
                            <h3 class="big-big-font-size">&#8361; <span>5,000</span></h3>
                            <p class="middle-font-size">주문번호 <span>10004</span></p>
                            <p class="middle-font-size mt_0">주소 <span>서울특별시 금천구 시흥대로888길 77</span></p>
                        </div>
                        <div class="right big-font-size">
                            수거요청
                        </div>
                    </div>
                    <div class="list-box card-padding">
                        <div class="left">
                            <h3 class="big-big-font-size">&#8361; <span>5,000</span></h3>
                            <p class="middle-font-size">주문번호 <span>10004</span></p>
                            <p class="middle-font-size mt_0">주소 <span>서울특별시 금천구 시흥대로888길 77</span></p>
                        </div>
                        <div class="right big-font-size">
                            수거요청
                        </div>
                    </div>
                    <div class="list-box card-padding">
                        <div class="left">
                            <h3 class="big-big-font-size">&#8361; <span>5,000</span></h3>
                            <p class="middle-font-size">주문번호 <span>10004</span></p>
                            <p class="middle-font-size mt_0">주소 <span>서울특별시 금천구 시흥대로888길 77</span></p>
                        </div>
                        <div class="right big-font-size">
                            수거요청
                        </div>
                    </div>
                </div>
            </div>
            <div class="paging-part">
                <div class="page-prev">
                    <a href="#" class="angles"><i class="fa-solid fa-angles-left"></i></a>
                    <a href="#" class="angle"><i class="fa-solid fa-angle-left"></i></a>
                </div>
                <ul>
                    <li><a href="#" class="on">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                </ul>
                <div class="page-next">
                    <a href="#" class="angle on"><i class="fa-solid fa-angle-right"></i></a>
                    <a href="#" class="angles on"><i class="fa-solid fa-angles-right"></i></a>
                </div>
            </div>
            <div class="download-part">
                <button><i class="fa-solid fa-download"></i></button>
            </div>
        </div>
    </div>
</t:wrapper>