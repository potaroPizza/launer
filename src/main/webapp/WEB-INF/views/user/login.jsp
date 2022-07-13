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
<%--<script src="<c:url value="/js/login.js"/>" type="text/javascript" text="javascript"></script>--%>
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
		<script type="text/javascript">
			$(function () {
				//로그인 탭
				$("#memberBtn").click((e) => {
					e.preventDefault();
					$("#memberBtn").addClass('on');
					$('#driverBtn').removeClass('on');
					$("#loginDriver").removeClass('on');
					$("#loginGeneralMember").addClass('on');

					$("form[name=frmLogin]").attr("action", "<c:url value='/user/login'/>");
				});

				$("#driverBtn").click((e) => {
					e.preventDefault();
					$("#driverBtn").addClass('on');
					$("#memberBtn").removeClass('on');
					$("#loginGeneralMember").removeClass('on');
					$("#loginDriver").addClass('on');

					$("form[name=frmLogin]").attr("action", "<c:url value='/driver/login'/>");
				});
			});
		</script>
		<form name="frmLogin" method="post" action="<c:url value='/user/login'/>">
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
												placeholder="비밀번호" type="password">
										</div>
										<div class="loginCheckBox">
											<input type="checkbox" name="saveUseremail" id="saveEmail"
												<c:if test="${!empty cookie.chkUseremail }">
													checked="checked"
												</c:if>
											>
											<label for="saveUserEmail">이메일 저장</label>
										</div>
										<input type="submit" class="login_btn" id="userLogintBtn"
											value="기존 회원 로그인" <%--formaction="<c:url value='/user/login'/>"--%>>
										<div class="login_findmenu" style="display:block">
											<a href="/launer/user/findId">이메일 찾기</a>
											<a href="/launer/user/findPwd">비밀번호 찾기</a>
											<a href="/launer/user/join" class="right">가입하기</a>
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
									<p>러너 크루가 되어 신개념 세탁서비스의 일원이 되어주세요!</p>
									<div id="memberLogin" class="login_contents">
										<div class="inputIdPwd">
											<input id="member_email" name="dmail" 
												placeholder="이메일" type="text"
												value="${cookie.chkDmail.value }">
											<input id="member_pwd" name="dPwd" 
												placeholder="비밀번호" type="password">
										</div>
										<div class="loginCheckBox">
											<input type="checkbox" name="saveDmail" id="saveEmail"
												<c:if test="${!empty cookie.chkDmail }">
													checked="checked"
												</c:if>
											>
											<label for="saveDmail">이메일 저장</label>
										</div>
										<input type="submit" class="login_btn" id="driverLoginBtn"
											value="러너 크루 로그인" <%--formaction="<c:url value='/driver/login'/>"--%>>
										<div class="login_findmenu" style="display:block">
											<a href="/launer/user/findId">이메일 찾기</a>
											<a href="/launer/user/findPwd">비밀번호 찾기</a>
											<a href="/launer/delivery/join" class="right" >러너 크루 가입하기</a>
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