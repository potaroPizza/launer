<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/layouts/user" %>

<t:wrapper>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<link rel="stylesheet" href="<c:url value="/css/user/findIdPwd.css"/>"/>

<div id="findIdPwd_wrap">
	<div class="findIdPwdsubWrap">
		<div class="titleArea">
			<h2>이메일 찾기</h2>
			<ul>
				<li>가입하신 방법에 따라 이메일 찾기가 가능합니다.</li>
	        	<li>본인 이름과 가입하실때 입력한 전화번호를 입력하시면 이메일주소를 알려드립니다.</li>
    		</ul>
		</div>
		<form name="findIdfrm" method="post" 
			action="<c:url value='/user/findId'/>">
				<div class="findIdPwdsubWrap">
					<div id="findIdPwdbox">
			            <p class="memberType"><strong>회원유형</strong>
			            	<select id="searchType" name="searchType">
								<option value="general" selected="selected">일반회원</option>
								<option value="driver">배송 기사 회원</option>
							</select>
						</p>
						<p id="name_view" style=""><strong id="name_lable">이름</strong>
							<input id="name" name="name" type="text">
						</p>
						<p id="mobile_view"><strong>휴대폰 번호</strong> 
							<input id="hp1" name="hp1" maxlength="3" type="text"> - 
							<input id="hp2" name="hp2" maxlength="4" type="text"> -
							<input id="hp3" name="hp3" maxlength="4" type="text">
						</p>
						<div class="findIdPwdBtnWrap">
                			<button class="findIdPwdBtn">확인</button>
            			</div>
					</div>
				</div>
		</form>
	</div>
</div>
</t:wrapper>