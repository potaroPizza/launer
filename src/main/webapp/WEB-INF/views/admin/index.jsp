<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>
<style type="text/css">
.sb-sidenav-footer {
	position: absolute;
	bottom: 0;
	width: 225px;
}

.launerBoard {
	border: solid 1px #333;
	height: 200px;
}

.form-control {
	resize: none;
}
</style>
<div id="layoutSidenav_content">
	<main>
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
                                -${vo.title}-<br>
                                <% pageContext.setAttribute("newLine", "\r\n"); %>
								${fn:replace(vo.content, newLine, "<br>")}
							</span>
                    	</div>
                    </div>
				</div>
			</div>
			</c:forEach>
			<!-- 러너보드 반복 끝 -->
			
			<div class="row">
				<div class="col-xl-2"></div>
				<div class="col-xl-8" style="height: 200px;">
					<label for="exampleFormControlTextarea1" class="form-label">
						2022-06-14 09:02</label>
					<button type="button" class="btn-close" aria-label="Close" style="float: right"></button>
					<div class="card mb-4" >
                        <div class="card-body" style="height: 130px">
                            <span>
                                -오늘의 공지-<br>
								좋은하루 되세요~
							</span>
                    	</div>
                    </div>
				</div>
			</div>
			<div class="row">
				<div class="col-xl-2"></div>
				<div class="col-xl-8" style="height: 200px;">
					<label for="exampleFormControlTextarea1" class="form-label">
						2022-06-13 09:05</label>
					<button type="button" class="btn-close" aria-label="Close" style="float: right"></button>
					<div class="card mb-4" >
                        <div class="card-body" style="height: 130px">
                            <span>
                                -오늘의 공지-<br>
								월요일입니다.<br>
								특이사항 있을시 바로 연락바랍니다.
							</span>
                    	</div>
                    </div>
				</div>
			</div>
			
			
		</div>
	</main>

	<%@ include file="bottom.jsp"%>