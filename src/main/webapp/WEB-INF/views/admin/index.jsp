<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/layouts/admin" %>
<% pageContext.setAttribute("newLine", "\n"); %>

<t:head>
</t:head>
<t:wrapper>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript" src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('#insertBtn').click(function(){
			$.ajax({
				url: "<c:url value='/admin/insertNotice'/>",
				type: 'GET',
				data: {
					title: $('#title').val(),
					content: $('#content').val()
				},
				dataType: 'json',
				success: function(res){
					var title = res.title
					var content = res.content.replace(/\n/g,"<br>")
					var regdate = res.regdateStr
					var htmls = "";
					//alert(title);
					//alert(content);
				/*
					var info = "제목 : " + res.title + "<br>"
						+ "내용 : " + res.content + "<br>";
				$('#div1').html(info);
			
					var clone = $('#contentRow').clone();
					$('#div1').prepend(clone);
				*/
					htmls += '<div class="row" class="contentRow" style="padding: 10px;">';
					htmls += '	<div class="col-xl-2"></div>';
					htmls += '	<div class="col-xl-8" style="height: 200px; padding: 10px; border: 1px solid #333;">';
					htmls += '		<label for="exampleFormControlTextarea1" class="form-label">';
					htmls += regdate + '</label>';
					htmls += '<button type="button" class="btn-close" aria-label="Close" style="float: right"></button>';
					htmls += '<div class="card mb-4" >';
					htmls += '<div class="card-body" style="height: 130px">';
					htmls += '<span class="cont">';
					htmls += '-<span class="pt">'+ title +'</span>-<br><br>';
                    htmls += '<span class="pc">' + content + '</span>';
                    htmls += '</span>';
                    htmls += '</div>';
                    htmls += '</div>';
                    htmls += '</div>';
                    htmls += '</div>';
					$('#div1').prepend(htmls);
				},
				error: function(xhr, status, error){
					alert("error : " + error);
				}
			});
			
		});
	});

</script>

<main class="admin-index">
	<div class="container-fluid px-4">
		<h1 class="mt-4">러너보드</h1>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item active">사내공지 게시판</li>
		</ol>
		<div class="row" style="height: 230px;">

			<div class="col-xl-2"></div>
			<div class="col-xl-8" style="padding: 10px; border: 1px solid #333;">
				<div class="input-group" style="height: 200px;">
					<span class="input-group-text" style="width: 100%;">게시글 작성</span>
					<div class="input-group mb-3">
						<input type="text" class="form-control" placeholder="제목" id="title"
							aria-label="Username" aria-describedby="basic-addon1">	
					</div>
					<div class="input-group mb-3">
						<textarea class="form-control" placeholder="내용" id="content"
						aria-label="With textarea" rows="4"></textarea>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row"  style="padding: 10px;" id="btRow">
			<div class="col-xl-9"></div>
			<div class="col-xl-1">
				<button type="button" class="btn btn-primary" id="insertBtn"
					>등록</button>
			</div>
			<div class="col-xl-1">
			</div>
		</div>
		<br>
		<div id="div1"></div>
		<c:if test="${empty list}">
			<div class="row" class="contentRow" style="padding: 10px;">
			<div class="col-xl-2"></div>
			<div class="col-xl-8" style="height: 200px; padding: 10px; border: 1px solid #333;">
				사내공지가 없습니다.
			</div>
		</div>
		</c:if>
		<c:if test="${!empty list }">
		<!-- 러너보드 반복 시작 -->	
		<c:forEach var="vo" items="${list}">
		<div class="row" class="contentRow" style="padding: 10px;">
			<div class="col-xl-2"></div>
			<div class="col-xl-8" style="height: 200px; padding: 10px; border: 1px solid #333;">
				<label for="exampleFormControlTextarea1" class="form-label">
					<fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd HH:mm"/> </label>
				<button type="button" class="btn-close" aria-label="Close" style="float: right"></button>
				<div class="card mb-4" >
                       <div class="card-body" style="height: 130px">
                           <span class="cont">
                               -<span class="pt">${vo.title}</span>-<br><br>
							<span class="pc">${fn:replace(vo.content, newLine, "<br>")}</span>
						</span>
                   	</div>
                   </div>
			</div>
		</div>
		</c:forEach>
		</c:if>
		<!-- 러너보드 반복 끝 -->
		
		<div style="text-align: right;"><a href="<c:url value='/admin/noticeAll'/>">사내공지사항 더보기</a></div>
	</div>
</main>

</t:wrapper>