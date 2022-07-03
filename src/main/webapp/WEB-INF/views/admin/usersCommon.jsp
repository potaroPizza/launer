<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/layouts/admin"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(function(){
	
	
	
});
function pageFunc(curPage){
	//페이지 번호를 클릭했을 때 처리
	$('input[name=currentPage]').val(curPage);
	$('form[name=frmPage]').submit();
}

</script>
<!-- 시작 -->

<c:if test="${!empty param.searchKeyword }">
	<p>검색어 : ${param.searchKeyword}, ${pagingInfo.totalRecord} 건 검색되었습니다.</p>
</c:if>

<form action="<c:url value='/admin/usersCommon'/>" method="post"
	name="frmPage">
	<input type="text" name="searchKeyword" value="${param.searchKeyword }">
	<input type="text" name="searchCondition"
		value="${param.searchCondition }"> <input type="text"
		name="currentPage"> 
</form>


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
					<th>마지막접속일</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty list }">
					<tr>
						<td colspan="5" class="align_center">해당 글이 존재하지 않습니다.</td>
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
							<td><a href="#">수정 |</a><a href="#">삭제</a></td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<nav aria-label="...">
			<ul class="pagination">
				<c:if test="${pagingInfo.firstPage>1 }">
					<li class="page-item"><a class="page-link" href="#"
						onclick="pageFunc(${pagingInfo.firstPage-1})">Previous </a></li>
				</c:if>
				<!-- [1][2][3][4][5][6][7][8][9][10] -->
				<c:forEach var="i" begin="${pagingInfo.firstPage }"
					end="${pagingInfo.lastPage }">
					<c:if test="${i==pagingInfo.currentPage }">
						<li class="page-item disabled"><span class="page-link"
							style="color: white; background: blue; font-weight: bold">
								${i} </span></li>
					</c:if>
					<c:if test="${i!=pagingInfo.currentPage }">
						<li class="page-item"><a class="page-link" href="#"
							onclick="pageFunc(${i})">${i}</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
					<li class="page-item"><a class="page-link" href="#"
						onclick="pageFunc(${pagingInfo.lastPage+1})">Next </a></li>
				</c:if>
			</ul>
		</nav>

		<div class="divSearch">
			<form name="frmSearch" method="post"
				action='<c:url value="/admin/usersCommon"/>'>
				<select name="searchCondition">
					<option value="name"
						<c:if test="${param.searchCondition=='name' }">
            		selected="selected"
            	</c:if>>고객명</option>
					<option value="hp"
						<c:if test="${param.searchCondition=='hp' }">
            		selected="selected"
            	</c:if>>전화번호</option>
					<option value="email"
						<c:if test="${param.searchCondition=='email' }">
            		selected="selected"
            	</c:if>>이메일</option>
				</select> <input type="text" name="searchKeyword" title="검색어 입력"
					value="${param.searchKeyword}"> <input type="submit"
					value="검색">
			</form>
		</div>
	</div>
</div>

<!-- 끝 -->
</body>
</html>

