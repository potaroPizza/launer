<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/layouts/user"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<t:wrapper>
	<script type="text/javascript"
		src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
	<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"/>" />
	<script src="<c:url value="/js/bootstrap.min.js"/>"
		type="text/javascript"></script>


	<div id="signOut-wrap">
		<div class="signOut-top"></div>
		<div class="signOut-title">
			<p>LAUNER 회원 탈퇴가 완료 되었습니다.</p>
		</div>
		<div class="signOut_explain">
			<p>지금까지 저희 러너 서비스를 이용해주셔서 감사합니다.</p>
			<p>더욱 더 노력하고 발전하는 LAUNER가 되겠습니다.</p>

		</div>
		<div class="signOut_btn">
			<button type="button" class="btn btn-dark"
				onclick="location.href='/launer/'">메인으로 돌아가기</button>
		</div>

	</div>
</t:wrapper>



