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
        // let typeNo = [1, 2, 3]  //1 : 수거, 2 : 배송, 3 : 전체
        let typeNo = 1;
        let endDate = new Date();
        let startDate = new Date(new Date().setMonth(new Date().getMonth()-1));
        // let totalCount = 0;
        let currentPage = 1;



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

        function titleSet(recode, length) {
            const payText = document.querySelector("#pay-text");
            const totalText = document.querySelector("#total-recode");
            console.log("총 금액 : " + recode.SUM);
            console.log("총 개수 : " + recode.COUNT);

            let count = 0;
            let sum = 0;
            if(length > 0) {
                sum = recode.SUM.toLocaleString('ko-KR');
                count = recode.COUNT;
            }

            payText.innerText = sum;
            totalText.innerHTML = count;
        }

        function viewList() {
            const $dataForm = $("form[name=searchForm]");
            setSearchForm();

            $.ajax({
                url : "<c:url value="/delivery/income/mylist"/>",
                method : "GET",
                data : $dataForm.serialize(),
                success : (res) => {
                    // totalCount = res.totalCount;
                    // alert(res);
                    console.log(res);
                    makeList(res.jsonList);
                    pagePart(res.pagingInfo, res.jsonList.length);
                    titleSet(res.recode, res.jsonList.length);
                },
                error : (xhr, status, error) => alert("error : " + error)
            });
        }



        function setSearchForm() {
            document.querySelector("input[name=typeList]").value = typeNo === 1 ? "PICKUP_DRIVER" : typeNo === 2 ? "DELIVERY_DRIVER" : 0;
            document.querySelector("input[name=typeNo]").value = typeNo;
            document.querySelector("input[name=endDate]").value = endDate;
            document.querySelector("input[name=startDate]").value = startDate;
            document.querySelector("input[name=currentPage]").value = currentPage;
        }


        function makeList(jsonStr) {
            let amount = 0;
            let str = "";
            let regdate;

            if(jsonStr.length > 0) {
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
            }else {
                str += "<h3 class='list-empty big-font-size'>항목이 없습니다.</h3>"
            }

            console.log(amount);

            // $(".list-part").append(str);
            document.getElementById("list-part").innerHTML = str;
        }


        function pageClick(page) {
            event.preventDefault();
            currentPage = page;
            viewList();
        }



        function pagePart(pagingInfo, length) {
            //이전 블럭
            let str = "";

            if(length > 0) {
                str += '<div class="page-prev">';
                if(1 === currentPage) {
                    str +=
                        '<span href="#" class="angles"><i class="fa-solid fa-angles-left"></i></span>' +
                        '<span href="#" class="angle"><i class="fa-solid fa-angle-left"></i></span>';
                }else {
                    str +=
                        '<a href="#" onclick="pageClick(1)" class="angles on"><i class="fa-solid fa-angles-left"></i></a>' +
                        '<a href="#" onclick="pageClick(' + (currentPage - 1) + ')" class="angle on"><i class="fa-solid fa-angle-left"></i></a>';
                }
                str += '</div>';


                str += '<ul class="paging">';
                //[1][2] ~ [10]
                for(var i = pagingInfo.firstPage; i <= pagingInfo.lastPage; i++) {
                    if(i === pagingInfo.currentPage)
                        str += '<li><span class="on">' + i + '</span></li>';
                    else
                        str += '<li><a href="#" onclick="pageClick(' + i + ')">' + i +'</a></li>';
                }
                str += '</ul>';

                //다음 블럭으로 이동
                str += '<div class="page-prev">';
                if(currentPage === pagingInfo.totalPage) {
                    str += '<span class="angle"><i class="fa-solid fa-angle-right"></i></span>' +
                        '<span class="angles"><i class="fa-solid fa-angles-right"></i></span>';
                }else {
                    str +=
                        '<a href="#" onclick="pageClick(' + (currentPage + 1) + ')" class="angle on"><i class="fa-solid fa-angle-right"></i></a>' +
                        '<a href="#" onclick="pageClick(' + pagingInfo.totalPage + ')" class="angles on"><i class="fa-solid fa-angles-right"></i></a>';
                }
                str += '</div>';
            }
            document.querySelector(".paging-part").innerHTML = str;
        }





        function tabClick(element) {
            let tabParent = element.parentNode;
            let tabText = element.innerText;
            let tabType = tabText === "수거" ? 1 : tabText === "배송" ? 2 : tabText === "전체" ? 3 : 0;

            if(tabType !== typeNo) {
                typeNo = tabType;
                tabParent.querySelector(".on").classList.remove("on");
                element.classList.add("on");

                pagingClear();
                viewList();
            }
        }

        function pagingClear() {
            currentPage = 1;
        }








        function excelDownload() {
            let formData = $("form[name=searchForm]").serialize();
            let form = $(".download-part form[name=excel-form]")

            form.prop("action", "<c:url value="/delivery/income/excel/download"/>?" + formData);
            form.submit();
        }
    </script>
    <div class="fixed-margin-top"></div>
    <div id="delivery-income-wrap">
        <div id="income-part">
            <div class="date-picker-part card-padding">
                <div class="setter-box middle-font-size">
                    <button onclick="dateSet(1)">Today</button>
                    <button onclick="dateSet(2)">Week</button>
                    <button onclick="dateSet(3)">Months</button>
                    <button class="date-submit" onclick="pagingClear(); viewList();"><i class="fa-solid fa-magnifying-glass"></i></button>
                </div>
                <div class="date-picker">
                    <input name="startDateSet" class="date-picker"/>
                    <input name="endDateSet" class="date-picker"/>
                </div>
                <form name="searchForm">
                    <input type="hidden" name="typeList" id="typeList" value="PICKUP_DRIVER"/>
                    <input type="hidden" name="typeNo" id="typeNo"/>
                    <input type="hidden" name="startDate" id="startDate"/>
                    <input type="hidden" name="endDate" id="endDate"/>
                    <input type="hidden" name="currentPage" id="currentPage"/>
                    <input type="hidden" name="countPerPage" id="countPerPage" value="6"/>
                    <%--<input type="hidden" name="firstRecordIndex" id="firstRecordIndex" value="1"/>
                    <input type="hidden" name="recordCountPerPage" id="recordCountPerPage" value="1"/>--%>
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
                });
                startDateInput.addEventListener("change", () => {
                    console.log("시작일 지정 : " + startDateInput.value);
                    startDate = startDateInput.value;
                });


                function dateSet(set) {
                    let setDate;
                    if(set === 1) {
                        setDate = new Date();
                    }else if(set === 2) {
                        setDate = new Date(new Date().setDate(new Date().getDate() - 7));
                    }else if(set === 3) {
                        setDate = new Date(new Date().setMonth(new Date().getMonth()-1));
                    }

                    setDate = setDate.getFullYear() + "-" +
                        ((setDate.getMonth()+1) >= 10 ? (setDate.getMonth()+1) : '0' + (setDate.getMonth()+1)) + "-" +
                        (setDate.getDate() >= 10 ? setDate.getDate() : '0' + setDate.getDate());
                    console.log(setDate);

                    startDateInput.value = setDate;
                    startDate = setDate;
                }
            </script>
            <div class="income-view-box card-padding" style="background-image: url('<c:url value="/images/logo_5.png"/>')">
                <h1 id="title" class="big-font-size"><strong>${deliveryName}</strong> 님의 총 수입</h1>
                <p class="big-big-font-size pay">&#8361; <span id="pay-text"></span> &nbsp;<span class="small-font-size">전체 <strong id="total-recode"></strong>건</span></p>
            </div>
        </div>
        <div class="order-list-wrap">
            <div class="tab-box big-font-size">
                <div class="tab on" onclick="tabClick(this)">수거<div class="action-box"></div></div>
                <div class="tab" onclick="tabClick(this)">배송<div class="action-box"></div></div>
<%--                <div class="tab" onclick="tabClick(this)">전체<div class="action-box"></div></div>--%>
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
                <%--<div class="page-prev">
                    <a href="#" class="angles"><i class="fa-solid fa-angles-left"></i></a>
                    <a href="#" class="angle"><i class="fa-solid fa-angle-left"></i></a>
                </div>
                <ul class="paging">
                    <li><span class="on">1</span></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                </ul>
                <div class="page-next">
                    <a href="#" class="angle on"><i class="fa-solid fa-angle-right"></i></a>
                    <a href="#" class="angles on"><i class="fa-solid fa-angles-right"></i></a>
                </div>--%>
            </div>
            <div class="download-part">
                <form name="excel-form" method="post" action="">
                    <button onclick="excelDownload()"><i class="fa-solid fa-download"></i></button>
                </form>
            </div>
        </div>
    </div>
</t:wrapper>