<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>


<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">지점관리</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item active">지점 등록 현황 및 지점 등록 삭제</li>
			</ol>
			<div class="card mb-4">
				<div class="card-body ">
					<div class="d-grid gap-2 d-md-flex justify-content-md-end">
						<button type="button">지점조회</button>
					</div>
				</div>
			</div>
			<div class="card mb-4">
				<div class="card-header">지점 현황</div>
				<div class="card-body">
					<table class="table table-striped" id="orders">
						<colgroup>
							<col style="width: 10%">
							<col style="width: 20%">
							<col style="width: 35%">
							<col style="width: 20%">
							<col style="width: 10%">
							
						</colgroup>
						<thead>
							<tr>
								<th>지점번호</th>
								<th>지점명</th>
								<th>주소</th>
								<th>지점관리자</th>
								<th>상세정보</th>

							</tr>
						</thead>
						<tbody>
							<tr>
								<td>5</td>
								<td>영등포구</td>
								<td>서울특별시 영등포구 당산로 123</td>
								<td>영등포관리자</td>
								<td><a href="#">지점정보</a></td>
							</tr>
							<tr>
								<td>4</td>
								<td>강남구</td>
								<td>서울특별시 강남구 학동로 426</td>
								<td>강남관리자</td>
								<td><a href="#">지점정보</a></td>
							</tr>
							<tr>
								<td>3</td>
								<td>중구</td>
								<td>서울특별시 중구 창경궁로 17</td>
								<td>중구관리자</td>
								<td><a href="#">지점정보</a></td>
							</tr>
							<tr>
								<td>2</td>
								<td>마포구</td>
								<td>서울특별시 마포구 월드컵로 212</td>
								<td>마포구관리자</td>
								<td><a href="#">지점정보</a></td>
							</tr>
							<tr>
								<td>1</td>
								<td>서대문구</td>
								<td>서울특별시 서대문구 연희로 248</td>
								<td>서대문구관리자</td>
								<td><a href="#">지점정보</a></td>
							</tr>
						</tbody>
						
					</table>
					<div>
						<a href="#">지점등록</a>
						<a href="#">지점삭제</a>
					</div>
				</div>
			</div>
		</div>
	</main>

	<%@ include file="../bottom.jsp"%>