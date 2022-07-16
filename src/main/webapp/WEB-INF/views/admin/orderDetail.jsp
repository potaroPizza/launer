<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/layouts/admin"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!--
수거전
수거완료
세탁중
픽업대기
배송중
배송완료 
-->

<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 

<t:head>
</t:head>

<t:wrapper>

	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">주문상세</h1>
		
			<div style="width: 100%; height: 30px;'"></div>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i> 주문 상세 내역표
					
				</div>
				<div class="card-body">
				<div id="detail">	
				        <table class="view_2">
				        	<colgroup>
								<col style="width: 17%">
								<col style="width: 25%">
								<col style="width: 18%">
								<col style="width: 50%">

							</colgroup>
							<c:set var="vo" value="${vo}"></c:set>
							<c:set var="map" value="${vo.adminOrderDetailVo}"></c:set>
				            <tr>	<!-- 총 4열 -->
				                <td class="title">주문번호</td>
				                <td>${map.orderNo}</td>
				                <td class="title">주문자 아이디</td>
				                <td>${map.userEmail}</td>
				            </tr>
				            <tr>
				                <td class="title">주문상태</td>
				                <td>${map.status}</td>
				                <td class="title">주문자 주소</td>
				                <td>${map.address}</td>

				            </tr>
				            <tr>
				                <td class="title">담당지점</td>
				                <td>${map.officeName}</td>
				                <td class="title">신청시간</td>
				                <td>
				                	<fmt:formatDate value='${map.regdate}' pattern="yyyy-MM-dd HH:mm"/>
				                </td>
				            </tr>
				            <tr>
				                <td class="title">수거자</td>
				                <td>${map.pickupDriver}</td>
				                <td class="title">배송자</td>
				                <td>${map.deliveryDriver}</td>
				            </tr>
				            <tr>
				                <td class="title">주문상세</td>
				                <td colspan="3">
				                	<!-- 주문상세 반복 시작-->
				                	<c:set var="count" value="0"/>
				                	<c:set var="sum" value="0"/>
				                	<c:forEach var="listMap" items="${vo.adminOrderDetailList}">
				                		<span>${listMap['CATEGORYNAME']}</span> 
				                		<span>/ ${listMap['QUAN']}개</span> 
				                		<span>/ ${listMap['EAPRICE']}원(단위 당)</span>
				                		<c:set var="sum" value="${sum + listMap['EAPRICE']}"/>
				                		<c:set var="count" value="${count+1}"/>
				                		<c:if test="${fn:length(item) != count}">
				                		<br>
				                		</c:if>
				                		<!-- &nbsp; 2개 &nbsp; 8,000(건 당) -->
				                	</c:forEach>
				                	<!-- 주문상세 반복 끝-->
				                </td>
				            </tr>
				            <tr>
				                <td class="title">총 합계</td>
				                <td colspan="3">
				                	<fmt:formatNumber value="${sum}" pattern="#,###"/>원
				                </td>
				            </tr>
				            <tr>
				                <td class="title">결제번호</td>
				                <td>${map.paymentNo}</td>
				                <td class="title">결제시간</td>
				                <td>
				                	<fmt:formatDate value='${map.paymentDate}' pattern="yyyy-MM-dd HH:mm"/>
				                </td>
				            </tr>
				            <tr>
				                <td class="title">최종금액<br>(합계 + 과세금액)</td>
				                <td colspan="3">
				                	<fmt:formatNumber value="${sum}" pattern="#,###"/>원
				                </td>
				            </tr>

				        </table>
					<div class="pickUp">
						<c:if test="${map.status != '세탁중'}">
							<input type="button" value="배송대기 처리" id="pickUp" name="pickUp" disabled="disabled">
						</c:if>
						<c:if test="${map.status == '세탁중'}">
						<input type="button" value="배송대기 처리" id="pickUp" name="pickUp"
							onclick="location.href='<c:url value="/admin/ordersUpdate?orderNo=${map.orderNo}"/>';">
						</c:if>
					</div>
				</div>
							
				</div>
				
				
				
			</div>
			
		</div>
	</main>

	
</t:wrapper>