<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/layouts/user" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
 
<t:wrapper>
<script src="<c:url value="/js/bootstrap.min.js"/>" type="text/javascript" text="javascript"></script>

<!-- import 라이브러리 -->
<script src="<c:url value="/js/laundryService/order/orderConfirm.js"/>" type="text/javascript" text="javascript"></script>
<script type="text/javascript">
$(function () {
	//포인트계산
/* 	const today = new Date();
	today.setHours(today.getHours() + 12)
	$('#take-date').val(today); */
	
	var insertPoint;
	var totalPrice;
	var usePoint=0;
	var buyingPrice = $('#buyingPrice').val();
	
	//포인트 사용 버튼 클릭시
	$('#insertPointBtn').click(function(){
		
		var havePoint = $('#havePoint').text();
		var insertPoint = $('#insertPoint').val();
		console.log(insertPoint);
		var cal = havePoint-insertPoint;
		
		if(cal<0){
			$('#shortPoint').show();
			alert("보유포인트보다 값이 큽니다");
			event.preventDefault();
			return false;
			
		}else{
			$('#shortPoint').hide();
		}

		if(isNaN(insertPoint)==true || insertPoint == null ){
			alert("포인트가 올바르지 않습니다.");
			event.preventDefault();
			return false;
		}
		
		
		//검사가 끝나면 파라미터 usePoint set
		alert("입력포인트 "+insertPoint+"p");
		usePoint = insertPoint;

		totalPrice = buyingPrice-usePoint;
		
		$('#totalPrice').val(totalPrice);
		$('#usePoint').val(usePoint);
	});
	
	
	//submit 시
	 $('#orderBtn').click(function () {
		 
		/* 	if(!$('#flexCheckDefault').is(':checked')){
    			alert('약관에 동의해주세요.');
    			event.preventDefault();
    			$('#staticBackdrop').modal("show");
    			event.preventDefault();
    			return false;
    		} */
    		insertPoint = $('#insertPoint').val();
    		console.log("입력포인트="+insertPoint);
    		console.log("클릭포인트="+usePoint);
    		
    		if(insertPoint!=null && usePoint!=insertPoint){
    			alert("포인트사용버튼을 눌러주세요");
    			event.preventDefault();
    			return false;
    			
    		}

    		var havePoint = $('#havePoint').text();
    		
    		//제출할때는 text 에 set 되어있는금액이아니라 고객이 '사용' 버튼을
    		//누른 금액으로 비교
			var cal = havePoint-usePoint
			
			if(cal<0){
				alert("보유하신 포인트보다 많이 입력함");
				event.preventDefault();
    			return false;
			}
			if(isNaN(insertPoint)==true && insertPoint!=null){
				alert("포인트가 올바르지 않습니다.");
				event.preventDefault();
				return false;
			}
			
			if(usePoint ==null){
				usePoint = 0;
			}

			var savePoint = $('#savePoint').val();
			
			$('#savePoint').val(savePoint);
			
			console.log("사용포인트 ="+usePoint);
			console.log("적립포인트 ="+savePoint);
	 });
});
	
</script>
<div class="margin-top-fixed" style ="height: 100px;"></div>
<div id ="confirmWrapforScss">

<div id ="orderConfirm-wrap">
	<div class="orderConfirm-wrapper">
		<div class="orderConfirm-inform">
			<p>주문확인하기</p>
			<div class="orderNormalP">
				세탁이 없는 일상을 시작하기 전 마지막 단계입니다.<br> 수거요청정보가 정확한지 확인해주십시오
			</div>
		</div>
		<hr>
		<div class="orderDivForm">
			<!-- onsubmit = "goPaymentAPI()" -->
			<form:form id="frmOrder" modelAttribute="orderDetailVo"
				name="frmOrder" method="post"
				action="/launer/laundryService/order/orderComplete">
				<div class="orderConfirm-user">
					<div class="user-date">
						<label for="take-date">수거일 : </label> <input type="text"
							name="take-date" id="take-date" class="orderConfirm-input"
							value="" readonly>
					</div>
					<div class="user-name">
						<label for="orderUserName">이름 : </label> <input type="text"
							name="name" id="name" class="orderConfirm-input"
							value="${userVo.name }" readonly>
					</div>
					<div class="user-hp">
						<label for="take-date">전화번호 : </label> <input type="text"
							name="hp" id="hp" class="orderConfirm-input"
							value="${userVo.hp }" readonly>
					</div>

					<div class="user-address">
						<label for="address">주소 : </label> 
						<input type="text" name="address" id="address" class="orderConfirm-input" value="${map['ADDRESS'] }" readonly>
						<input type="text" name="addressDetail" id="addressDetail" class="orderConfirm-input" value=" ${map['ADDRESS_DETAIL']}" readonly>
					</div>
					<div class="user-address-method">
						<label for="entherMethod">현관출입방법 : </label> <input type="text"
							name="entherMethod" id="entherMethod" class="orderConfirm-input"
							value="${map['ENTERMETHOD']}" readonly>
					</div>
					<div class="orderInfo-request">
						<div><i class="fa-solid fa-circle-info"></i>&nbsp;세탁요청사항</div>
						<input type="text" name="orderRequest" id="orderRequest">
					</div>
				</div>
				<hr>
				<div class="orderConfirm-clothing">
				
				<div class ="orderTableDiv"></div>				
				<table class="orderConfirm-clothing-table"
						summary="수거요청상품 목록에 대한 표로서 상품명, 가격,금액,이미지 등의 정보를 제공합니다">
						<colgroup>
							<col style="">
							<col style="">
							<col style="">
							<col style="">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">상품번호</th>
								<th scope="col">상품명</th>
								<th scope="col">금액</th>
								<th scope="col">수량 / 총금액</th>
							</tr>
						</thead>
						<tbody>
						
							<c:if test="${empty list }">
								<tr class="">
									<td colspan="5">장바구니가 비었습니다.</td>
								</tr>
							</c:if>
							<c:if test="${!empty list }">
								<c:set var="readyPoint" value="0" />
								<c:set var="buyingPrice" value="0" />
								<c:set var="delivery" value="0" />

								<!-- 반복시작 -->


								<c:forEach var="map" items="${list }">

									<%--  <c:set var="sum" value="${map['quan']*map[''] }"></c:set> --%>
									<tr>
										<td><input type="text" name="categoryNo"
											class="paramInput" value="${map['categoryNo'] }"></td>
										<td><input type="text" name="name" class="tdInput"
											value="${map['name'] }"></td>
										<td><input type="text" name="price" class="paramInput"
											value="${map['price'] }"></td>
										<td><input type="text" name="quan" class="paramInput"
											value="${map['quan'] }"> <input type="text"
											name="sum" class="paramInput" value="${map['sum'] }">
										</td>
									</tr>
								</c:forEach>
								<!-- 반복끝 -->
							</c:if>
						</tbody>
					</table>
					<div class ="orderTableDiv"></div>	


					<!-- 총배송목록 -->
					<hr>
					<div class="orderConfirm-finalInfo">
						<div class="orderConfirm-finalInfo-div">
							<label for="buyingPrice">상품금액 : </label> <input type="text"
								name="buyingPrice" id="buyingPrice" class="orderConfirm-input"
								value="${paramPrice }" readonly>
							<fmt:formatNumber type="number" maxFractionDigits="0"
								var="readyPoint" value="${paramPrice/100 }" />

							<span class="">적립예정포인트:</span><input type="text" id="savePoint"
								name="savePoint" value="${readyPoint }  ">
						</div>
						<div class="orderConfirm-finalInfo-div">
							<label for="">포인트사용 : </label> <input type="text"
								name="insertPoint" id="insertPoint"> <input
								type="hidden" name="usePoint" id="usePoint"> <input
								type="button" value="사용" id="insertPointBtn">&nbsp; <span>보유포인트
								: </span><span id="havePoint">${userVo.point }</span><span>p</span><br>
							<input type="hidden" name="paramPoint" id="havePoint2"
								value="${userVo.point }"> <span id="shortPoint">보유포인트보다
								값이 큽니다</span>
						</div>
						<div class="orderConfirm-finalInfo-div">
							<label for="total_price">총결제금액 : </label> <input type="text"
								name="totalPrice" id="totalPrice" class="orderConfirm-input"
								value="${paramPrice }" readonly>

						</div>
					</div>

					<hr>
					<div class="orderInfo-tac">
						<!-- 약관동의버튼 -->
						<button type="button" class="btn btn-primary"
							data-bs-toggle="modal" data-bs-target="#staticBackdrop">
							이용약관</button>

						<!-- 약관동의 모달 -->
						<div class="modal fade" id="staticBackdrop"
							data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
							aria-labelledby="staticBackdropLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="staticBackdropLabel">수거신청 약관</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">Lorem ipsum dolor sit amet,
										consectetur adipiscing elit. Etiam metus justo, molestie quis
										tincidunt in, dignissim eu orci. Nullam malesuada nunc ut
										accumsan posuere. Susp endisse efficitur sapien nulla, non
										consequat tellus dapibus et. Sed porta rutrum elit, eget
										imperdiet orci sollicitudin at. Morbi at imperdiet velit. Duis
										tincidunt luctus dui, commodo vehicula ipsum cursus sit amet.
										Class aptent taciti sociosqu ad litora torquent per conubia
										nostra, per inceptos himenaeos. Morbi vestibulum fermentum
										lacus et pellentesque. In feugiat ligula mollis rhoncus
										lacinia. Vivamus pulvinar orci ac auctor tristique. In eget
										massa enim. Donec vitae orci in tellus bibendum tempus. Aenean
										vehicula enim quis metus aliquet, at consectetur quam
										sagittis. Aenean nulla dui, varius et nisi id, fringilla
										vestibulum purus.</div>
									<div class="modal-footer">
										<div class="form-check">
											<input class="form-check-input" type="checkbox" value=""
												id="flexCheckDefault"> <label
												class="form-check-label" for="flexCheckDefault"> 위
												약관에 동의합니다 </label>
										</div>
										&nbsp;
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">취소</button>
										<button type="button" class="btn btn-primary"
											id="orderInfo-tac-agreeBtn">확인</button>
									</div>
								</div>
							</div>
						</div>


						<span id="orderAgree">&nbsp;<i
							class="fas fa-solid fas fa-check"></i>동의
						</span> <br>
						<div class="sp1"></div>
						<span id="orderDisagree">&nbsp;<i
							class="fas fa-solid fas fa-exclamation"></i>&nbsp;약관동의해주세요
						</span>
					</div>
				</div>
				<div class="orderInfo-goOrder">
					<input type="submit" class="orderBtn" value="결제요청" id="orderBtn">
				</div>
				<!-- orderComplete.jsp 전달파라미터들 -->
				<input type="hidden" value="${param }" name="param">
			</form:form>
		</div>
	</div>

</div>
</div>
<div class="margin-top-fixed" style ="height: 100px;"></div>


</t:wrapper>






