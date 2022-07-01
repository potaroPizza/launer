<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/layouts/admin" %>
<% pageContext.setAttribute("newLine", "\r\n"); %>

<t:head>
</t:head>
<t:wrapper>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript" src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">
	
</script>
<style type="text/css">

</style>

<main class="admin-index">
	<div class="container-fluid px-4">
		<h1 class="mt-4">러너보드</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item active">사내공지 게시판</li>
		</ol>
		<div class="card mb-4">
			<div class="card-header">
				<i class="nav-item-icon fa-solid fa-chalkboard">
				</i> 사내공지 전체조회
				
			</div>
			<div class="card-body">
				<table class="table table-striped" id="notices">
					<colgroup>
						<col style="width: 5%">
						<col style="width: 10%">
						<col style="width: 15%">
						<col style="width: 70%">
					</colgroup>
					<thead>
						<tr>
							<th><input type="checkbox" name="chkAll" id="chkAll"></th>
							<th>번호</th>
							<th>날짜</th>
							<th>제목/내용</th>
						</tr>
					</thead>
					<tbody>
					<c:if test="${empty list}">
						<tr>
							<td colspan="4">사내공지가 없습니다.</td>
						</tr>
					</c:if>
					<!-- 반복 시작 -->
					<c:if test="${!empty list}">
					<c:forEach var="vo" items="${list}">
						<tr>
							<td class="align-center" style="vertical-align : middle">
								<input type="checkbox" name=""
									value="">
							</td>
							<td class="align-center" style="vertical-align : middle">
								${vo.no}
							</td>
							<td class="align-center" style="vertical-align : middle">
								<fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd HH:mm"/>
							</td>
							<td>
								<span class="cont">
                             			-<span class="pt">${vo.title}</span>-<br><br>
									<span class="pc">${fn:replace(vo.content, newLine, "<br>")}</span>
								</span>
							</td>
						</tr>
					</c:forEach>
					</c:if>
					<!-- 반복 끝 -->
					</tbody>
				</table>
				<div class="bot" style="float: right;">
					<input type="button" value="체크된 게시물 삭제">
					&nbsp; 
					<select>
					<option value="1">5개씩 보기</option>
					  <option selected>10개씩 보기</option>
					  <option value="1">20개씩 보기</option>
					</select>
				</div>
			</div>		
		</div>
		<div class="bot" style="float: right;">
			<nav aria-label="...">
				 <ul class="pagination">
				 <li class="page-item disabled">
				 	<span class="page-link">Previous</span>
				 </li>
				 <li class="page-item"><a class="page-link" href="#">1</a></li>
				 <li class="page-item active" aria-current="page">
				 	<span class="page-link">2</span>
				 </li>
				 <li class="page-item"><a class="page-link" href="#">3</a></li>
				 <li class="page-item">
				 	<a class="page-link" href="#">Next</a>
				 </li>
				 </ul>
			</nav>
		</div>
	</div>
</main>

</t:wrapper>