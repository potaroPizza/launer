<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지점선택 모달</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/officeModal.css'/>"/>
<script type="text/javascript" src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">
$(function(){
	const $modal = $("#modal-wrap");
	$(document).ready(function() {
		$.ajax({
			url: "<c:url value='/inc/officeModal'/>",
			type:"get",
			data: list=${list},
			success:function(res) => {
				console.log(res);
				$("#list").text(res);
			},
			error : (xhr, status, error) => alert("error : " + error)
		});
		return false;
	});
	
	function modalClose(){
		$modal.animate({
			opacity: 0
		}, 300, function() {
			$modal.css("display", "none");
		});
	}
	
	$("#confirm").click(function(){
    	modalClose();
	});
	$("#close").click(function(){
    	modalClose();
	});
	$(window).on('click', function() {
		modalClose();
	});
});
</script>
</head>
<body>
<div id="modal-wrap">
	<div class="office-modal">
		<div class="modalhead">
		    <h2 class="head-title">Launer</h2>
		</div>
		<div class="modal-body">
			<div class="body-content">
				<div class="body-titlebox">
				<span class="body-title">지점 선택</span>
				</div>
				<div class="body-contentbox">
					<c:forEach var="list" items="${list}">
						<a id="list">${list.officeName}</a>
					</c:forEach>
				</div>
			</div>
		</div>
		<div class="modal-foot">
		<span class="modal-btn confirm" id="confirm">확인</span>
		<span class="modal-btn close" id="close">창 닫기</span>
		</div>
	</div>
</div>
</body>
</html>