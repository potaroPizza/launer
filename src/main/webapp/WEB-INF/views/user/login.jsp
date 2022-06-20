<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>러너 로그인</title>
<link rel="stylesheet" href="<c:url value="/css/user/login.css"/>" />
<script src="<c:url value="/js/jquery-3.6.0.min.js"/>"></script>
<script src="<c:url value="/js/login.js"/>" type="text/javascript" text="javascript"></script>
</head>
<body>
<div id="loginWrap">
	<div class="syncWrap">
		<div id="header">
			<div class="backBtn" 
			onclick="history.go(-1);return false;">
			 뒤로가기
			</div>
			<h1 class="siteName">
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
					<div id="loginBody">
						<h2 class="title">로그인</h2>
						<p class="loginIntro">
						러너에 접속하셔서 간편한 세탁생활을 즐겨보세요!
						</p>
						<div id="memberLogin" class="contents">
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
							<button class="btn loginBtn">기존 회원 로그인</button>
							<div class="findMenu" style="display:block">
								<a href="/launer/user/findId">이메일 찾기</a>
								<a href="/launer/user/findPwd">비밀번호 찾기</a>
								<a href="/launer/user/join" class="right" 
									style="display:">가입하기</a>
							</div>
						</div>
						<div class="login_Or">또는</div>
						<div id="snsLogin" class="contents">
							<ul class="snsLoginBox">
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
					<div id="loginBody">
						<h2 class="title">기사님 로그인</h2>
						<p class="loginIntro">
						러너 크루가 되어 신개념 세탁서비스의 일원이 되어주세요!
						</p>
						<div id="memberLogin" class="contents">
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
							<button class="btn loginBtn">러너 크루 로그인</button>
							<div class="findMenu" style="display:block">
								<a href="/launer/member/findMail">이메일 찾기</a>
								<a href="/launer/member/findPwd">비밀번호 찾기</a>
								<a href="/launer/member/join" class="right" 
									style="display:">러너 크루 가입하기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
   
</body>
</html>