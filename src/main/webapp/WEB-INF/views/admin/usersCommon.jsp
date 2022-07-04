<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
						<th>회원번호</th>
						<th>회원명</th>
						<th>이메일</th>
						<th>전화번호</th>
						<th>마지막접속일</th>
						<th>비고</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty list }">
						<tr>
							<td colspan="6" class="align_center">해당 글이 존재하지 않습니다.</td>
						</tr>
					</c:if>
					<c:if test="${!empty list }">
						<c:forEach var="userVo" items="${list }">

							<tr>
								<!-- 회원 리스트 반복 -->

								<td>${userVo.no}</td>
								<!-- users table no -->
								<td>${userVo.name}</td>
								<!-- users table name -->
								<td>${userVo.email}</td>
								<!-- users table email -->
								<td>${userVo.hp}</td>
								<!-- users table hp -->
								<td>${userVo.lastAccessDate}</td>
								<!-- users_class table class  -->
								<td><a href="#">삭제</a></td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
	</div>
</div>

<div>총 ${totalRecord } 건</div>

