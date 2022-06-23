<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/layouts/user" %>

<t:wrapper>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<link rel="stylesheet" href="<c:url value="/css/user/login.css"/>"/>
	
<script src="<c:url value="/js/login.js"/>" type="text/javascript" text="javascript"></script>
<div id="login_wrap">
	<div class="login_subwrap">
		<div id="login_header">
			<div class="login_backBtn" 
				onclick="history.go(-1);return false;">뒤로가기
			</div>
			<h1 class="login_siteName">
				<a href="/launer">LAUNER</a>
			</h1>
		</div>
		<div class="loginTab">
			<ul class="loginTabnav">
				<li><a href ="#loginGeneralMember" class="on" id="memberBtn">일반 회원</a></li>
				<li><a href ="#loginDriver" id="driverBtn">러너 크루</a></li>
			</ul>
			<div class="loginTabcontent">
				<div id="loginGeneralMember" class="on">
					<div id="login_body">
						<h2 >로그인</h2>
						<p>러너에 접속하셔서 간편한 세탁생활을 즐겨보세요!</p>
						<div id="memberLogin" class="login_contents">
							<div class="inputIdPwd">
								<input id="member_id" name="member_id" 
									placeholder="이메일" value="" type="text">
								<input id="member_pwd" name="member_pwd" 
									placeholder="비밀번호" value="" type="text">
							</div>
							<div class="loginCheckBox">
								<input id="saveEmail" name="saveEmail" value="T" type="checkbox">
								<label for="saveEmail">이메일 저장</label>
							</div>
							<button class="login_btn">기존 회원 로그인</button>
							<div class="login_findmenu" style="display:block">
								<a href="/launer/user/findId">이메일 찾기</a>
								<a href="/launer/user/findPwd">비밀번호 찾기</a>
								<a href="/launer/user/join" class="right" 
									style="display:">가입하기</a>
							</div>
						</div>
						<div class="login_Or">또는</div>
						<div id="snslogin">
							<ul class="snsloginbox">
								<li class="btn_naver">
									<a>네이버로 로그인</a>
								</li>
								<li class="btn_kakao">
									<a>카카오로 로그인</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div id="loginDriver">
					<div id="login_body">
						<h2 class="login_title">기사님 로그인</h2>
						<p class="login_intro">
						러너 크루가 되어 신개념 세탁서비스의 일원이 되어주세요!
						</p>
						<div id="memberLogin" class="login_contents">
							<div class="inputIdPwd">
								<input id="member_id" name="member_id" 
									placeholder="이메일" value="" type="text">
								<input id="member_pwd" name="member_pwd" 
									placeholder="비밀번호" value="" type="text">
							</div>
							<div class="loginCheckBox">
								<input id="saveEmail" name="saveEmail" value="T" type="checkbox">
								<label for="saveEmail">이메일 저장</label>
							</div>
							<button class="login_btn">러너 크루 로그인</button>
							<div class="login_findmenu" style="display:block">
								<a href="/launer/user/findMail">이메일 찾기</a>
								<a href="/launer/user/findPwd">비밀번호 찾기</a>
								<a href="/launer/user/join" class="right" 
									style="display:">러너 크루 가입하기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</t:wrapper>