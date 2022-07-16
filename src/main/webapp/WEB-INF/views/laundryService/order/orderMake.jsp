<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/layouts/user"%>

<t:wrapper>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<script src="<c:url value="/js/bootstrap.min.js"/>"
		type="text/javascript" text="javascript"></script>

	<!-- select -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.0/js/select2.min.js"></script>
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


	 	 //수거신청 클릭했을 때
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
					
                    var longName = vo.categoryName;
                    
                    if(longName.length > 4){    
                    	longName =  longName.substr(0,4)+"...";
                    }
                
                    
                    var tagAdd = "<div class ='testForm'><input type = 'hidden' name = 'no' class ='tagInputAdd' value=" + vo.no + ">"
                        + "<input type ='text' name = 'itemName' title="+vo.categoryName+" class ='tagAddDiv' readonly value=" + longName + ">"
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


	<script src="<c:url value="/js/laundryService/order/orderMake.js"/>"
		type="text/javascript" text="javascript"></script>
		<style>
		img.guideImg {
    width: 83px;
}

.step {
    margin: 30px;
}

.guideTitle {
    border: 1px solid black;
    border-radius: 42px;
    width: 278px;
    text-align: center;
    height: 41px;
    padding-top: 10px;
    font-size: 19px;
    font-weight: bold;
    margin-bottom: 50px;
}

.guideWrapper {
    padding: 54px;
}

.guideWrapper p {
    line-height: 28px;
    font-size: 1.3em;
}

.imgDiv {
    margin-bottom: 15px;
}

.guideStitle {
    font-size: 1.5em;
    font-weight: bold;
    margin-bottom: 20px;
    margin-top: 20px;
}
		
		
		</style>
		
	<div class="margin-top-fixed" style="height: 100px;"></div>
	<div id="orderWrapper">
		<input type="hidden" name="isAddressExist" value="${isAddressExist }"
			id="isAddressExist">
		<p id="nim_p">
			<span id="nim">${userVo.name} 님</span> 수거요청
		</p>
		<div class="orderInfo">
			<div class="orderInfo-address">
				<div>
					<div>수거/배송 주소</div>
					<span id="orderInfo-address-edit"><a
						href="<c:url value="/mypage/useredit"/>">&nbsp;&nbsp;수정&nbsp;
							<i class="fa-solid fa-arrow-right-from-bracket"></i>
					</a> </span>

					<div class="orderInfo-address-myaddress">
						<span id="orderAddress">${map['ADDRESS']}
							&nbsp;${map['ADDRESS_DETAIL']}</span><br>
						<div id="orderAddressDetail">
							<span class="orderInfo-address-myaddress-enter"> 현관출입방법 :<span
								class="orderInfo-address-myaddress-enter" id="enterMethod">
									${map['ENTERMETHOD']}</span></span>
						</div>
					</div>
				</div>
				<div></div>
			</div>
			<div class="orderInfo-guide">
				<div>
					<i class="fa-solid fa-bell"></i>&nbsp;처음이신가요 ?
				</div>
				<a data-bs-toggle="modal" data-bs-target="#exampleModal" href="#">
					<div class="hover-btn"></div>
					<p>첫고객 가이드</p>
				</a>
			</div>

		
 			<!-- 가이드 모달시작 -->
			<div class="modal fade" id="exampleModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-xl">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">세탁요청 가이드</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<div>
				
								<div class="guideWrapper">
									<div class="guideTitle">세탁물 맡기는 방법</div>
									<div id="step1" class="step">
										<div class="imgDiv">
											<img
												src="<c:url value="/images/shopping-bag.png"/>"
												alt="shopping-bag" class="guideImg">
										</div>
										<div>
											<p>
												모든세탁물은 아래의 분류 방법대로<br> <span
													style="color: rgb(16, 90, 181); font-weight: bold;">비닐이나
													쇼핑백에 구분해서</span> 담아주세요
											</p>
										</div>
									</div>
									<hr>
									<div id="step2" class="step">
										<div class="imgDiv">
											<img
												src="<c:url value="/images/water-drop.png"/>"
												alt="water-drop" class="guideImg">
										</div>
										<div>
											<div class = "guideStitle">생활빨래</div>
											<p>
												<span
													style="font-weight: bold; background: linear-gradient(to top, #d7ecff 50%, transparent 50%)">'러너
													생활빨래'</span> 를 표기해주세요
											</p>
											<p>속옷은 별도로 포장하여 생활빨래와 함께 담아주세요</p>
										</div>
									</div>
									<hr>
									<div id="step3" class="step">
										<div class="imgDiv">
											<img src="<c:url value="/images/shirt.png"/>"
												alt="shirt" class="guideImg">
										</div>
										<div>
											<div class = "guideStitle">드라이클리닝</div>
											<p>
												<span
													style="font-weight: bold; background: linear-gradient(to top, #d7ecff 50%, transparent 50%)">'러너
													드라이클리닝'</span> 을 표기해주세요
											</p>
										</div>
									</div>
									<hr>
									<div id="step4" class="step">
										<div class="imgDiv">
											<img
												src="<c:url value="/images/blanket.png"/>"
												alt="blanket" class="guideImg"> <img
												src="<c:url value="/images/curtains.png"/>"
												alt="curtains" class="guideImg"> <img
												src="<c:url value="/images/sneakers.png"/>"
												alt="sneakers" class="guideImg">
										</div>
										<div>
											<div class = "guideStitle">기타</div>
											<p>
												<span
													style="font-weight: bold; background: linear-gradient(to top, #d7ecff 50%, transparent 50%)">'러너
													세탁물명(이불,운동화 등)'</span> 을 표기해주세요
											</p>
										</div>
									</div>

								</div>


							</div>
						</div>
						<!-- modal body끝 -->
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">확인</button>
						</div>
					</div>
				</div>
			</div> 
			<!-- 모달끝 -->
			

			<hr>
			<!-- 상품선택 -->
			<div class="orderInfo-order-select-wrapper">
				<div class="title-select">세탁물 선택</div>
				<c:import url="/laundryService/order/orderMakeSelect">
					<c:param name="categoryGroup" value="1"></c:param>
				</c:import>

				<div id="categoryDiv">
					<div id="categoryNameDiv" class="categoryDiv-div">상품</div>
					<div id="categoryPriceDiv" class="categoryDiv-div">금액</div>
					<div id="categoryQTYDiv" class="categoryDiv-div">수량</div>
					<div id="categoryTotalDiv" class="categoryDiv-div">총금액</div>
				</div>

				<div id="order-item-form-div">

					<div class="order-item-Div"></div>
				</div>
				<div id="totalPriceDiv">
					총 : <input type="text" name="totalPriceMake" id="totalPriceMake"
						value=""></input>원
				</div>

			</div>
			<div class="margin-top-fixed"></div>

		</div>
		<hr>


		<div class="orderInfo-goOrder">

			<form id="frm" name="frm">
				<input type="hidden" value="" id="param" name="param">
				<div class="submitBtnWrapDiv">
					<input type="submit" class="orderBtn" value="수거신청" id="orderBtn">
				</div>
			</form>
		</div>

	</div>
	<div class="margin-top-fixed" style="height: 100px;"></div>
</t:wrapper>