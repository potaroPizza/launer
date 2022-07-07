<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/layouts/admin" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  
<t:head>
</t:head>
<t:wrapper>
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">지점관리</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item active">지점 등록 현황 및 지점 등록 삭제</li>
			</ol>
			<div class="card mb-4">
				<div class="card-body ">
					<div class="d-grid gap-2 d-md-flex justify-content-md-end">
						<input type="button" value="지점조회">
					</div>
				</div>
			</div>
			<div class="card mb-4">
				<div class="card-header">지점 현황</div>
				<div class="card-body">
					<table class="table table-striped" id="orders">
						<colgroup>
							<col style="width: 10%">
							<col style="width: 15%">
							<col style="width: 36%">
							<col style="width: 19%">
							<col style="width: 12%">
							<col style="width: 12%">
							
						</colgroup>
						<thead>
							<tr>
								<th>지점번호</th>
								<th>지점명</th>
								<th>지점주소</th>
								<th>지점관리자</th>
								<th>상세정보</th>
								<th>비고</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="officeVo" items="${officeList }">
							
								<tr>
									<td>${officeVo.no}</td>
									<td>${officeVo.officeName}</td>
									<td>${officeVo.address}</td>
									<td>-</td>
									<td><a href="#">지점정보</a></td>
									<td><input type="button" value="삭제" onclick=""></td>
								</tr>
						
							</c:forEach>
						</tbody>
						
					</table>
					<div>
						<!-- 관리자 추가 모달 -->
							<!-- Modal -->
							<div class="modal fade" id="officeAdd" tabindex="-1" aria-labelledby="officeAddModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="officeAddModalLabel">지점 등록</h5>
											<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<form name="officeAdd" id="officeAdd">
												<div class="officeName">
													<label for="name">지점명</label> <input type="text"
														name="name" id="name" style="ime-mode: active">
												</div>
												<div class="officeAddress">
													<label for="address">지점주소</label> <input type="text"
														name="address" id="address" style="ime-mode: active">
												</div>
												<div class="latitude"><!-- LAT_Y -->
													<label for="latitude">위도</label> <input type="text"
														name="latitude" id="latitude" style="ime-mode: active">
												</div>
												<div class="longitude"><!-- LON_X -->
													<label for="longitude">경도</label> <input type="text"
														name="longitude" id="longitude" style="ime-mode: active">
												</div>
																							
												<div align="center">
													<input type="button" data-bs-dismiss="modal" value="닫기">
													<input type="button" id="wr_submit" value="추가">
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
							<!-- Modal 끝 -->
									
							<input type="button" data-bs-toggle="modal"	data-bs-target="#officeAdd" id="officeAdd" value="지점등록">
							<!-- 끝 -->
					</div>
				</div>
			</div>
		</div>
	</main>
	
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js"
		integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js"
		integrity="sha384-kjU+l4N0Yf4ZOJErLsIcvOU2qSb74wXpOhqTvwVx3OElZRweTnQ6d31fXEoRD1Jy"
		crossorigin="anonymous"></script>
	
</t:wrapper>


