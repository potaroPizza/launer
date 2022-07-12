<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<!-- iamport.payment.js -->

<%@taglib prefix="t" tagdir="/WEB-INF/tags/layouts/user" %>

<t:wrapper>
<!DOCTYPE html>
<style>
div#payment-wrap {
    height: 100%;
}
</style>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
	<script type="text/javascript">
$(function(){
	var paymentResult = true;
	$(document).ready(function () {
				var email = $('#email').val();
				var name = $('#name').val();
				var orderNo = $('#orderNo').val();
				var payPrice = $('#payPrice').val();
				var userPoint = $('#userPoint').val();
				var savePoint =$('#savePoint').val();
				
				console.log(savePoint);
				
				if(userPoint<0 || userPoint==null){
					userPoint = 0;
				}
				
				//전액 포인트로 결제할 경우
				if(payPrice ==0){
					$.ajax({
	                	type:'get',
	            		url:"/launer/laundryService/payment/requestPayment",
	            		data:{
	            			"orderNo" : orderNo,
	            			"payPrice" :payPrice,
	            			"userPoint" : userPoint,
	            			"savePoint" : savePoint,
	            		},
	            	});
					
					alert("결제가 완료되었습니다");
					document.location.href="/launer/mypage/paymentdetails";
					event.preventDefault();
	                return false;
				}

		        // getter
		        var IMP = window.IMP;
				IMP.init("imp91647694");
		        
		        var amount = $('#payPrice').val();
		        console.log(amount);		        

		        IMP.request_pay({
	            	 pg: 'html5_inicis',
	                 paymentCode: 'p' + new Date().getTime(),
	                 pay_method:"card",
	                 merchant_uid: orderNo,
	                 amount: amount,
	                 name: '빨래',
	                 buyer_email: email,
	                 buyer_name: name,
	                // buyer_tel: '010-1111-1111', 
	            
		        }, function (rsp) {
		            console.log(rsp);
		            if (rsp.success) {
		            	
		            	
		                var msg = '결제가 완료되었습니다.';
		               // msg += '고유ID : ' + rsp.imp_uid;
		                msg += '카드 승인번호 : ' + rsp.apply_num;
		           
		                $.ajax({
		                	type:'get',
		            		url:"/launer/laundryService/payment/requestPayment",
		            		data:{
		            			"orderNo" : orderNo,
		            			"payPrice" :payPrice,
		            			"userPoint" : userPoint,
		            			"savePoint" : savePoint,
		            		},
		            	});
		            } else {
		            	var msg = '결제에 실패하였습니다. 메인화면으로 이동합니다';
		            	paymentResult = false;
		            }
		            alert(msg);
		            //alert창 확인 후 이동할 url 설정
		            if(paymentResult){
		           	  document.location.href="/launer/mypage/paymentdetails"; //결제 성공 시 이동할 url
		            }else {
		            	$.ajax({
		                	type:'get',
		            		url:"/launer/laundryService/payment/paymentFailed",
		            		data:{
		            			"orderNo" : orderNo,
		            			"payPrice" :payPrice,
		            			"userPoint" : userPoint,
		            			"savePoint" : savePoint,
		            		},
		            	});
		            	document.location.href="/launer"; //결제 성공 시 이동할 url

		            }

		            
	});
});
});
</script>
	<div class="margin-fixed-margin"></div>
	<div id="payment-wrap">
		<div class="orderPaymentWrapper">
		
		<input type="hidden" id="payPrice" class="div" value="${payPrice }" name="payPrice"> 
		<label for = "orderNo"></label>
		<input type="hidden" id="orderNo" class="div" value="${orderNO }" name="orderNo">
		<input type="hidden" id="email" class="div" value="${email }" name="email">
		<input type="hidden" id="name" class="div" value="${name }" name="name">
		<input type="hidden" id="userPoint" class="div" value="${userPoint}" name="userPoint">
		<input type="hidden" id="savePoint" class="div" value="${savePoint }" name="savePoint"> 
		</div>
	</div>
</t:wrapper>