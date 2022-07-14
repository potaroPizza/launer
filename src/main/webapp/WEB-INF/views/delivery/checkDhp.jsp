<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴대전화 번호 중복 확인</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/user/check.css'/>"/>
<script type="text/javascript" src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$(document).ready(function() {
			$('#frmSms').css("display", "none");
		});
		$('#toSmsBtn').click(function(){
			$('#usableHp').val('${param.hp}');
			$('form[name=frmHp]').css("display", "none");
			$('#frmSms').css("display", "inline-block");
			$('#btUse').css("display", "none");
		});
		$('#submitCode').click(function(){
			$('#submitMsg').css("display", "none");
			
			if($('#certifyCode').val()!=""){
				if($('#certifyCode').val()==$('#randomCode').val()){
					$('#resultSms').text("인증이 완료되어 사용가능한 휴대전화 번호입니다. [사용하기]버튼을 클릭하세요.");
					$('#btUse').css("display", "block");
				}else if($('#certifyCode').val()!=$('#randomCode').val()){
					$('#resultSms').text("인증번호를 잘못 입력하였습니다. 다시 확인 후 입력하시기 바랍니다.");
				}
			}else{
				$('#resultSms').text("인증번호가 입력되지 않았습니다.");
			}
		});
		$('#btUse').click(function(){
			$(opener.document).find('#hp').val('${param.hp}');
			$(opener.document).find('#chkDhp').val('Y');
			
			self.close();
		});
	});
</script>
</head>
<body>
<div id="check_wrap">
	<div class="check_form">
		<div id="check_title">
			<h2>휴대전화 번호 중복 검사/인증</h2>
		</div>
		<form name="frmHp" method="post" action="<c:url value='/delivery/checkDhp'/>">
			<input type="text" name="hp" id="hp" 
				placeholder="- 제외하고 입력" value="${param.hp}">
			<input type="submit"  id="submit" value="중복 확인">
			<c:if test="${result==UNUSABLE_HP }">
				<p>이미 등록된 휴대전화 번호입니다. 다른 번호를 입력하세요</p>
			</c:if>	
			<c:if test="${result==USABLE_HP }">
				<input type="button" value="인증하기" id="toSmsBtn">
				<p>사용가능한 휴대전화 번호입니다. 인증번호가 전송되었으니 [인증하기]버튼을 누르시면 입력창이 나타납니다.</p>
			</c:if>
		</form>
		<div id="frmSms">
			<input type="hidden" name="usableHp" id="usableHp" readonly>
			<input type="hidden" name="randomCode" id="randomCode" value="${randomCode}" readonly>
			<input type="text" name="certifyCode" id="certifyCode">
			<input type="submit"  id="submitCode" value="인증번호 확인">
			<input type="button" value="사용하기" id="btUse">
			<p id="submitMsg">휴대전화로 전송된 인증번호를 입력해주시기 바랍니다.</p>
			<p id="resultSms"></p>
		</div>
	</div>
</div>
</body>
</html>