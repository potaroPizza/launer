<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/layouts/user" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<style>

</style>
<t:wrapper>
	<div id="mypoint_wrap">
		<div class="mypoint_top"></div>
		<div class="mypoint_title">
			<p>포인트</p>
		</div>
		<div class="mypoint_container1">
			<ul class="mypoint_table1">
				<li class="mypoint_table1-row">
					<div class="mypoint_col1-1">${vo.name}님의 포인트</div>
					<div class="mypoint_col1-2">${vo.point}p</div>
				</li>
			</ul>
		</div>

		<div class="mypoint_details">
			<p>포인트 이용내역</p>
		</div>
		<div class="mypoint_container">
			<ul class="mypoint_table">
				<li class="mypoint_table-header">
					<div class="mypoint_col-1">날짜</div>
					<div class="mypoint_col-2">내역</div>
					<div class="mypoint_col-3">포인트</div>
				</li>
				<li class="mypoint_table-row">
					<div class="mypoint_col-1" data-label="날짜">2022-06-19</div>
					<div class="mypoint_col-2" data-label="내역">러너 가입기념 이벤트 지급</div>
					<div class="mypoint_col-3" data-label="포인트">+3050p</div>
				</li>
				<li class="mypoint_table-row">
					<div class="mypoint_col-1" data-label="날짜">2022-06-20</div>
					<div class="mypoint_col-2" data-label="내역">포인트 사용</div>
					<div class="mypoint_col-3" data-label="포인트">-350p</div>
				</li>
				<li class="mypoint_table-row">
					<div class="mypoint_col-1" data-label="날짜">2022-06-21</div>
					<div class="mypoint_col-2" data-label="내역">포인트 적립</div>
					<div class="mypoint_col-3" data-label="포인트">+1350p</div>
				</li>
			</ul>
		</div>

		<div class="mypoint_notification">
			<p>포인트 이용 유의사항</p>
			<ul>
				<li>포인트 사용시, 구매금액 제한 없이 결제 시 즉시 사용됩니다.</li>
				<li>회원 탈퇴시 보유하신 포인트 모두 소멸됩니다.</li>
			</ul>
		</div>
		<div class="mypoint_back">
			<button type="button" class="btn btn-dark"
				onclick="location.href='/launer/mypage/mypage'">이전</button>
		</div>
	</div>
</t:wrapper>