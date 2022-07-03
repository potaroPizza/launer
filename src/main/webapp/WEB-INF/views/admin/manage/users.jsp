<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/layouts/admin"%>

<t:head>
</t:head>
<t:wrapper>
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">유저관리</h1>
			<input type ="text" name ="paramTest" value="${size }">
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item active">일반사용자 배송기사 관리 페이지</li>
			</ol>
			<ul class="nav nav-tabs" id="manageTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link active" id="consumer" data-bs-toggle="tab"
						data-bs-target="#consumer-pane" type="button" role="tab"
						aria-controls="consumer-pane" aria-selected="true">일반사용자</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="delivery" data-bs-toggle="tab"
						data-bs-target="#delivery-pane" type="button" role="tab"
						aria-controls="delivery-pane" aria-selected="false">배송기사</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="Branch-manager" data-bs-toggle="tab"
						data-bs-target="#Branch-manager-pane" type="button" role="tab"
						aria-controls="Branch-manager-pane" aria-selected="false">지점관리자</button>
				</li>
			</ul>
			<br>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="consumer-pane"
					role="tabpanel" aria-labelledby="consumer-tab">
					<!-- 시작 -->
					<div class="card mb-4">
						<div class="card-header">이용자 현황</div>
						<div class="card-body">
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
										<th>회원정보</th>
										<th>상세정보</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${empty list }">
										<tr>
											<td colspan="5" class="align_center">해당 글이 존재하지 않습니다.</td>
										</tr>
									</c:if>
									<c:if test="${!empty list }">
										<c:forEach var="map" items="${list }">
										
											<tr>
												<!-- 회원 리스트 반복 -->
						
												<td>${map['NO'] }</td>
												<!-- users table no -->
												<td>${map['NAME']}</td>
												<!-- users table name -->
												<td>${map['EMAIL']}</td>
												<!-- users table email -->
												<td>${map['HP']}</td>
												<!-- users table hp -->
												<td>${map['USERCODE']}</td>
												<!-- users_class table class  -->
												<td><a href="#">회원상세</a></td>
											</tr>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
							<div>
								<a href="#">회원정보삭제</a>
							</div>
						</div>
					</div>
					<!-- 끝 -->
				</div>
				<div class="tab-pane fade" id="delivery-pane" role="tabpanel"
					aria-labelledby="delivery-tab">
					<!-- 시작 -->
					<div class="card mb-4">
						<div class="card-header">이용자 현황</div>
						<div class="card-body">
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
										<th>회원정보</th>
										<th>상세정보</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<!-- users table no -->
										<td>김길동</td>
										<td>han@gmail.com</td>
										<td>010-9999-0000</td>
										<td>배송기사</td>
										<td><a href="#">회원상세</a></td>
									</tr>
								</tbody>
							</table>
							<div>
								<a href="#">회원정보삭제</a>
							</div>
						</div>
					</div>
					<!-- 끝 -->
				</div>
				<div class="tab-pane fade" id="Branch-manager-pane" role="tabpanel"
					aria-labelledby="Branch-manager-tab">
					<!-- 시작 -->
					<div class="card mb-4">
						<div class="card-header">이용자 현황</div>
						<div class="card-body">
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
										<th>회원정보</th>
										<th>상세정보</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>한길동</td>
										<td>han@gmail.com</td>
										<td>010-9999-0000</td>
										<td>일반사용자</td>
										<td><a href="#">회원상세</a></td>
									</tr>
								</tbody>
							</table>
							<div>
								<a href="#">관리자추가</a> <a href="#">수정</a> <a href="#">삭제</a>
							</div>
						</div>
					</div>
					<!-- 끝 -->
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
