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
/* $(function(){
	
	$('#addClickDailyBtn').click{
		var selItem = $("#order-daily").val();
		var num = $("#order-daily-num").val();
	
		
		for (var i = 0; i < num; i++) {
			console.log(i);

			var inputTagAdd = "<input onclick='removeInput(this)' name='categoryNo' value =" + selItem + " ><br>";
			$(inputTagAdd).prependTo("form[name=order-item-form]");
		}
		
	}

	
}); */

	/* function addClick(){
		var selItem = $("#order-daily").val();
		var num = $("#order-daily-num").val();
	
		
		for (var i = 0; i < num; i++) {
			console.log(i);

			var inputTagAdd
			= "<input onclick='removeInput(this)' name='categoryNo' value =" + selItem + " ><br>";
			$(inputTagAdd).prependTo("form[name=order-item-form]");
	
	}
} */
	
	$(function(){
		$('.addBtn').click(function(){
			var itemId =$(this).attr("id");
			var itemCnt =$(this).attr("id");
			console.log(itemId);
			console.log(itemCnt);
			
			let orderDaily = "orderDaily";
			let orderIndivisual = "orderIndivisual";
			
			 function addClick() {
				 var num;
				 var selItem;
				 
				 if(itemId==orderDaily){
					 selItem = $("#orderDaily-item").val();
					 num = $("#orderDaily-num").val();
				 }else if(itemId ==orderIndivisual){
					 selItem = $("#orderIndivisual-item").val();
					 num = $("#orderIndivisual-num").val();
					 
				 }
					for (var i = 0; i < num; i++) {
						console.log(i);

						var inputTagAdd = "<input onclick='removeInput(this)' name='categoryNo' value =" + selItem + "><br>";
						$(inputTagAdd).prependTo("form[name=order-item-form]");
					}

				} 
			 
			 addClick();	//함수실행
			 
			 
		});	
	});
	function removeInput(element) {
		element.remove();
	}
</script>


<script src="<c:url value="/js/laundryService/order/orderMake.js"/>"
	type="text/javascript" text="javascript"></script>
<link rel="stylesheet"
	href="<c:url value="/css/laundryService/order/orderMake.css"/>"
	type="text/css" />

<div id="margin-top-fixed"></div>
<div id="orderWrapper">

	<p>
		<span>한서현 님</span> 수거요청
	</p>
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



		<div class="orderInfo-order-select-wrapper">
			<div class="title-select">세탁물 선택</div>

			<div class="orderInfo-order-daily">
				<p>생활빨래</p>
				<div class="order-select-wrap">
					<select class="mulit-select" name="orderDaily-item" id="orderDaily-item">
						<option value="" ></option>
						<option value="속옷">속옷</option>
						<option value="양말">양말</option>
						<option value="이불">이불</option>
						<option value="커튼">커튼</option>
					</select> 
					<select class="mulit-select" name="orderDaily-num" id="orderDaily-num">
						<option value="" ></option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
					</select>
					<button class="addBtn" id="orderDaily">추가</button>
				</div>
			</div>


			<div class="orderInfo-order-indivisual">
				<p>개별클리닝</p>


				<div class="order-select-wrap">
					<select class="mulit-select" name="orderIndivisual-item" id="orderIndivisual-item">
						<option value="" ></option>
						<option value="가죽바지">가죽바지</option>
						<option value="모피목도리">모피목도리</option>
						<option value="정장자켓">정장자켓</option>
						<option value="학생마이">학생마이</option>
					</select> 
					<select class="mulit-select" name="orderIndivisual-num" id="orderIndivisual-num">
						<option value="" ></option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
					</select>
					<button class="addBtn" id="orderIndivisual">추가</button>

				</div>
			</div>
			<div id="order-formDiv">
				<form name="order-item-form"
					action="<c:url value="/laundryService/order/paramPost"/>"
					method="get">
			</div>
			<div id="margin-top-fixed"></div>
			<input type="submit" value="확인" />
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