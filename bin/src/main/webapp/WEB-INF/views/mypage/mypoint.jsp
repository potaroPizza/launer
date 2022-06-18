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
.mypoint_top{
	width:100%;
	height:100px;
}
.mypoint_title {
	font-size: 25px;
	font-weight: bold;
	margin-bottom: 30px;
}

.mypoint_details {
	font-size: 25px;
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
	width: 1000px;
	margin: 0 auto;
	margin-bottom: 50px;
	font-size: 20px;
}

.mypoint_notification {
	margin-bottom: 50px;
}
.mypoint_notification li{
	color: gray;
}

.mypoint_back {
	text-align: center;
}
</style>
<body>

	<div class="mypoint_wrap">
		<div class="mypoint_top"></div>
		<div class="mypoint_title">
			<p>포인트</p>
		</div>
		<div class="mypoint_point">
			<p>
				잔여 러너 포인트 <span>5000p</span>
			</p>
		</div>
		<div class="mypoint_details">
			<p>포인트 이용내역</p>
		</div>
		<table class="mypoint_table">
			<thead>
				<tr>
					<th scope="col">구분</th>
					<th scope="col">일자</th>
					<th scope="col"></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">가입기념 지급</th>
					<td>22/01/01</td>
					<td>+999000p</td>
				</tr>
				<tr>
					<th scope="row">세탁서비스 이용</th>
					<td>22/01/03</td>
					<td>-2000p</td>
				</tr>
			</tbody>
		</table>

		<div class="mypoint_notification">
			<p>포인트 이용 유의사항</p>
			<ul>
				<li>포인트 사용시, 구매금액 제한 없이 결제 시 즉시 사용됩니다.</li>
				<li>회원 탈퇴시 보유하신 포인트 모두 소멸됩니다.</li>
			</ul>
		</div>
		<div class="mypoint_back">
		<button type="button" class="btn btn-dark" onclick="location.href='/launer/mypage/mypage'">이전</button>
		</div>
	</div>
</body>
</html>