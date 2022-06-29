<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/layouts/user"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<t:wrapper>
<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"/>" />
<script src="<c:url value="/js/bootstrap.min.js"/>" type="text/javascript"></script>
<script type="text/javascript" src="<c:url value='/js/mypoint.js'/>"></script>
	
	<form name="frmPage" method="post" action="<c:url value='/mypage/mypoint'/>">
		<input type="hidden" class="currentPage" name="currentPage">
	</form>

	<div id="mypoint_wrap">
		<div class="mypoint_top"></div>
		<div class="mypoint_title">
			<p>포인트</p>
		</div>
		<div class="mypoint_container1">
			<ul class="mypoint_table1">
				<li class="mypoint_table1-row">
					<div class="mypoint_col1-1">${vo.name} 님의 포인트</div>
					<div class="mypoint_col1-2"><fmt:formatNumber value="${vo.point}" pattern="#,###,###,###"></fmt:formatNumber> P</div>
				</li>
			</ul>
		</div>

		<div class="mypoint_details">
			<p>포인트 이용내역</p>
		</div>
		<div class="mypoint_container">
			<ul class="mypoint_table">
				<li class="mypoint_table-header">
					<div class="mypoint_col-1">날짜</div>
					<div class="mypoint_col-2">주문번호</div>
					<div class="mypoint_col-3">내역</div>
					<div class="mypoint_col-4">포인트</div>
				</li>
				<c:if test="${empty searchList }">
					<div class="mypoint_col-1" data-label="날짜"></div>
					<div class="mypoint_col-2" data-label="주문번호"></div>
					<div class="mypoint_col-3" data-label="내역">이용 내역이 없습니다.</div>
					<div class="mypoint_col-4" data-label="포인트"></div>
				</c:if>
				<c:if test="${!empty searchList }">
					<c:forEach var="map" items="${searchList }">
						<li class="mypoint_table-row">
							<div class="mypoint_col-1" data-label="날짜">
								<fmt:formatDate value="${map['REGDATE']}" pattern="yyyy-MM-dd" />
							</div>
							<div class="mypoint_col-2" data-label="주문번호" id="point_order_no">${map['ORDER_NO']}</div>
							<div class="mypoint_col-3" data-label="내역" id="point_detail"></div>
							<div class="mypoint_col-4" data-label="포인트" id="point_cal">
								<fmt:formatNumber value="${map['POINT']}" pattern="#,###"></fmt:formatNumber>
								P
							</div>
						</li>

					</c:forEach>
				</c:if>

			</ul>
		</div>
		<div class="mypoint_paging">
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

		<div class="mypoint_notification">
			<p>포인트 이용 유의사항</p>
			<ul>
				<li>포인트 사용시, 구매금액 제한 없이 결제 시 즉시 사용됩니다.</li>
				<li>회원 탈퇴시 보유하신 포인트 모두 소멸됩니다.</li>
			</ul>
		</div>
	</div>
</t:wrapper>