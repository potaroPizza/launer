<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/layouts/user" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
        $("#paysubmit").click(function(){
			if($("#startDay").val().length<1){
				alert("검색할 결제 시작일을 입력하세요");
				$("#startDay").focus();
				return false;
			}
			if($("#endDay").val().length<1){
				alert("검색할 결제 종료일을 입력하세요");
				$("#endDay").focus();
				return false;
			}
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
	
	function pageFunc(curPage){
		$('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();
	}
</script>
<style>

</style>
	<form name="frmPage" method="post"
		action="<c:url value='/mypage/paymentdetails'/>">
		<input type="hidden" class="startDay" name="startDay" value="${paymentSearchVO.startDay}">
		<input type="hidden" class="endDay" name="endDay" value="${paymentSearchVO.endDay}">
		<input type="hidden" class="currentPage" name="currentPage">	
		<input type="hidden" class="countPerPage" name="countPerPage" value="${paymentSearchVO.countPerPage}">
	</form>
	<div id="paymentdetails_wrap">
		<div class="paymentdetails_top"></div>
		<div class="paymentdetails_title">
			<p>결제 내역</p>
		</div>
		<div class="paymentdetails_date_wrap">
			<div class="paymentdetails_date">
				<form name="frm1" method="post" action="<c:url value='/mypage/paymentdetails'/>">
					<input type="button" value="1개월" class="btn btn-outline-dark" id="btMonth1">
					<input type="button" value="3개월" class="btn btn-outline-dark" id="btMonth3">
					<input type="button" value="6개월" class="btn btn-outline-dark" id="btMonth6">
					<br> <br> <input type="text" name="startDay" id="startDay" class="dateText"
						value="${paymentSearchVO.startDay }" autocomplete = "off" > ~ <input type="text"
						name="endDay" id="endDay" class="dateText" value="${paymentSearchVO.endDay }" autocomplete = "off">
					<input type="submit" id="paysubmit"  class="btn btn-outline-dark" value="조회">
				</form>
			</div>
			<div class="paymentdetails_count">
				<p><span>${paymentSearchVO.startDay }</span> ~ <span>${paymentSearchVO.endDay }</span> 까지의 결제내역 총 <span>${pagingInfo.totalRecord }</span>건 입니다.</p>
			</div>
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
				
<%--				<c:if test="${empty paymentList }">--%>
				<c:if test="${empty list }">
				<li class="paymentdetails_table-row"> 
					<div class="paymentdetails_col-1" data-label="주문번호"></div>
					<div class="paymentdetails_col-2" data-label="상품명">결제 내역이 없습니다.</div>
					<div class="paymentdetails_col-3" data-label="가격"></div>
					<div class="paymentdetails_col-4" data-label="주문일"></div>
					<div class="paymentdetails_col-5" data-label="상태"></div>
				</li>
				</c:if>
<%--				<c:if test="${!empty paymentList }">--%>
				<c:if test="${!empty list }">
<%--					<c:forEach var="map" items="${paymentList }">--%>
					<c:forEach var="vo" items="${list }">
						<li class="paymentdetails_table-row">
							<c:set var="title" value=""/>
							<c:set var="titleCnt" value="0"/>
							<c:forEach var="titleMap" items="${vo.paymentDetails}">
								<c:if test="${titleCnt == 0}">
									<c:set var="title" value="${titleMap.CATEGORY_NAME}"/>
								</c:if>
								<c:if test="${titleCnt != 0}">
									<c:set var="title" value="${title}, ${titleMap.CATEGORY_NAME}"/>
								</c:if>
								<c:set var="titleCnt" value="${titleCnt + 1}"/>
							</c:forEach>
							<%-- <div class="paymentdetails_col-1" data-label="주문번호">${PaymentViewVO.paymentViewVO.orderNo}</div> --%>
							<div class="paymentdetails_col-1" data-label="주문번호">${vo.paymentViewVO.orderNo}</div>
							<div class="paymentdetails_col-2" data-label="상품명">
								<c:if test="${fn: length(title)>20}">
								<a href="/launer/mypage/detailedPaymentHistory">${fn:substringBefore(title,",")} 외...</a>
								</c:if>
						
			            <c:if test="${fn: length(title)<=20}">
			                  <a href="/launer/mypage/detailedPaymentHistory">${title}</a>           
			            </c:if>
							</div>
							<div class="paymentdetails_col-3" data-label="가격"><fmt:formatNumber value="${vo.paymentViewVO.totalPrice}" pattern="#,###"></fmt:formatNumber></div>
							<div class="paymentdetails_col-4" data-label="주문일"><fmt:formatDate value="${vo.paymentViewVO.regdate}" pattern="yyyy-MM-dd" /></div>
							<div class="paymentdetails_col-5" data-label="상태">${vo.paymentViewVO.status}</div>

								
						</li>
					</c:forEach>
				</c:if>

			</ul>
		</div>
		<div class="payment_paging">
			<nav aria-label="Page navigation example">
				<ul class="pagination">
					<c:if test="${pagingInfo.firstPage>1 }">
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Previous"
							onclick="pageFunc(${pagingInfo.firstPage-1})"> <span
								aria-hidden="true">&laquo;</span>
						</a></li>
					</c:if>
					<c:forEach var="i" begin="${pagingInfo.firstPage }"
						end="${pagingInfo.lastPage }">
						<c:if test="${i==pagingInfo.currentPage }">
							<li class="page-item"><a class="page-link" href="#"
								style="color: white; background: #849EC2; font-weight: bold">${i}</a></li>
						</c:if>
						<c:if test="${i!=pagingInfo.currentPage }">
							<li class="page-item"><a class="page-link" href="#"
								onclick="pageFunc(${i})">${i}</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
						<li class="page-item"><a class="page-link" href="#"
							onclick="pageFunc(${pagingInfo.lastPage+1})" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:if>
				</ul>
			</nav>
		</div>

		
	</div>
</t:wrapper>