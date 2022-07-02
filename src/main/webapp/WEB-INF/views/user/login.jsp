<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/layouts/user"%>

<t:wrapper>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<link rel="stylesheet" href="<c:url value="/css/user/login.css"/>"/>
	
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script src="<c:url value="/js/login_kakao.js"/>" type="text/javascript" text="javascript"></script>
<script src="<c:url value="/js/login-naver.js"/>" type="text/javascript" text="javascript"></script>
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
		<form name="frmLogin" method="post" action="<c:url value=''/>">
				<fieldset>
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
											<input id="member_email" name="email" 
												placeholder="이메일" type="text"
												value="${cookie.chkUseremail.value }">
											<input id="member_pwd" name="pwd" 
												placeholder="비밀번호" type="text">
										</div>
										<div class="loginCheckBox">
											<input type="checkbox" name="saveUseremail" id="saveEmail"
												<c:if test="${!empty cookie.chkUseremail }">
													checked="checked"
												</c:if>
											>
											<label for="saveEmail">이메일 저장</label>
										</div>
										<input type="submit" class="login_btn" value="기존 회원 로그인">
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
											<li id="naver_id_login" class="btn_naver">
												<a href="https://nid.naver.com/oauth2.0/authorize?
													response_type=code&
													client_id=sA1wXjzUVJ_q15yX5Z3k&
													redirect_uri=http://localhost:9095/launer/user/login/naver/auth&
													state=STATE_STRING">네이버로 로그인</a>
											</li>
											<%--<li id="naver_id_login2" class="btn_naver">
												<a href="https://nid.naver.com/oauth2.0/token?
												grant_type=delete&
												client_id=sA1wXjzUVJ_q15yX5Z3k&
												client_secret=LzHF30VRtz&
												access_token=AAAAOYRctodcmpdIdNo0mzZt8tW8KL3ZhDjiCZbDXT8GqkZ5MIoaiV6yWDfIo0idQd6z12ELOl8FxL5l24DJd2IDhsw">테스트</a>
											</li>--%>
											<li class="btn_kakao">
												<a href="https://kauth.kakao.com/oauth/authorize?
											client_id=17794c6c3763c9ee2f66e9d03e0b9c5b
											&redirect_uri=http://localhost:9095/launer/user/kakaoLogin/requestToken
											&response_type=code">카카오로 로그인</a>
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
											<input id="member_email" name="member_email" 
												placeholder="이메일" type="text">
											<input id="member_pwd" name="member_pwd" 
												placeholder="비밀번호" type="text">
										</div>
										<div class="loginCheckBox">
											<input type="checkbox" name="saveEmail" id="saveEmail"
												<c:if test="${!empty cookie.ckUseremail }">
													checked="checked"
												</c:if>
											>
											<label for="saveEmail">이메일 저장</label>
										</div>
										<button class="login_btn">러너 크루 로그인</button>
										<div class="login_findmenu" style="display:block">
											<a href="/launer/user/findId">이메일 찾기</a>
											<a href="/launer/user/findPwd">비밀번호 찾기</a>
											<a href="/launer/delivery/join" class="right" 
												style="display:">러너 크루 가입하기</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
</t:wrapper>