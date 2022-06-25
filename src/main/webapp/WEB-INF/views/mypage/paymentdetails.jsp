<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/layouts/user" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<t:wrapper>
<script type="text/javascript">
	$(function(){
		$("#startDay").datepicker({
			dateFormat:'yy-mm-dd',
			changeYear:true,
			dayNamesMin:['일','월','화','수','목','금','토'],
			monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
		});
		$("#endDay").datepicker({
			dateFormat:'yy-mm-dd',
			changeYear:true,
			dayNamesMin:['일','월','화','수','목','금','토'],
			monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
		});
	});
	$(function(){
		$('#btMonth1').click(function(){
        	$.setDate(1, 'M');	
        });
        
        $('#btMonth3').click(function(){
        	$.setDate(3, 'M');
        });
        
        $('#btMonth6').click(function(){
        	$.setDate(6, 'M');
        });
        $.setDate = function(term, type){
    		
    		var str=$('#endDay').val().split('-');
    		var d = new Date(str[0], str[1]-1, str[2]);
    		if(type=="D"){
    			d.setDate(d.getDate()-term);	
    		}else if(type=='M'){
    			d.setMonth(d.getMonth()-term);
    		}
    		
    		$('#startDay').val($.findDate(d));
    	}	
    	
    	$.findDate = function(date){
    	     return date.getFullYear()+"-" + $.formatDate(date.getMonth()+1) +"-"
             	+ $.formatDate(date.getDate());
       	}
       
    	$.formatDate = function(d){
    		if(d<10) 
    			d="0" + d;
    		
    		return d;
    	}
	});
</script>
<style>

</style>
	<div id="paymentdetails_wrap">
		<div class="paymentdetails_top"></div>
		<div class="paymentdetails_title">
			<p>결제 내역</p>
		</div>
		<div class="paymentdetails_date">
			<form name="frm1" method="post" action="<c:url value=''/>">
				<input type="button" value="1개월" class="btn btn-outline-dark" id="btMonth1">
				<input type="button" value="3개월" class="btn btn-outline-dark" id="btMonth3">
				<input type="button" value="6개월" class="btn btn-outline-dark" id="btMonth6">
				<br> <br> <input type="text" name="startDay" id="startDay"
					value="${dateSearchVO.startDay }"> ~ <input type="text"
					name="endDay" id="endDay" value="${dateSearchVO.endDay }">
				<input type="submit" id="" value="조회">
			</form>
		</div>
		<div class="paymentdetails_container">
			<ul class="paymentdetails_table">
				<li class="paymentdetails_table-header">
					<div class="paymentdetails_col-1">주문번호</div>
					<div class="paymentdetails_col-2">상품명</div>
					<div class="paymentdetails_col-3">가격</div>
					<div class="paymentdetails_col-4">주문일</div>
					<div class="paymentdetails_col-5">상태</div>
				</li>
				<c:if test="${!empty list }">
				<c:forEach var="PaymentViewVO" items="${list }">
				<li class="paymentdetails_table-row"> 
					<div class="paymentdetails_col-1" data-label="주문번호">${PaymentViewVO.paymentViewVO.orderNo}</div>
					<div class="paymentdetails_col-2" data-label="상품명">
						<a href="/launer/mypage/detailedPaymentHistory">${PaymentViewVO.paymentViewVO.categoryName}</a>
					</div>
					<div class="paymentdetails_col-3" data-label="가격"><fmt:formatNumber value="${PaymentViewVO.paymentViewVO.totalPrice}" pattern="#,###"></fmt:formatNumber></div>
					<div class="paymentdetails_col-4" data-label="주문일"><fmt:formatDate value="${PaymentViewVO.paymentViewVO.regdate}" pattern="yyyy-MM-dd" /></div>
					<div class="paymentdetails_col-5" data-label="상태">${PaymentViewVO.paymentViewVO.status}</div>
				</li>
				</c:forEach>
				</c:if>

			</ul>
		</div>

		<div class="paymentdetails_amountPayment">
			<p>
				총 결제 금액 <span>1500</span>원
			</p>
		</div>
	</div>
</t:wrapper>