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
	
	//동적으로 추가된 카테고리 관련
	$(document).on('click', '.order-item-Div div[name=testForm] #delBtn', function(){
	    var idx = $('.order-item-Div div[name=testForm] #delBtn').index(this);
	    $('.order-item-Div div[name=testForm]').eq(idx).remove();
	    
	    const totalPrice = new Array();
		 let sum=0;
		   $(".priceByQty").each(function(index, item){
			   totalPrice.push($(item).text());
		   }); 
			   
			   for (let i = 0; i < totalPrice.length; i++) {
				   const intTotalPrice = Number(totalPrice[i]);
				    sum += intTotalPrice;
				}
			   
			$('#totalPrice').text(sum);
	});
	
	
	$(document).on('mouseover','.order-item-Div div[name=testForm] #delBtn',function(){
		$(this).css("background",'red');
		
	});
	
	$(document).on('change','.order-item-Div div[name=testForm] #order-num',function(){
		var qty = $(this).val();
		var price = $(this).siblings('input[name=itemPrice]').val();
		//var priceByQty = $(this).val()*$('input[name=itemPrice]').val();
		var priceByQty = qty * price;
		$(this).next('.priceByQty').text(priceByQty);
		
		 const totalPrice = new Array();
		 let sum=0;
		   $(".priceByQty").each(function(index, item){
			   totalPrice.push($(item).text());
		   }); 
			   
			   for (let i = 0; i < totalPrice.length; i++) {
				   const intTotalPrice = Number(totalPrice[i]);
				    sum += intTotalPrice;
				}
			   
			$('#totalPrice').text(sum);
	});
	
	
	//추가 버튼을 누르면 option value 에 저장된 no 컨트롤러로 던져서 clothing_category 테이블의 VO 가져옴 => div 에 input 으로 정보를 뿌려줌
	$('#orderAddBtn').click(function(){
		var itemNo = $('#order-item').val();
		
		var itemInfo ={"no":itemNo};
		
	 	$.ajax({
			url:'/launer/laundryService/order/optionInfo',
			type: 'GET',
			data : itemInfo,
			
			success:function(vo){
				
				//모든 input 태그의 value를 배열에 저장
				//이미 배열에 값이 있다면 return false
				//없다면 새로운 input 태그 생성
				 const list = new Array();
				   $("input[name=no]").each(function(index, item){
					   list.push($(item).val());
				   }); 
				   
				   var cNo = (vo.no).toString();
				   const isInArray = list.includes(cNo);
				   
				   if(isInArray){
					   alert("이미 선택된 상품입니다");
					   return false;
				   }

				var tagAdd ="<div name ='testForm'><input type = 'hidden' name = 'no' class ='tagInputAdd' value=" + vo.no +">"
							+"<input type ='text' name = 'itemName' class ='tagAddDiv' value=" + vo.categoryName +">"
							+"<input type = 'text' name = 'itemPrice' class ='tagAddDiv' value=" + vo.price +">"
							+"<select class='mulit-select' name='order-num' id='order-num'>"
							+"<c:forEach var ='cnt' begin ='1' end='10' step='1'>"
							+"<option >${cnt}</option>"
							+"</c:forEach>"
							+"</select>"
							+"<div class = 'priceByQty'>"+vo.price+"</div>"
							+"<a href=# id='delBtn'><i class='fa-solid fa-xmark' id ='XDel'></i></a>"
							+"</div>";
				$(tagAdd).appendTo(".order-item-Div");
				
				 const totalPrice = new Array();
				 let sum=0;
				   $(".priceByQty").each(function(index, item){
					   totalPrice.push($(item).text());
				   });  
					   for (let i = 0; i < totalPrice.length; i++) {
						   const intTotalPrice = Number(totalPrice[i]);
						    sum += intTotalPrice;
						}
					$('#totalPrice').text(sum);			
			},
			error: function(){
				alert("err");	
			}
		}); 
	});
});

	
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

			<c:import url="/laundryService/order/orderMakeSelect">
				<c:param name="categoryGroup" value="1"></c:param>
			</c:import>


			<%-- 	<p>개별클리닝</p>
			<c:import url ="/laundryService/order/orderMakeSelect">
				<c:param name="categoryGroup" value="2"></c:param>
			</c:import> --%>
			
			<div id="order-item-form-div">
			<form name="order-item-form" action="<c:url value="#"/>" method="get">
			<div class = "order-item-Div">
			</div>
			</div>
				총:<span id="totalPrice"></span>원
			
		</div>
		<div class="margin-top-fixed"></div>
		<div class="orderInfo-request">
			<div>세탁요청사항</div>
			<input type ="text" name="order_request" id="order_request">
		</div>
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
		
		
			<input type="submit" class="orderBtn" value="수거신청" id="submit">
			</form>
		</div>
	</div>


</div>
<div class="margin-top-fixed"></div>



</body>
</html>