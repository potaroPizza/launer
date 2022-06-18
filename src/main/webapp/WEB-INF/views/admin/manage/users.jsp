<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/layouts/admin" %>

<t:head>
</t:head>
<t:wrapper>
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">유저관리</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item active">일반사용자 배송기사 관리 페이지</li>
			</ol>
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link active" id="view-all" data-bs-toggle="tab"
						data-bs-target="#view-all-pane" type="button" role="tab"
						aria-controls="view-all-pane" aria-selected="true">일반사용자</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="travel-plans" data-bs-toggle="tab"
						data-bs-target="#travel-plans-pane" type="button" role="tab"
						aria-controls="travel-plans-pane" aria-selected="false">배송기사</button>
				</li>
				
			</ul>

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
								<td>5</td>
								<td>한길동</td>
								<td>han@gmail.com</td>
								<td>010-9999-0000</td>
								<td>일반사용자</td>
								<td><a href="#">회원상세</a></td>
							</tr>
							<tr>
								<td>4</td>
								<td>이길동</td>
								<td>lee@gmail.com</td>
								<td>010-7777-8888</td>
								<td>일반사용자</td>
								<td><a href="#">회원상세</a></td>
							</tr>
							<tr>
								<td>3</td>
								<td>박길동</td>
								<td>park@gmail.com</td>
								<td>010-5555-6666</td>
								<td>일반사용자</td>
								<td><a href="#">회원상세</a></td>
							</tr>
							<tr>
								<td>2</td>
								<td>김길동</td>
								<td>kim@gmail.com</td>
								<td>010-3333-4444</td>
								<td>일반사용자</td>
								<td><a href="#">회원상세</a></td>
							</tr>
							<tr>
								<td>1</td>
								<td>홍길동</td>
								<td>hong@gmail.com</td>
								<td>010-1111-2222</td>
								<td>일반사용자</td>
								<td><a href="#">회원상세</a></td>
							</tr>
						</tbody>
						
					</table>
					<div>
						<a href="#">회원정보삭제</a>
					</div>
				</div>
			</div>
		</div>
	</main>
</t:wrapper>
