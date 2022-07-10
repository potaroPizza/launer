<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인증번호 확인</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/user/join.css'/>"/>
<script type="text/javascript" src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('#btUse').click(function(){
			$(opener.document).find('#hp').val('${param.hp}');
			$(opener.document).find('#randomCode').val('${param.randomCode}');
			$opener.opener.form1.elements["#chkHp"].value='Y';
			
			window.close();
			opener.window.close();
		});
	})
</script>
</head>
<body>
	<h2>인증번호 입력</h2>
	<form name="frmSms" method="post" 
		action="<c:url value='/user/checkSms'/>">
		<p id="hp">${param.hp}번호로 전송된 인증번호를 입력해 주시기 바랍니다.</p><br>
		<input type="text" name="certifyCode" id="certifyCode" title="인증번호 입력" value="">
		<input type="submit"  id="submit" value="확인">
		<input type="hidden" name="randomCode" id="randomCode" value="${param.randomCode}">
		<c:if test="${result==3 }">
			<p>인증번호가 입력되지 않았습니다.</p>
		</c:if>	
		<c:if test="${result==2 }">
			<p>인증번호를 잘못 입력하였습니다. 다시 확인 후 입력하시기 바랍니다.</p>
		</c:if>
		<c:if test="${result==1 }">
			<input type="button" value="사용하기" id="btUse">
			<p>인증이 완료되어 사용가능한 휴대전화 번호입니다. [사용하기]버튼을 클릭하세요</p>
		</c:if>
	</form>
</body>
</html>