<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/layouts/admin"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="<c:url value='/js/adminManager.js'/>"></script>
<script type="text/javascript">

	function deleteUser(no){
		var url ='/launer/admin/user/'+no
		alert(url)
		$.ajax({
			url:url,
			type:'delete',
			date: {},
			dataType    : "html",
			success:function(data) {
				alert("성공")
				location.reload();
			},
			error: function(error){
				alert("성공")
				location.reload();
			}
		});
	}
	
	function deleteDeliveryUser(no){
		var url ='/launer/admin/delivery-user/'+no
		alert(url)
		$.ajax({
			url:url,
			type:'delete',
			date: {},
			dataType    : "html",
			success:function(data) {
				alert("성공")
				location.reload();
			},
			error: function(error){
				alert("성공")
				location.reload();
			}
		});
	}
	
	$(function(){

	});
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
						aria-controls="consumer-pane" aria-selected="false">일반사용자</button>
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
			<br> <input type="hidden" name="tabNo" value="${tabNo }"
				id="tabNo" class="paramInput"> <input type="hidden"
				name="searchCondition" value="${userSearchCondition }"
				class="paramInput"> <input type="hidden" name="searchKeyword"
				value="${userSearchKeyword }" class="paramInput"> <input
				type="hidden" name="searchKeyword" value="${driverSearchKeyword }"
				class="paramInput"> <input type="hidden" name="searchKeyword"
				value="${driverSearchKeyword }" class="paramInput">

			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="consumer-pane"
					role="tabpanel" aria-labelledby="consumer-tab">

					<!-- 일반회원 조회 tab -->

					<c:import url="/admin/usersCommon">
						<c:param name="searchCondition" value="${userSearchCondition }"></c:param>
						<c:param name="searchKeyword" value="${userSearchKeyword }"></c:param>
					</c:import>

					<!-- 일반회원 검색창 -->
					<div class="divSearch">
						<form name="frmSearch" method="post"
							action='<c:url value="/admin/users"/>'>
							<select name="userSearchCondition" id="userSearchCondition">
								<option value="name"
									<c:if test="${userSearchCondition=='name' }">
					            		selected="selected"
					            	</c:if>>이름</option>
								<option value="email"
									<c:if test="${userSearchCondition=='email' }">
					            		selected="selected"
					            	</c:if>>이메일</option>
								<option value="no"
									<c:if test="${userSearchCondition=='no' }">
					            		selected="selected"
					            	</c:if>>회원번호</option>
							</select> <input type="text" name="userSearchKeyword" title="검색어 입력"
								value="${userSearchKeyword}"> <input type="submit"
								value="검색">
						</form>
					</div>
					
					<div>
					<span>탈퇴회원보기</span>
					<input type ="checkbox" id ="getWithdraw" name ="getWithdraw">
					
					</div>



				</div>

				<div class="tab-pane fade" id="delivery-pane" role="tabpanel"
					aria-labelledby="delivery-tab">

					<!-- 배달기사 조회 tab -->
					<c:import url="/admin/usersDelivery">
						<c:param name="searchCondition" value="${driverSearchCondition }"></c:param>
						<c:param name="searchKeyword" value="${driverSearchKeyword }"></c:param>
					</c:import>

					<!-- 배달기사 검색창 -->
					<div class="divSearch">
						<form name="frmSearch" method="post"
							action='<c:url value="/admin/users"/>'>
							<select name="driverSearchCondition">
								<option value="name"
									<c:if test="${driverSearchCondition=='name' }">
					            		selected="selected"
					            	</c:if>>이름</option>
								<option value="email"
									<c:if test="${driverSearchCondition=='email' }">
					            		selected="selected"
					            	</c:if>>이메일</option>
								<option value="no"
									<c:if test="${driverSearchCondition=='no' }">
					            		selected="selected"
					            	</c:if>>기사번호</option>
							</select> <input type="text" name="driverSearchKeyword" title="검색어 입력"
								value="${driverSearchKeyword}"> <input type="submit"
								value="검색">
						</form>
					</div>


					<!-- 끝 -->
				</div>
				<div class="tab-pane fade" id="Branch-manager-pane" role="tabpanel"
					aria-labelledby="Branch-manager-tab">
					<!-- 시작 -->
					<div class="card mb-4">
						<div class="card-header">관리자 현황</div>
						<div class="card-body"
							style="width: 100%; height: 700px; overflow: auto">
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
										<th>관리자명</th>
										<th>이메일</th>
										<th>전화번호</th>
										<th>지점</th>
										<th>비고</th>
									</tr>
								</thead>
								<tbody id="managerTbody">

									<c:forEach var="map" items="${managerList }">
									<c:if test="${map['OUT_DATE'] == null  }">
									
										<tr>
											<!-- 관리자 리스트 반복 -->

											<td>${map['NO']}</td>
											<!-- users table no -->
											<td>${map['NAME']}</td>
											<!-- users table name -->
											<td>${map['EMAIL']}</td>
											<!-- users table email -->
											<td>${map['HP']}</td>
											<!-- users table hp -->
											<td>${map['OFFICE_NAME']}</td>
											<!-- users_class table class  -->
											<td><input type="button" value="삭제"
												onclick="deleteUser(${map['NO']})"></td>
										</tr>
										
									</c:if>
									</c:forEach>

									<!-- ajax table 행추가 -->

								</tbody>
							</table>



							<div class="modal-button">
								<!-- 관리자 추가 모달 -->


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
												<form name="adminAdd" id="adminAdd">
													<div class="adminName">
														<label for="name">관리자 이름</label> <input type="text"
															name="name" id="name" style="ime-mode: active">
													</div>
													<div class="adminEmail">
														<label for="email">이메일</label> <input type="text"
															name="email" id="email"> <input type="button"
															value="중복 확인" id="btnChkEmail">
													</div>
													<div class="adminPassword">
														<label for="password">비밀번호</label> <input type="password"
															name="pwd" id="pwd" placeholder="8자 이상의 문자,특수문자 포함">
													</div>
													<div class="adminPassword2">
														<label for="password2">비밀번호확인</label> <input
															type="password" name="pwd2" id="pwd2">
													</div>
													<div class="adminHp">
														<label for="hp">전화번호</label> <input type="text" name="hp"
															id="hp" maxlength="11" placeholder="-를 제외하고 입력해주세요">
													</div>
													<div class="office">
														<label for="office">지점</label> <select name="office"
															id="office">

															<!-- 지점 select -->
															<option value="" selected>선택</option>
															<c:forEach var="officeVo" items="${officeList }">
																<option value="${officeVo.no} ">${officeVo.officeName}</option>
															</c:forEach>
															<!-- 반복 끝 -->
														</select>
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
							</div>
						</div>
					</div>
					<input type="button" data-bs-toggle="modal"
						data-bs-target="#addAdmin" id="btMultiUpdate" value="관리자 추가">
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
