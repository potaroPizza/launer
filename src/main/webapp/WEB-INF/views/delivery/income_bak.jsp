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
    <script src="<c:url value="/js/paging.js"/>" type="text/javascript"></script>
    <script>
        // let typeNo = [1, 2, 3]  //1 : 수거, 2 : 배송, 3 : 전체
        let typeNo = 1;
        let endDate = new Date();
        let startDate = new Date(new Date().setMonth(new Date().getMonth()-1));
        let totalCount = 0;



        endDate = endDate.getFullYear() + "-" +
            ((endDate.getMonth()+1) >= 10 ? (endDate.getMonth()+1) : '0' + (endDate.getMonth()+1)) + "-" +
            (endDate.getDate() >= 10 ? endDate.getDate() : '0' + endDate.getDate());
        startDate = startDate.getFullYear() + "-" +
            ((startDate.getMonth()+1) >= 10 ? (startDate.getMonth()+1) : '0' + (startDate.getMonth()+1)) + "-" +
            (startDate.getDate() >= 10 ? startDate.getDate() : '0' + startDate.getDate());

        console.log("endDate : " + endDate);
        console.log("startDate : " + startDate);


        window.onload = () => {
            viewList();
        }

        function viewList() {
            const payText = document.querySelector("#pay-text");
            const $dataForm = $("form[name=searchForm]");
            setSearchForm();

            $.ajax({
                url : "<c:url value="/delivery/income/mylist"/>",
                method : "GET",
                data : $dataForm.serialize(),
                success : (res) => {
                    // totalCount = res.totalCount;
                    alert(res);

                    /*makeList(res.jsonList);
                    pageMake();*/
                },
                error : (xhr, status, error) => alert("error : " + error)
            });
        }



        function setSearchForm() {
            document.querySelector("input[name=typeNo]").value = typeNo;
            document.querySelector("input[name=endDate]").value = endDate;
            document.querySelector("input[name=startDate]").value = startDate;
            document.querySelector("input[name=currentPage]").value = currentPage;
        }


        function makeList(jsonStr) {
            let amount = 0;
            let str = "";
            let regdate;

            jsonStr.forEach(item => {
                amount += item.AMOUNT;
                regdate = new Date(item.REGDATE);
                regdate = regdate.getFullYear() + "-" +
                    ((regdate.getMonth()+1) >= 10 ? (regdate.getMonth()+1) : '0' + (regdate.getMonth()+1)) + "-" +
                    (regdate.getDate() >= 10 ? regdate.getDate() : '0' + regdate.getDate());

                str +=
                    '<div class="list-box card-padding">' +
                    '<div class="left">' +
                    '<h3 class="big-big-font-size">&#8361; <span>' + item.AMOUNT.toLocaleString('ko-KR') + '</span></h3>' +
                    '<p class="middle-font-size">주문번호 <span>' + item.ORDER_NO + '</span> &nbsp; 날짜 <span>' + regdate +'</span></p>' +
                    '<p class="middle-font-size mt_0">주소 <span>' + item.ADDRESS + '</span></p>' +
                    '</div>' +
                    '<div class="right big-font-size">' +
                    (typeNo === 1 ? '수거' : typeNo === 2 ? '배송' : typeNo === 3 ? '전체' : '에러') +
                    '</div>' +
                    '</div>';
            });
            console.log(amount);

            // $(".list-part").append(str);
            document.getElementById("list-part").innerHTML = str;
            payText.innerText = amount.toLocaleString('ko-KR');
        }



        function pageMake() {
            let blockSize = 10;
            let countPerPage = $("#countPerPage").val();
            pagination($("#currentPage").val(), countPerPage, blockSize, totalCount);

            //이전 블럭
            let str = "";
            if(firstPage > 1) {
                str += "<a href='#' onclick='/*$.send(" + (firstPage-1) + ")*/'>";
                str += "<i class='fa-solid fa-angle-left'></i>'/>";
                str += "</a>";
            }

            //[1][2] ~ [10]
            for(let i = firstPage; i <= lastPage; i++) {
                if(i === currentPage) {
                    str += "<span style='font-weight:bold; color:blue'>" + i + "</span>";
                }else {
                    str += "<a href='#' onclick='/*$.send("+ i +")*/'>[" + i + "]</a>";
                }
            }

            //다음 블럭으로 이동
            if(lastPage < totalPage) {
                str += "<a href='#' onclick='/*$.send(" + (lastPage+1) + ")*/'>";
                str += "<i class='fa-solid fa-angle-right'></i>'/>";
                str += "</a>";
            }

            $(".paging-part").html(str);
        }
    </script>
    <div class="fixed-margin-top"></div>
    <div id="delivery-income-wrap">
        <div id="income-part">
            <div class="date-picker-part card-padding">
                <div class="setter-box middle-font-size">
                    <button>Today</button>
                    <button>Week</button>
                    <button>Months</button>
                    <button class="date-submit"><i class="fa-solid fa-magnifying-glass"></i></button>
                </div>
                <div class="date-picker">
                    <input name="startDateSet" class="date-picker"/>
                    <input name="endDateSet" class="date-picker"/>
                </div>
                <form name="searchForm">
                    <input name="typeNo" id="typeNo"/>
                    <input name="startDate" id="startDate"/>
                    <input name="endDate" id="endDate"/>
                    <input name="currentPage" id="currentPage"/>
                    <input type="hidden" name="countPerPage" id="countPerPage" value="6"/>
                    <input type="hidden" name="firstRecordIndex" id="firstRecordIndex" value="1"/>
                    <input type="hidden" name="recordCountPerPage" id="recordCountPerPage" value="1"/>
                </form>
            </div>
            <script type="text/javascript">
                const now = new Date()
                const month = new Date(now.setMonth(now.getMonth() - 1));

                flatpickr.localize(flatpickr.l10ns.ko);
                flatpickr("input[name=startDateSet]", {
                    defaultDate: startDate
                });
                flatpickr("input[name=endDateSet]", {
                    defaultDate: endDate
                });

                const endDateInput = document.querySelector("input[name=endDateSet]");
                const startDateInput = document.querySelector("input[name=startDateSet]");


                endDateInput.addEventListener("change", () => {
                    console.log("종료일 지정 : " + endDateInput.value);
                    endDate = endDateInput.value;
                })
                startDateInput.addEventListener("change", () => {
                    console.log("시작일 지정 : " + startDate.value);
                    startDate = startDate.value;
                })

                console.log(endDate)
            </script>
            <div class="income-view-box card-padding" style="background-image: url('<c:url value="/images/logo_5.png"/>')">
                <h1 id="title" class="big-font-size"><strong>${deliveryName}</strong> 님의 총 수입</h1>
                <p class="big-big-font-size pay">&#8361; <span id="pay-text"></span></p>
            </div>
        </div>
        <div class="order-list-wrap">
            <div class="tab-box big-font-size">
                <div class="tab on">수거<div class="action-box"></div></div>
                <div class="tab">배송<div class="action-box"></div></div>
                <div class="tab">전체<div class="action-box"></div></div>
            </div>
            <div class="list-scroll-wrap">
                <div class="list-part" id="list-part">
                    <%--<div class="list-box card-padding">
                        <div class="left">
                            <h3 class="big-big-font-size">&#8361; <span>5,000</span></h3>
                            <p class="middle-font-size">주문번호 <span>10004</span> &nbsp; 날짜 <span>2022-06-28</span></p>
                            <p class="middle-font-size mt_0">주소 <span>서울특별시 금천구 시흥대로888길 77</span></p>
                        </div>
                        <div class="right big-font-size">
                            수거요청
                        </div>
                    </div>--%>
                </div>
            </div>
            <div class="paging-part">
                <div class="page-prev">
                    <a href="#" class="angles"><i class="fa-solid fa-angles-left"></i></a>
                    <a href="#" class="angle"><i class="fa-solid fa-angle-left"></i></a>
                </div>
                <ul class="paging">
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