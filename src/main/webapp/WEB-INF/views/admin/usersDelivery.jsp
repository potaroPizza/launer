<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="card mb-4">
	<div class="card-header">일반회원</div>
	<div class="card-body">
		<div style="width: 100%; height: 500px; overflow: auto">
			<table class="table table-striped" id="orders">
				<colgroup>
					<col style="width: 10%">
					<col style="width: 10%">
					<col style="width: 25%">
					<col style="width: 20%">
					<col style="width: 20%">
					<col style="width: 10%">
				</colgroup>
				<thead>
					<tr>
						<th>러너번호</th>
						<th>이름</th>
						<th>이메일</th>
						<th>전화번호</th>
						<th>마지막접속일</th>
						<th>비고</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty list }">
						<tr>
							<td colspan="6" class="align_center">해당 사용자가 존재하지 않습니다.</td>
						</tr>
					</c:if>
					<c:if test="${!empty list }">
						<c:forEach var="deliveryDriverVo" items="${list }">
						<c:if test="${ deliveryDriverVo.outDate == null  }">
							<tr>
								<td>${deliveryDriverVo.no}</td>
					
								<td>${deliveryDriverVo.name}</td>
		
								<td>${deliveryDriverVo.email}</td>
					
								<td>${deliveryDriverVo.hp}</td>
						
								<td><fmt:formatDate value="${deliveryDriverVo.lastDate}" pattern ="yyyy-MM-dd"/></td>
			
								<td><input type="button" value="삭제" onclick="deleteDeliveryUser(${deliveryDriverVo.no})"></td>
							</tr>
						</c:if>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
	</div>
</div>


<div>총 ${totalRecord } 건</div>
