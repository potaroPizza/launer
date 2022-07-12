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
	$(document).ready(function() {
		$(".officelist li").click(function(){
			$(".officelist li").removeClass("on");
			$(this).addClass("on");
			
			
		});
	});
	
	$("#officeBtn").click(function(){
		$modal.css("display", "flex").animate({
			opacity: 1
		}, 300);	
	});
	
	$("#confirm").click(function(){
    	modalClose();
	});
	$("#close").click(function(){
    	modalClose();
	});
	$(window).on('click', function() {
		modalClose();
	});
	
	function modalClose(){
		$modal.animate({
			opacity: 0
		}, 300, function() {
			$modal.css("display", "none");
		});

	};
	
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
				<div class="officelist">
					<ul>
						<c:forEach var="list" items="${list}">
							<li><a data-value="${list.no}">${list.officeName}</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
		<div class="modal-foot">
			<span id="confirmBtn" id="confirm">확인</span>
		</div>
	</div>
</div>
</body>
</html>