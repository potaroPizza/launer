<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/layouts/user" %>

<t:wrapper>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="<c:url value="/js/bootstrap.min.js"/>" type="text/javascript" text="javascript"></script>

<!-- select -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.0/js/select2.min.js"></script>
<script type="text/javascript">
    $(function () {
    	var isAddressExist = $('#isAddressExist').val();
    	console.log("주소등록여부:"+isAddressExist);
	 	 if(isAddressExist<1){
			 	alert("주소 등록 후에 이용할 수 있는 서비스입니다");
			 	location.href = "<c:url value='/mypage/useredit'/>";
	 	 }

	 	 var enterMethod =  $('#enterMethod').text();
	 	 console.log("현관출입여부 : "+enterMethod);
	 	 if(enterMethod.length<2){
	 		enterMethod = "없음";
	 		$('#enterMethod').text(enterMethod);
	 	 }


	 	 //주문하기 클릭했을 때
        $('#orderBtn').click(function () {
            if ($("input[name=itemName]").length < 1) {
                alert("상품을 선택해주세요");
                event.preventDefault();
                return false;
            }
			let dataArr = [];

			let dataList = $(".testForm");
			console.log(dataList);

			var param_string ="";
			$.each(dataList, (idx, item) => {

				// console.log(item.childNodes);
				let no = item.childNodes[0].defaultValue;
				let name = item.childNodes[1].defaultValue;
				let price = item.childNodes[2].defaultValue;
				let qty = item.childNodes[3].value;
				let sum = item.childNodes[4].defaultValue;
				param_string+=
					no +","+name+","+price+","+ qty + "," + sum + "|"
			});
			console.log("param_string = "+param_string);

			$('#param').val(param_string);

			$('form[name=frm]').attr('action',"<c:url value='/laundryService/order/orderConfirm'/>");
			$('form[name=frm]').attr('method','post');
        });


        //동적으로 추가된 카테고리 관련
        $(document).on('click', '#delBtn', function () {
            var idx = $('.order-item-Div .testForm #delBtn').index(this);
            $('.order-item-Div .testForm').eq(idx).remove();

            const totalPriceMake = new Array();
            let sum = 0;
            $(".priceByQty").each(function (index, item) {
            	totalPriceMake.push($(item).val());
            });

            for (let i = 0; i < totalPriceMake.length; i++) {
                const intTotalPrice = Number(totalPriceMake[i]);
                sum += intTotalPrice;
            }

            $("#totalPriceMake").attr("value", sum);
        });

        $(document).on('mouseover', '#xWrap', function () {
        	$(this).css('background','#f3d2d2');

        });
        $(document).on('mouseout', '#xWrap', function () {
        	$(this).css('background','');
        });


        $(document).on('mouseover', '.order-item-Div div[name=testForm] #delBtn', function () {
            $(this).css("background", 'red');
        });

        $(document).on('change', '#order-num', function () {
            var qty = $(this).val();
            var price = $(this).siblings('input[name=itemPrice]').val();
            //var priceByQty = $(this).val()*$('input[name=itemPrice]').val();
            var priceByQty = qty * price;
            $(this).next('.priceByQty').attr("value", priceByQty);

            const totalPriceMake = new Array();
            let sum = 0;
            $(".priceByQty").each(function (index, item) {
                totalPriceMake.push($(item).val());
            });

            for (let i = 0; i < totalPriceMake.length; i++) {
                const intTotalPrice = Number(totalPriceMake[i]);
                sum += intTotalPrice;
            }
            $("#totalPriceMake").attr("value", sum);
        });

        var totalpriceInput = 0;
        //추가 버튼을 누르면 option value 에 저장된 no 컨트롤러로 던져서 clothing_category 테이블의 VO 가져옴
        //=> div 에 input 으로 정보를 뿌려줌
        $('#orderAddBtn').click(function () {
            var itemNo = $('#order-item').val();

            var itemInfo = {"no": itemNo};

            $.ajax({
                url: '/launer/laundryService/order/optionInfo',
                type: 'GET',
                data: itemInfo,

                success: function (vo) {

                    //모든 input 태그의 value를 배열에 저장
                    //이미 배열에 값이 있다면 return false
                    //없다면 새로운 input 태그 생성
                    const list = new Array();
                    $("input[name=no]").each(function (index, item) {
                        list.push($(item).val());
                    });

                    var cNo = (vo.no).toString();
                    const isInArray = list.includes(cNo);

                    if (isInArray) {
                        alert("이미 선택된 상품입니다");
                        return false;
                    }

                    var tagAdd = "<div class ='testForm'><input type = 'hidden' name = 'no' class ='tagInputAdd' value=" + vo.no + ">"
                        + "<input type ='text' name = 'itemName' class ='tagAddDiv' readonly value=" + vo.categoryName + ">"
                        + "<input type = 'text' name = 'itemPrice' class ='tagAddDiv' readonly value=" + vo.price + ">"
                        + "<select class='mulit-select' name='order-num' id='order-num'>"
                        + "<c:forEach var ='cnt' begin ='1' end='10' step='1'>"
                        + "<option >${cnt}</option>"
                        + "</c:forEach>"
                        + "</select>"
                        + "<input type ='text' name='priceByQty' class = 'priceByQty' readonly style='border:none' value=" + vo.price + " >"
                        + "<div id ='xWrap' style='display:inline-block'><a href=# onclick='event.preventDefault()' id='delBtn'><i class='fa-solid fa-xmark' id ='XDel'></i></a></div>"
                        + "</div>";
                    $(tagAdd).appendTo(".order-item-Div");

                    const totalPriceMake = new Array();
                    let sum = 0;
                    $(".priceByQty").each(function (index, item) {
                        totalPriceMake.push($(item).val());
                    });
                    for (let i = 0; i < totalPriceMake.length; i++) {
                        const intTotalPrice = Number(totalPriceMake[i]);
                        sum += intTotalPrice;
                    }
                    $("#totalPriceMake").attr("value", sum);
                },
                error: function () {
                    alert("상품을 선택하세요");
                }
            });
        });
    });


</script>
<script src="<c:url value="/js/laundryService/order/orderMake.js"/>" type="text/javascript" text="javascript"></script>
<div class="margin-top-fixed" style ="height: 100px;"></div>
<div id="orderWrapper">
<input type ="hidden" name ="isAddressExist" value ="${isAddressExist }" id ="isAddressExist">
    <p id ="nim_p">
        <span id ="nim">${userVo.name}  님</span> 수거요청
    </p>
    <div class="orderInfo">
        <div class="orderInfo-address">
            <div>
                <div>수거/배송 주소</div>
                <span id="orderInfo-address-edit"><a href="<c:url value="/mypage/useredit"/>">&nbsp;&nbsp;수정&nbsp;
	                <i class="fa-solid fa-arrow-right-from-bracket"></i></a>
                </span>
               
              	 <div class="orderInfo-address-myaddress">
                    <span id = "orderAddress">${map['ADDRESS']} &nbsp;${map['ADDRESS_DETAIL']}</span><br> 
                    <div id = "orderAddressDetail" >
                    <span class="orderInfo-address-myaddress-enter"> 현관출입방법 :<span class="orderInfo-address-myaddress-enter" id="enterMethod"> ${map['ENTERMETHOD']}</span></span>
                        </div>
                </div>
            </div>
            <div></div>
        </div>
        <div class="orderInfo-guide">
            <div>
                <i class="fa-solid fa-bell"></i>&nbsp;처음이신가요 ?
            </div>
            <a href="<c:url value="/laundryService/order/orderConfirm"/>">
                <div class="hover-btn"></div>
				<p >첫고객 가이드</p>
			</a>
        </div>
        <hr>
        <!-- 상품선택 -->
        <div class="orderInfo-order-select-wrapper">
            <div class="title-select">세탁물 선택</div>
            <c:import url="/laundryService/order/orderMakeSelect">
                <c:param name="categoryGroup" value="1"></c:param>
            </c:import>
           
			<div id ="categoryDiv">
				<div id="categoryNameDiv" class = "categoryDiv-div">상품</div>
				<div id="categoryPriceDiv" class = "categoryDiv-div">금액</div>
				<div id="categoryQTYDiv" class = "categoryDiv-div">수량</div>
				<div id="categoryTotalDiv" class = "categoryDiv-div">총금액</div>
			</div>
           
            <div id="order-item-form-div">
 
                <div class="order-item-Div">
                </div>
            </div>
           <div id="totalPriceDiv"> 총 : <input type="text" name="totalPriceMake" id="totalPriceMake" value=""></input>원</div>

        </div>
        <div class="margin-top-fixed"></div>
        
    </div>
    <hr>
 

    <div class="orderInfo-goOrder">

 	<form id= "frm" name="frm">
    	<input type ="hidden" value="" id="param" name="param">
       <div class = "submitBtnWrapDiv"><input type="submit" class="orderBtn" value="수거신청" id="orderBtn"></div> 
    </form>
    </div>
   
</div>
<div class="margin-top-fixed" style ="height: 100px;"></div>
</t:wrapper>