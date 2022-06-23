<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/layouts/admin" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:head>
</t:head>
<t:wrapper>
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
		//var countPerPage = 10;
		
		// 검색테이블의 달력 유효성 검사
		$("#od_submit").click(function(){
			if($("#startDay").val().length<1){
				alert("주문 시작일을 입력하세요");
				$("#startDay").focus();
				return false;
			}
			if($("#endDay").val().length<1){
				alert("주문 종료일을 입력하세요");
				$("#endDay").focus();
				return false;
			}
		});
		
		/*
		if($('input[name=countPerPage]').val() == ''){
			$('input[name=countPerPage]').val(countPerPage);
		}
		*/
		
		$('#selectCountPerPage').on("change", function(){
			$('input[name=countPerPage]').val($(this).val());
		});
		
		// 달력관련 시작		
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
		
		$("#btnToday").click(function(){
			$.setDate();	//오늘
		});
		
		$("#btnWeek").click(function(){
			$.setDate(7, 'D');	//1주일전
		});
		
		$("#btnMonth1").click(function(){
			$.setDate(1, 'M');	//1개월전
		});
		// 달력관련 끝
		
	});	//ready
	
	// 달력관련 시작
	/*
	$.setToday = function(){	
		if($("#startDay").val()==null || $("#startDay").val()==""){
			var today = new Date();
			var curDate = findDate(today);
			$("#startDay").val(curDate);
			$("#endDay").val(curDate);
		}
	}
	*/
	
	$.setDate= function(term, type){	// jquery함수 표현식
		//endDay 기준으로 7일을 빼거나 1개월이나 3개월을 빼서 startDay에 셋팅
		// var d = new Date(년, 월, 일);	=> 날짜 데이터 객체 생성
		var str = $("#endDay").val().split("-"); // 2022-06-30 => 2022,06,30
		var d = new Date(str[0], str[1]-1, str[2]);	// 2022,5,30
		//=> 월은 0~11이라, -1 해줘야함
		
		if(type=="D") {
			d.setDate(d.getDate()-term); //7일전
		} else if(type=="M") {
			d.setMonth(d.getMonth()-term); //1개월, 3개월전
		}
			$("#startDay").val($.findDate(d));
	}
	
	$.findDate = function(date) {	// jquery함수 표현식
		return date.getFullYear() + "-" + formatDate(date.getMonth()+1)
			+ "-" + formatDate(date.getDate());
	}
	
	function formatDate(date) {		// 순수 js함수 선언식
		var day = date;
		if(date < 10) {
			day = "0" + day;
		}
		return day;
	}
	// 달력관련 끝
	
	//페이지 번호를 클릭했을때
	function pageFunc(curPage){
		//페이지 번호를 클릭했을 때 처리
		$('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();
	}
</script>
<!-- 페이징 처리를 위한 form 시작-->
<form name="frmPage" method="post"
	action="<c:url value='/admin/orders'/>">
	<input type="text" class="startDay" name="startDay" value="${orderSearchVO.startDay}">
	<input type="text" class="endDay" name="endDay" value="${orderSearchVO.endDay}">
	<input type="text" class="officeName" name="officeName" value="${orderSearchVO.officeName}">
	<input type="text" class="orderStatus" name="orderStatus" value="${orderSearchVO.orderStatus}">
	<input type="text" class="userEmail" name="userEmail" value="${orderSearchVO.userEmail}">
	<input type="text" class="currentPage" name="currentPage">	
	<input type="text" class="countPerPage" name="countPerPage" value="${orderSearchVO.countPerPage}">
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
								<option value="1"
									<c:if test="${orderSearchVO.officeNo==1}">
	           							selected
	           						</c:if>
								>영등포점</option>
								<option value="2"
							  		<c:if test="${orderSearchVO.officeNo==2}">
	           							selected
	           						</c:if>
								>마포점</option>
								<option value="3"
									<c:if test="${orderSearchVO.officeNo==3}">
	           							selected
	           						</c:if>
								>구로점</option>
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
						<!-- 주문리스트 반복 시작 -->
						<c:forEach var="map" items="${list}">
							<tr>
								<td>
									<input type="checkbox" name=""
										value="">
								</td>
								<td>${map['ORDERNO']}</td>
								<td>${map['USEREMAIL']}</td>
								<td>${map['OFFICENAME']}</td>
								<td>${map['ORDERSTATUS']}</td>
								<td>${map['REGDATE']}</td>
								<td><a href="#">상세보기</a></td>
							</tr>
						</c:forEach>
						<!-- 주문리스트 반복 끝 -->
						</c:if>
						</tbody>
					</table>
					<input type="button" value="픽업대기 처리">
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
				</div>
			</div>
			<nav aria-label="...">
				<ul class="pagination">
				<c:if test="${pagingInfo.firstPage>1 }">
					<li class="page-item">Previous
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
			<div class="divPage">
				<!-- 페이지 번호 추가 -->
				<c:if test="${pagingInfo.firstPage>1 }">
					<a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})"> <img
						src='<c:url value="/images/first.JPG" />' border="0">
					</a>
				</c:if>

				<!-- [1][2][3][4][5][6][7][8][9][10] -->
				<c:forEach var="i" begin="${pagingInfo.firstPage }"
					end="${pagingInfo.lastPage }">
					<c:if test="${i==pagingInfo.currentPage }">
						<span style="color: blue; font-weight: bold">${i }</span>
					</c:if>
					<c:if test="${i!=pagingInfo.currentPage }">
						<a href="#" onclick="pageFunc(${i})"> [${i }] </a>
					</c:if>
				</c:forEach>

				<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
					<a href="#" onclick="pageFunc(${pagingInfo.lastPage+1})"> <img
						src="<c:url value="/images/last.JPG" />" border="0">
					</a>
				</c:if>
				<!--  페이지 번호 끝 -->
			</div>
		</div>
	</main>

</t:wrapper>