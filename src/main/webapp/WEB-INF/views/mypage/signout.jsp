<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/layouts/user" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<t:wrapper>
<script type="text/javascript" 
	src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<style>

</style>


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
		<button type="button" class="btn btn-dark" onclick="location.href='/launer/'">메인으로 돌아가기</button>
	</div>
	
</div>
</t:wrapper>



