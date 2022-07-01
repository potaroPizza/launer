<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 중복 확인</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/user/join.css'/>"/>

<script type="text/javascript" src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('#btUse').click(function(){
			$(opener.document).find('#email').val('${param.email}');
			$(opener.document).find('#chkEmail').val('Y');
			
			self.close();
		});
	})
</script>
</head>
<body>
	<h2>이메일 중복 검사</h2>
	<form name="frmEmail" method="post" 
		action="<c:url value='/user/checkEmail'/>">
		<input type="text" name="email" id="email" 
			title="이메일 입력" value="${param.email}">
		<input type="submit"  id="submit" value="이메일 확인">
		
		<c:if test="${result==UNUSABLE_EMAIL }">
			<p>이미 등록된 이메일 주소입니다. 다른 이메일 주소를 입력하세요</p>
		</c:if>	
		
		<c:if test="${result==USABLE_EMAIL }">
			<input type="button" value="사용하기" id="btUse">
			<p>사용가능한 이메일 주소입니다. [사용하기]버튼을 클릭하세요</p>
		</c:if>
	</form>
</body>
</html>