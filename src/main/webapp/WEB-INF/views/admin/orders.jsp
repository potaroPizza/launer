<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/layouts/admin" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<t:head>
</t:head>
<t:wrapper>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 
<script src="<c:url value='/js/admin/orders.js'/>" type="text/javascript"></script>

<!-- 페이징 처리를 위한 form 시작-->
<form name="frmPage" method="post"
	action="<c:url value='/admin/orders'/>">
	<input type="hidden" class="startDay" name="startDay" value="${orderSearchVO.startDay}">
	<input type="hidden" class="endDay" name="endDay" value="${orderSearchVO.endDay}">
	<input type="hidden" class="officeNo" name="officeNo" value="${orderSearchVO.officeNo}">
	<input type="hidden" class="statusNo" name="statusNo" value="${orderSearchVO.statusNo}">
	<input type="hidden" class="userEmail" name="userEmail" value="${orderSearchVO.userEmail}">
	<input type="hidden" class="currentPage" name="currentPage">	
	<input type="hidden" class="countPerPage" name="countPerPage" value="${orderSearchVO.countPerPage}">
</form>
<!-- 페이징 처리 form 끝 -->

	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">주문관리</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item active">원하시는 검색 조건을 입력하세요</li>
			</ol>
			<div class="card mb-4">
				<div class="card-body">
					<div>
						<!-- 검색테이블 처리 form 시작-->
						<form name="frmSearch" method="post"
						action="<c:url value='/admin/orders'/>">
							<input type="hidden" class="countPerPage" name="countPerPage"
								value="${orderSearchVO.countPerPage}">
							조회기간 
							<input type="button" value="오늘" id="btnToday">
							<input type="button" value="1주일" id="btnWeek">
							<input type="button" value="1개월" id="btnMonth1">
							<input type="text" name="startDay"
								id="startDay" value="${orderSearchVO.startDay}" autocomplete = "off"> ~ 
							<input type="text" name="endDay" id="endDay"
								value="${orderSearchVO.endDay}" autocomplete = "off"> 
								
							&nbsp; 지점선택
							<select name="officeNo">
								<option value="0">전체</option>
								<c:forEach var="office" items="${officeList}">
									<option value="${office.no}"
										<c:if test="${orderSearchVO.officeNo == office.no}">
		           							selected
		           						</c:if>
									>${office.officeName}</option>
								</c:forEach>
							</select>
		
							&nbsp; 주문상태 선택
							<select name="statusNo">
								<option value="0">전체</option>
								<option value="1"
							  		<c:if test="${orderSearchVO.statusNo==1}">
            							selected
            						</c:if>
								>수거전</option>
								<option value="2"
									<c:if test="${orderSearchVO.statusNo==2}">
            							selected
            						</c:if>
								>수거완료</option>
								<option value="3"
									<c:if test="${orderSearchVO.statusNo==3}">
            							selected
            						</c:if>
								>세탁중</option>
								<option value="4"
									<c:if test="${orderSearchVO.statusNo==4}">
            							selected
            						</c:if>
								>배송대기</option>
								<option value="5"
									<c:if test="${orderSearchVO.statusNo==5}">
            							selected
            						</c:if>
								>배송중</option>
								<option value="6"
									<c:if test="${orderSearchVO.statusNo==6}">
            							selected
            						</c:if>
								>완료</option>
							</select>
							
							&nbsp; 주문자
							<input type="text" name="userEmail" placeholder="이메일 입력"
								value="${orderSearchVO.userEmail}">
							
							<input type="submit"
							id="od_submit" value="조회">
						</form>
						<!-- 검색테이블 처리 form 끝-->
					</div>
					
				</div>
			</div>
			<br>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i> 주문 현황
					
				</div>
				<div class="card-body">
				<form name="frmList" method="post"
					action="<c:url value=''/>">
					<table class="table table-striped" id="orders">
						<colgroup>
							<col style="width: 5%">
							<col style="width: 14%">
							<col style="width: 20%">
							<col style="width: 14%">
							<col style="width: 14%">
							<col style="width: 20%">
							<col style="width: 13%">
						</colgroup>
						<thead>
							<tr>
								<th><input type="checkbox" name="chkAll" id="chkAll"></th>
								<th>주문번호</th>
								<th>주문자</th>
								<th>담당지점</th>
								<th>주문상태</th>
								<th>날짜</th>
								<th>상세보기</th>
							</tr>
						</thead>
						<tbody>
						<c:if test="${empty list}">
							<tr class="align_center">
								<td colspan="7">주문내역이 존재하지 않습니다.</td>
							</tr>
						</c:if>
						<c:if test="${!empty list}">
						<c:set var="i" value="0"/>					
						<!-- 주문리스트 반복 시작 -->
						<c:forEach var="map" items="${list}">
							<tr>
								<td>
									<input type="checkbox" name="orderItems[${i}].no"
										value="${map['ORDERNO']}">
										<c:set var="i" value="${i+1}"/>
								</td>
								<td>${map['ORDERNO']}</td>
								<td>${map['USEREMAIL']}</td>
								<td>${map['OFFICENAME']}</td>
								<td class="tdStatus">${map['ORDERSTATUS']} </td>
								<td>
									<fmt:formatDate value="${map['REGDATE']}"
										pattern="yyyy-MM-dd HH:mm"/> 
								</td>
								<td><a href="<c:url value="/admin/orderDetail?orderNo=${map['ORDERNO']}"/>">상세보기</a></td>
							</tr>
						</c:forEach>
						<!-- 주문리스트 반복 끝 -->
						</c:if>
						</tbody>
					</table>
					<input type="button" id="btMultiUpdate" value="배송대기 처리">
					
					&nbsp; 
					<select id="selectCountPerPage">
						<option value="5"
							<c:if test="${orderSearchVO.countPerPage==5}">
            					selected
            				</c:if>
						>5개씩 보기</option>
						<option value="10"
							<c:if test="${orderSearchVO.countPerPage==10}">
            					selected
            				</c:if>
						>10개씩 보기</option>
						<option value="20"
							<c:if test="${orderSearchVO.countPerPage==20}">
            					selected
            				</c:if>
						>20개씩 보기</option>
						<option value="50"
							<c:if test="${orderSearchVO.countPerPage==50}">
            					selected
            				</c:if>
						>50개씩 보기</option>
					</select>
					<input type="button" id="btnReadExcel" 
						style="float:right;" value="엑셀파일로 받기">
					</form>
				</div>
			</div>
			<nav aria-label="...">
				<ul class="pagination">
				<c:if test="${pagingInfo.firstPage>1 }">
					<li class="page-item">
						<a class="page-link" href="#"
							onclick="pageFunc(${pagingInfo.firstPage-1})"
							>Previous
						</a>
					</li>
				</c:if>
				<!-- [1][2][3][4][5][6][7][8][9][10] -->
				<c:forEach var="i" begin="${pagingInfo.firstPage }"
					end="${pagingInfo.lastPage }">
					<c:if test="${i==pagingInfo.currentPage }">
						<li class="page-item disabled">
							<span class="page-link" 
								style="color: white; background: blue; font-weight: bold">
								${i}
							</span>
						</li>
					</c:if>
					<c:if test="${i!=pagingInfo.currentPage }">
						<li class="page-item">
							<a class="page-link" href="#"
								onclick="pageFunc(${i})">${i}</a>
						</li>
					</c:if>
				</c:forEach>
				<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
					<li class="page-item">
						<a class="page-link" href="#"
							onclick="pageFunc(${pagingInfo.lastPage+1})"
							>Next
						</a>
					</li>
				</c:if>
				</ul>
			</nav>
		</div>
	</main>

</t:wrapper>