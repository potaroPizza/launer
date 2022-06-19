<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/layouts/admin" %>
<% pageContext.setAttribute("newLine", "\r\n"); %>

<t:head>
</t:head>
<t:wrapper>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<main class="admin-index">
	<div class="container-fluid px-4">
		<h1 class="mt-4">러너보드</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item active">사내공지 게시판</li>
		</ol>
		<div class="row" style="height: 150px;">

			<div class="col-xl-2"></div>
			<div class="col-xl-8">
				<div class="input-group" style="height: 130px;">
					<span class="input-group-text">게시글 작성</span>
					<textarea class="form-control" aria-label="With textarea">게시글 작성</textarea>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-xl-9"></div>
			<div class="col-xl-1">
				<button type="button" class="btn btn-primary">등록</button>
			</div>
			<div class="col-xl-1">
			</div>
		</div>
		<br>
		
		<!-- 러너보드 반복 시작 -->	
		<c:forEach var="vo" items="${list}">
		<div class="row">
			<div class="col-xl-2"></div>
			<div class="col-xl-8" style="height: 200px;">
				<label for="exampleFormControlTextarea1" class="form-label">
					<fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd HH:mm"/> </label>
				<button type="button" class="btn-close" aria-label="Close" style="float: right"></button>
				<div class="card mb-4" >
                       <div class="card-body" style="height: 130px">
                           <span>
                               -${vo.title}-<br><br>
							${fn:replace(vo.content, newLine, "<br>")}
						</span>
                   	</div>
                   </div>
			</div>
		</div>
		</c:forEach>
		<!-- 러너보드 반복 끝 -->
		
		<div style="text-align: right;"><a href="<c:url value='/admin/noticeAll'/>">사내공지사항 더보기</a></div>
	</div>
</main>

</t:wrapper>