<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/layouts/user" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<t:wrapper>
<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"/>" />
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript" src="<c:url value='/js/paymentdetails.js'/>"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 


	<form name="frmPage" method="post"
		action="<c:url value='/mypage/paymentdetails'/>">
		<input type="hidden" class="startDay" name="startDay" value="${paymentSearchVO.startDay}">
		<input type="hidden" class="endDay" name="endDay" value="${paymentSearchVO.endDay}">
		<input type="hidden" class="currentPage" name="currentPage">	
	</form>
	<div id="paymentdetails_wrap">
		<div class="paymentdetails_top"></div>
		<div class="paymentdetails_title">
			<p>결제 내역</p>
		</div>
		<div class="paymentdetails_date_wrap">
			<div class="paymentdetails_date">
				<form name="frm1" method="post" action="<c:url value='/mypage/paymentdetails'/>">
					<input type="button" value="1주일" class="btn btn-outline-dark" id="btDay7">
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
				
				<c:if test="${empty list }">
				<li class="paymentdetails_table-row"> 
					<div class="paymentdetails_col-1" data-label="주문번호"></div>
					<div class="paymentdetails_col-2" data-label="상품명">결제 내역이 없습니다.</div>
					<div class="paymentdetails_col-3" data-label="가격"></div>
					<div class="paymentdetails_col-4" data-label="주문일"></div>
					<div class="paymentdetails_col-5" data-label="상태"></div>
				</li>
				</c:if>
				<c:if test="${!empty list }">
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
							<div class="paymentdetails_col-1" data-label="주문번호">${vo.paymentViewVO.orderNo}</div>
							<div class="paymentdetails_col-2" data-label="상품명">
								<c:if test="${fn: length(title)>8}"><%-- ${fn:substringBefore(title,",")} --%>
								<a href="/launer/mypage/detailedPaymentHistory?orderNo=${vo.paymentViewVO.orderNo}">${fn:substring(title,0,title.indexOf(',',title.indexOf(',')+1))} 등...</a>
								</c:if>
						
			            <c:if test="${fn: length(title)<=8}">
			                  <a href="/launer/mypage/detailedPaymentHistory?orderNo=${vo.paymentViewVO.orderNo}">${title}</a>           
			            </c:if>
							</div>
							<div class="paymentdetails_col-3" data-label="가격"><fmt:formatNumber value="${vo.paymentViewVO.totalPrice}" pattern="#,###"></fmt:formatNumber>원</div>
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