<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴대전화 번호 중복 확인</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/user/join.css'/>"/>

<script type="text/javascript" src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('#btUse').click(function(){
			$(opener.document).find('#hp').val('${param.hp}');
			$(opener.document).find('#chkHp').val('Y');
			
			self.close();
		});
	})
</script>
</head>
<body>
	<h2>휴대전화 번호 중복 검사</h2>
	<form name="frmEmail" method="post" 
		action="<c:url value='/user/checkHp'/>">
		<input type="text" name="hp" id="hp" 
			title="휴대전화 번호 입력" placeholder="-를 제외하고 입력해주세요" value="${param.hp}">
		<input type="submit"  id="submit" value="확인">
		
		<c:if test="${result==UNUSABLE_HP }">
			<p>이미 등록된 휴대전화 번호입니다. 다른 번호를 입력하세요</p>
		</c:if>	
		
		<c:if test="${result==USABLE_HP }">
			<input type="button" value="사용하기" id="btUse">
			<p>사용가능한 휴대전화 번호입니다. [사용하기]버튼을 클릭하세요</p>
		</c:if>
	</form>
</body>
</html>