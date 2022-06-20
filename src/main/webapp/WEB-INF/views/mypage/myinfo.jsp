<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/layouts/user"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core"%>

<t:wrapper>
<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"/>"/>
<script src="<c:url value="/js/bootstrap.min.js"/>" type="text/javascript" text="javascript"></script>
	<style>

</style>
	<div id="myinfo_wrap">
		<div class="myinfo_top"></div>
		<div class="myinfo_title_wrap">
			<div class="myinfo_title">
				<p>기본 정보</p>
			</div>
			<div class="myinfo_editbtn">
				<a href="/launer/mypage/useredit">
					<button type="button" class="btn btn-dark">정보 수정</button>
				</a>
			</div>
		</div>
		<div class="myinfo_detail">
			<p>
				이메일 &nbsp;&nbsp;&nbsp;&nbsp;<span>launer@naver.com</span>
			</p>
			<p>
				이름 &nbsp;&nbsp;&nbsp;&nbsp;<span>김러너</span>
			</p>
			<p>
				전화번호 &nbsp;&nbsp;&nbsp;&nbsp;<span>010-1234-5678</span>
			</p>
		</div>
		<div class="myinfo_space"></div>
		<div class="myinfo_delivery">
			<p>배송 정보</p>
		</div>

		<div class="myinfo_detail">
			<p>
				배송지&nbsp;&nbsp;&nbsp;&nbsp;<span>서울특별시 서대문구 라멘집</span>
			</p>
			<p>
				공동현관 출입방법&nbsp;&nbsp;&nbsp;&nbsp;<span>자유 출입가능 & 공동현관 없음</span>
			</p>

		</div>
		<div class="myinfo_withdrawbtn">
			<button type="button" class="btn btn-dark"
				onclick="location.href='/launer/mypage/mypage'">이전</button>
			<button type="button" class="btn btn-dark"
				onclick="location.href='/launer/mypage/withdraw'">회원 탈퇴</button>
		</div>
	</div>
</t:wrapper>