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
		$('#toSmsBtn').click(function(){
			var ctxPath="/launer";
			var hp=$('#hp').val();
			var randomCode=$('#randomCode').val();

			newPop=window.open(ctxPath+"/user/checkSms?hp="+hp+"&randomCode="+randomCode,"Hpcheck",
				"width=400,height=350,location=yes,resizable=yes,top=100,left=50");
			newPop.opener=opener;
		});
	})
</script>
</head>
<body>
	<h2>휴대전화 번호 중복 검사</h2>
	<form name="frmHp" method="post" 
		action="<c:url value='/user/checkHp'/>">
		<input type="text" name="hp" id="hp" 
			title="휴대전화 번호 입력" placeholder="-를 제외하고 입력해주세요" value="${param.hp}">
		<input type="submit"  id="submit" value="확인">
		<input type="hidden" name="randomCode" id="randomCode" value="${param.randomCode}">	
		<c:if test="${result==UNUSABLE_HP }">
			<p>이미 등록된 휴대전화 번호입니다. 다른 번호를 입력하세요</p>
		</c:if>	
		<c:if test="${result==USABLE_HP }">
			<input type="button" value="인증하기" id="toSmsBtn">
			<p>사용가능한 휴대전화 번호입니다. 문자 인증을 위해 [인증하기]버튼을 누르면 인증페이지로 넘어갑니다.</p>
		</c:if>
	</form>
</body>
</html>