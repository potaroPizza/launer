<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>
<style type="text/css">
.sb-sidenav-footer {
	position: absolute;
	bottom: 0;
	width: 225px;
}

#orders th, #orders td {
	text-align: center;
}
</style>

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
</script>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">주문상세</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item active"></li>
			</ol>
			<div class="card mb-4">
				<div class="card-body">
					<div>
						<form name="frm1" method="post"
						action="<c:url value='/shop/order/orderList'/>">
						<!-- 조회기간 include -->
						조회기간 
						<input type="button" value="1주일"> <input
							type="button" value="1개월"> <input type="button"
							value="3개월"> <input type="text" name="startDay"
							id="startDay" value="${dateSearchVO.startDay}"> ~ <input
							type="text" name="endDay" id="endDay"
							value="${dateSearchVO.endDay}"> 
							
							&nbsp; 지점선택
							<select>
							  <option selected>전체</option>
							  <option value="1">영등포점</option>
							  <option value="2">마포점</option>
							  <option value="3">구로점</option>
							</select>
							




 
							&nbsp; 주문상태 선택
							<select>
							  <option selected>전체</option>
							  <option value="1">수거전</option>
							  <option value="2">수거완료</option>
							  <option value="3">세탁중</option>
							  <option value="3">픽업대기</option>
							  <option value="3">배송중</option>
							  <option value="3">배송완료</option>
							</select>
							
							<input type="submit"
							id="od_submit" value="조회">
						</form>
					</div>
					
				</div>
			</div>
			<br>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i> 주문 현황
					
				</div>
				<div class="card-body">
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
							<tr>
								<td>
									<input type="checkbox" name=""
										value="">
								</td>
								<td>172</td>
								<td>jihuo1004@gmail.com</td>
								<td>영등포점</td>
								<td>세탁중</td>
								<td>2022-06-15 19:46</td>
								<td><a href="#">상세보기</a></td>
							</tr>
							<tr>
								<td>
									<input type="checkbox" name=""
										value="">
								</td>
								<td>172</td>
								<td>jihuo1004@gmail.com</td>
								<td>영등포점</td>
								<td>세탁중</td>
								<td>2022-06-15 19:46</td>
								<td><a href="#">상세보기</a></td>
							</tr>
							<tr>
								<td>
									<input type="checkbox" name=""
										value="">
								</td>
								<td>172</td>
								<td>jihuo1004@gmail.com</td>
								<td>영등포점</td>
								<td>세탁중</td>
								<td>2022-06-15 19:46</td>
								<td><a href="#">상세보기</a></td>
							</tr>
							<tr>
								<td>
									<input type="checkbox" name=""
										value="">
								</td>
								<td>172</td>
								<td>jihuo1004@gmail.com</td>
								<td>영등포점</td>
								<td>픽업대기</td>
								<td>2022-06-15 19:46</td>
								<td><a href="#">상세보기</a></td>
							</tr>
							<tr>
								<td>
									<input type="checkbox" name=""
										value="">
								</td>
								<td>172</td>
								<td>jihuo1004@gmail.com</td>
								<td>영등포점</td>
								<td>픽업대기</td>
								<td>2022-06-15 19:46</td>
								<td><a href="#">상세보기</a></td>
							</tr>

						</tbody>
					</table>
					<input type="button" value="픽업대기 처리">
					&nbsp; 
							<select>
							<option value="1">5개씩 보기</option>
							  <option selected>10개씩 보기</option>
							  <option value="1">20개씩 보기</option>

							</select>
				</div>
				
				
				
			</div>
			<nav aria-label="...">
					 <ul class="pagination">
					 <li class="page-item disabled">
					 	<span class="page-link">Previous</span>
					 </li>
					 <li class="page-item"><a class="page-link" href="#">1</a></li>
					 <li class="page-item active" aria-current="page">
					 	<span class="page-link">2</span>
					 </li>
					 <li class="page-item"><a class="page-link" href="#">3</a></li>
					 <li class="page-item">
					 	<a class="page-link" href="#">Next</a>
					 </li>
					 </ul>
				</nav>
		</div>
	</main>

	<%@ include file="bottom.jsp"%>