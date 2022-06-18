<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="../../inc/top.jsp"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"/>" />
<script src="<c:url value="/js/bootstrap.min.js"/>"
	type="text/javascript" text="javascript"></script>

<!-- select -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.0/css/select2.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.0/js/select2.min.js"></script>
<script type="text/javascript">
$(function(){
	
	$('#orderAddBtn').click(function(){
		var itemNo = $('#order-item').val();
		
		var itemInfo ={"no":itemNo};

	 	$.ajax({
			url:'/launer/laundryService/order/testchk',
			type: 'GET',
			data : itemInfo,
			
			success:function(vo){
				var tagAdd ="<div name = 'itemName' class ='tagAddDiv'>" + vo.categoryName +"</div>"
							+"<div name = 'itemPrice' class ='tagAddDiv'>" + vo.price +"</div>";
				$(tagAdd).prependTo("#inputtest");
			},
			error: function(){
				alert("err");
				
			}
		}); 
		
		
	});
});


function setVO(){
	var div 
	
}

	
</script>


<script src="<c:url value="/js/laundryService/order/orderMake.js"/>"
	type="text/javascript" text="javascript"></script>
<link rel="stylesheet"
	href="<c:url value="/css/laundryService/order/orderMake.css"/>"
	type="text/css" />

<div class="margin-top-fixed"></div>
<div id="orderWrapper">

	<p>
		<span>한서현 님</span> 수거요청
		
	</p>
	
	<button id="testBtn" value ="test">test</button>
	<div class="orderInfo">

		<div class="orderInfo-address">
			<div>
				<div>수거/배송 주소</div>
				<span id="orderInfo-address-edit"><a href="#">수정 > </a></span>

				<div class="orderInfo-address-myaddress">
					<span>서울특별시 마포구 대흥동 고산 1길 1-1 101호</span><br> <span
						class="orderInfo-address-myaddress-enter">현관출입방법 : </span><span
						class="orderInfo-address-myaddress-enter">없음</span>
				</div>
			</div>
			<div></div>
		</div>

		<div class="orderInfo-guide">
			<div>
				<i class="fa-solid fa-bell"></i>&nbsp;처음이신가요 ?
			</div>
			<a href="<c:url value="/laundryService/order/orderConfirm"/>"><div
					class="hover-btn" style="width: 0px;"></div>
				<p style="color: rgb(0, 0, 0);">첫고객 가이드</p> </a>


		</div>
		<hr>

 	<!-- 상품선택 -->
	<div class="orderInfo-order-select-wrapper">
			<div class="title-select">세탁물 선택</div>
			
			<p>생활빨래</p>
			<c:import url ="/laundryService/order/orderMakeSelect">
				<c:param name="categoryGroup" value="1"></c:param>
			</c:import>
			
			
		<%-- 	<p>개별클리닝</p>
			<c:import url ="/laundryService/order/orderMakeSelect">
				<c:param name="categoryGroup" value="2"></c:param>
			</c:import> --%>
			
			<div id ="inputtest" style = "height:200px">
			
			
			</div>
			 <form name="order-item-form" action="<c:url value="/laundryService/order/paramPost"/>" method="get">
		
		
		
			<input type="submit" value="확인"/>
			</form>
			
	</div>

		<div class="orderInfo-request">
			<div>세탁요청사항</div>
			<textarea name="" id="" cols="50" rows="10"></textarea>
		</div>
		<hr>
		<div class="orderInfo-tac">
			<!-- 약관동의버튼 -->
			<button type="button" class="btn btn-primary" data-bs-toggle="modal"
				data-bs-target="#staticBackdrop">이용약관</button>

			<!-- 약관동의 모달 -->
			<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
				data-bs-keyboard="false" tabindex="-1"
				aria-labelledby="staticBackdropLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="staticBackdropLabel">수거신청 약관</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">Lorem ipsum dolor sit amet,
							consectetur adipiscing elit. Etiam metus justo, molestie quis
							tincidunt in, dignissim eu orci. Nullam malesuada nunc ut
							accumsan posuere. Susp endisse efficitur sapien nulla, non
							consequat tellus dapibus et. Sed porta rutrum elit, eget
							imperdiet orci sollicitudin at. Morbi at imperdiet velit. Duis
							tincidunt luctus dui, commodo vehicula ipsum cursus sit amet.
							Class aptent taciti sociosqu ad litora torquent per conubia
							nostra, per inceptos himenaeos. Morbi vestibulum fermentum lacus
							et pellentesque. In feugiat ligula mollis rhoncus lacinia.
							Vivamus pulvinar orci ac auctor tristique. In eget massa enim.
							Donec vitae orci in tellus bibendum tempus. Aenean vehicula enim
							quis metus aliquet, at consectetur quam sagittis. Aenean nulla
							dui, varius et nisi id, fringilla vestibulum purus.</div>
						<div class="modal-footer">
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value=""
									id="flexCheckDefault"> <label class="form-check-label"
									for="flexCheckDefault"> 위 약관에 동의합니다 </label>
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

		<div class="orderInfo-goOrder">
			<input type="button" class="orderBtn" value="수거신청" id="submit">
		</div>
	</div>


</div>



</body>
</html>