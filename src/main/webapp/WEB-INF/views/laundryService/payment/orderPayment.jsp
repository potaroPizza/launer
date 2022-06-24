<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<!-- iamport.payment.js -->

<%@taglib prefix="t" tagdir="/WEB-INF/tags/layouts/user" %>

<t:wrapper>
<!DOCTYPE html>
<style>
	.orderPaymentWrapper {
		width: 300px;
		border: 1px solid black;
	}
</style>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
	<script type="text/javascript">
$(function(){
		$('#paymentBtn').click(function(){
				var email = $('#email').val();
				var name = $('#name').val();
				var orderNo = $('#orderNo').val();
				var payPrice = $('#payPrice').val();

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
	               //  name: '빨래',
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
		            			"payPrice" :payPrice
		            		},
		            	});
		            } else {
		                var msg = '결제에 실패하였습니다.';
		                msg += '에러내용 : ' + rsp.error_msg;
		            }
		            alert(msg);
		            document.location.href="/launer/laundryService/order/orderMake"; //alert창 확인 후 이동할 url 설정
	});
});
});
</script>
	<div class="margin-fixed-margin"></div>
	<div id="payment-wrap">
		<div class="orderPaymentWrapper">
		
		<label for = "payPrice"></label>
		<input type="text" id="payPrice" class="div" value="${payPrice }" name="payPrice"> 
		<label for = "orderNo"></label>
		<input type="text" id="orderNo" class="div" value="${orderNO }" name="orderNo">
		<input type="hidden" id="email" class="div" value="${email }" name="email">
		<input type="hidden" id="name" class="div" value="${name }" name="name">
		<input type="hidden" id="userPoint" class="div" value="${userPoint }" name="userPoint">
			<button class="btn" value="결제하기" id="paymentBtn">결제하기</button>
		</div>
	</div>
</t:wrapper>