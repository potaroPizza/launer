<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/layouts/admin"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(function() {

	});
	function pageFunc(curPage) {
		//페이지 번호를 클릭했을 때 처리
		$('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();
	}

	function searchFunc() {
		var searchKeyword = $('input[name=searchKeyword]').val();
		var searchCondition = $('#searchCondition').val();

	}
</script>

<t:head>
</t:head>
<t:wrapper>
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">유저관리</h1>
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
			<br> <input type="text" name="searchCondition"
				value="${param.searchCondition }"> <input type="text"
				name="searchKeyword" value="${param.searchKeyword }">
			<c:set var="searchCondition" value="${param.searchCondition }" />
			<c:set var="searchKeyword" value="${param.searchKeyword }" />

			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="consumer-pane"
					role="tabpanel" aria-labelledby="consumer-tab">

					<!-- 일반회원 조회 tab -->

					<c:import url="/admin/usersCommon">
						<c:param name="searchCondition" value=""></c:param>
						<c:param name="searchKeyword" value="한서현"></c:param>
					</c:import>

					<!-- 일반회원 검색창 -->
					<div class="divSearch">
						<form name="frmSearch" method="post"
							action='<c:url value="/admin/users"/>'>
							<select name="searchCondition" id="searchCondition">
								<option value="name"
									<c:if test="${searchCondition=='name' }">
					            		selected="selected"
					            	</c:if>>이름</option>
								<option value="email"
									<c:if test="${searchCondition=='email' }">
					            		selected="selected"
					            	</c:if>>이메일</option>
								<option value="no"
									<c:if test="${searchCondition=='no' }">
					            		selected="selected"
					            	</c:if>>회원번호</option>
							</select> <input type="text" name="searchKeyword" title="검색어 입력"
								value="${searchKeyword}"> <input type="submit"
								value="검색">
						</form>
					</div>

				</div>

				<div class="tab-pane fade" id="delivery-pane" role="tabpanel"
					aria-labelledby="delivery-tab">

					<!-- 배달기사 조회 tab -->
					<c:import url="/admin/usersDelivery">
						<c:param name="searchKeyword" value="한서현"></c:param>
					</c:import>

					<!-- 배달기사 검색창 -->
					<div class="divSearch">
						<form name="frmSearch" method="post"
							action='<c:url value="/admin/usersDelivery"/>'>
							<select name="searchCondition">
								<option value="title"
									<c:if test="${param.searchCondition=='name' }">
					            		selected="selected"
					            	</c:if>>이름</option>
								<option value="content"
									<c:if test="${param.searchCondition=='email' }">
					            		selected="selected"
					            	</c:if>>이메일</option>
								<option value="name"
									<c:if test="${param.searchCondition=='no' }">
					            		selected="selected"
					            	</c:if>>기사번호</option>
							</select> <input type="text" name="searchKeyword" title="검색어 입력"
								value="${param.searchKeyword}"> <input type="submit"
								value="검색" onclick="searchFunc()">
						</form>
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
										<th>비고</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>한길동</td>
										<td>han@gmail.com</td>
										<td>010-9999-0000</td>
										<td>일반사용자</td>
										<td><input type="button" id="btMultiUpdate" value="삭제"></a></a></td>
									</tr>
								</tbody>
							</table>
							<div class="modal-button">
								<!-- 관리자 추가 모달 -->
								<input type="button" data-bs-toggle="modal"
									data-bs-target="#addAdmin" id="btMultiUpdate" value="관리자 추가">

								<input type="button" data-bs-toggle="modal"
									data-bs-target="#addAdmin" id="btMultiUpdate" value="관리자 추가">

								<!-- Modal -->
								<div class="modal fade" id="addAdmin" tabindex="-1"
									aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="addAdminModalLabel">관리자 추가</h5>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body">
												<form name="adminAdd" method="" action="">
													<div class="adminName">
														<label for="name">관리자 이름</label> <input type="text"
															name="name" id="name" style="ime-mode: active">
													</div>
													<div class="adminEmail">
														<label for="email">이메일</label> <input type="text"
															name="email" id="email"> <input type="button"
															value="중복 확인" id="ChkEmail">
													</div>
													<div class="adminPassword">
														<label for="password">비밀번호</label> <input type="password"
															name="password" id="password"
															placeholder="8자 이상의 문자,특수문자 포함">
													</div>
													<div class="adminPassword2">
														<label for="password2">비밀번호</label> <input type="password"
															name="password2" id="password2">
													</div>
													<div class="adminHp">
														<label for="hp">전화번호</label> <input type="text" name="hp"
															id="hp" maxlength="11" placeholder="-를 제외하고 입력해주세요">
													</div>
													<div class="office">
														<label for="office">지점</label> <select name="office"
															id="office">
															<option value="">지점 선택</option>
															<option value="">종로지점</option>
															<!-- 반복 시작 -->
															<%-- <c:forEach var="" items="">
								<div class="modal fade" id="addAdmin" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
								  <div class="modal-dialog">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h5 class="modal-title" id="addAdminModalLabel">관리자 추가</h5>
								        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								      </div>
								      <div class="modal-body">
								      	<form name="adminAdd" method="" action="">
								      	<div class="adminName">
									      	<label for="name">관리자 이름</label> 
											<input type="text" name="name" id="name" style="ime-mode: active">
								      	</div>
								      	<div class="adminEmail">
									      	<label for="email">이메일</label> 
									      	<input type="text" name="email" id="email" style="ime-mode: inactive">
											<input type="button" value="중복 확인" id="ChkEmail">
								      	</div>
								      	<div class="adminPassword">
									      	<label for="password">비밀번호</label> 
									      	<input type="password" name="password" id="password" placeholder="8자 이상의 문자,특수문자 포함">
								      	</div>
								      	<div class="adminPassword2">
									      	<label for="password2">비밀번호</label> 
									      	<input type="password" name="password2" id="password2">
								      	</div>
								      	<div class="adminHp">
								      		<label for="hp">전화번호</label>
								      		<input type="text" name="hp" id="hp" maxlength="11" placeholder="-를 제외하고 입력해주세요">
								      	</div>
								      	<div class="office">
								      		<label for="office">지점</label>
								      			<select name="office" id="office">
								      				<option value="">지점 선택</option>
								      				<option value="">종로지점</option>
								      				<!-- 반복 시작 -->
								      				<%-- <c:forEach var="" items="">
														<option value="">지점</option>						
													</c:forEach> --%>
															<!-- 반복 끝 -->
														</select>
													</div>
													<div align="center">
														<input type="button" data-bs-dismiss="modal" value="닫기">
														<input type="submit" id="wr_submit" value="추가">
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
								<!-- Modal 끝 -->
								<input type="button" data-bs-toggle="modal"
									data-bs-target="#editAdmin" id="btMultiUpdate" value="관리자 수정">
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
