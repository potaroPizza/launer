<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="../inc/top.jsp"%>
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
.mypoint_wrap {
	margin: 0 auto;
	width: 1200px;
}

.mypoint_top {
	width: 100%;
	height: 150px;
}

.mypoint_title {
	font-size: 23px;
	font-weight: bold;
	margin-bottom: 30px;
}

.mypoint_details {
	font-size: 23px;
	font-weight: bold;
	margin-bottom: 50px;
}

.mypoint_point {
	margin-left: 120px;
	margin-bottom: 150px;
	font-size: 20px;
}

.mypoint_point span {
	font-size: 20px;
	font-weight: bold;
}

.mypoint_table {
	width: 1200px;
	margin: 0 auto;
	margin-bottom: 50px;
	font-size: 20px;
}

.mypoint_notification {
	margin-bottom: 70px;
}

.mypoint_notification p {
	font-weight: bold;
}

.mypoint_notification li {
	color: gray;
}

.mypoint_back {
	text-align: center;
}

.mypoint_container1 {
	max-width: 1200px;
	margin-left: auto;
	margin-right: auto;
	padding-left: 10px;
	padding-right: 10px;
	margin-bottom: 70px;
}
.mypoint_table1 li {
	border-radius: 3px;
	padding: 25px 30px;
	display: flex;
	justify-content: space-between;
	margin-bottom: 25px;
}
.mypoint_table1-row {
	background-color: #ffffff;
	box-shadow: 0px 0px 9px 0px rgba(0, 0, 0, 0.1);
	font-size: 18px;
	font-weight: bold;
}
.mypoint_col1-1 {
	flex-basis: 50%;
	margin-left: 130px;
}

.mypoint_col1-2 {
	flex-basis: 50%;
}

.mypoint_container {
	max-width: 1200px;
	margin-left: auto;
	margin-right: auto;
	padding-left: 10px;
	padding-right: 10px;
	margin-bottom: 70px;
}

.mypoint_table li {
	border-radius: 3px;
	padding: 25px 30px;
	display: flex;
	justify-content: space-between;
	margin-bottom: 25px;
}

.mypoint_table-header {
	background-color: #045FB4;
	font-size: 17px;
	font-weight:bold;
	text-transform: uppercase;
	letter-spacing: 0.03em;
	color: white;
}

.mypoint_table-row {
	background-color: #ffffff;
	box-shadow: 0px 0px 9px 0px rgba(0, 0, 0, 0.1);
	font-size: 15px;
	font-weight: bold;
}

.mypoint_col-1 {
	flex-basis: 30%;
}

.mypoint_col-2 {
	flex-basis: 55%;
}

.mypoint_col-3 {
	flex-basis: 15%;
}
</style>
<body>

	<div class="mypoint_wrap">
		<div class="mypoint_top"></div>
		<div class="mypoint_title">
			<p>포인트</p>
		</div>
		<div class="mypoint_container1">
			<ul class="mypoint_table1">
				<li class="mypoint_table1-row">
					<div class="mypoint_col1-1">잔여 러너 포인트</div>
					<div class="mypoint_col1-2">5000p</div>
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

</body>