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
.detailedPaymentHistory_wrap {
	margin: 0 auto;
	width: 1200px;
}

.detailedPaymentHistory_top {
	height: 80px;
	width: 100%;
}

.detailedPaymentHistory_title {
	font-size: 35px;
	font-weight: bold;
	margin-bottom: 70px;
}

.detailedPaymentHistory_sub {
	font-size: 20px;
	font-weight: bold;
	color: gray;
	margin-bottom: 70px;
	line-height: 29px;
}

.detailedPaymentHistory_sub span {
	font-size: 18px;
	color: black;
}

.detailedPaymentHistory_list {
	border-top: 3px solid gray;
	border-bottom: 3px solid gray;
	width: 1200px;
	height: 200px;
	margin-bottom: 30px;
}

.detailedPaymentHistory_img {
	border: 1px solid;
	margin-top: 25px;
	width: 200px;
	height: 150px;
	margin-left: 40px;
	float: left;
}

.detailedPaymentHistory_detail1 {
	float: left;
	width: 300px;
	height: 150px;
	margin-left: 90px;
	font-size: 18px;
	font-weight: bold;
	color: gray;
}

.detailedPaymentHistory_detail2 {
	float: left;
	width: 300px;
	height: 150px;
	margin-left: 90px;
	font-size: 18px;
	font-weight: bold;
	color: gray;
}

.detailedPaymentHistory_detail1 p {
	margin-left: 30px;
	line-height: 103px;
}

.detailedPaymentHistory_detail1 span {
	color: black;
	font-size: 17px;
}

.detailedPaymentHistory_detail2 p {
	margin-left: 30px;
	line-height: 103px;
}

.detailedPaymentHistory_detail2 span {
	color: black;
	font-size: 17px;
}
.detailedPaymentHistory_back{
	text-align: center;
}
</style>

<body>
	<div class="detailedPaymentHistory_wrap">
		<div class="detailedPaymentHistory_top"></div>
		<div class="detailedPaymentHistory_title">
			<P>상세 주문내역</P>
		</div>
		<div class="detailedPaymentHistory_sub">
			<p>
				주문번호 &nbsp;&nbsp;&nbsp;&nbsp;<span>000001</span>
			</p>
			<p>
				주소 &nbsp;&nbsp;&nbsp;&nbsp;<span>신촌</span>
			</p>
			<p>
				주문일자 &nbsp;&nbsp;&nbsp;&nbsp;<span>2022/06/14</span>
			</p>
			<p>
				총 금액 &nbsp;&nbsp;&nbsp;&nbsp;<span>1500원</span>
			</p>
		</div>
		<div class="detailedPaymentHistory_list">
			<div class="detailedPaymentHistory_img"></div>
			<div class="detailedPaymentHistory_detail1">
				<p>
					상품명 &nbsp;&nbsp;&nbsp;&nbsp;<span>생활빨래</span>
				</p>
				<p>
					상품금액 &nbsp;&nbsp;&nbsp;&nbsp;<span>1500원</span>
				</p>
			</div>
			<div class="detailedPaymentHistory_detail2">
				<p>
					배송상태 &nbsp;&nbsp;&nbsp;&nbsp;<span>배송중</span>
				</p>
				<p>
					포인트 &nbsp;&nbsp;&nbsp;&nbsp;<span>500p</span>
				</p>

			</div>
		</div>
		<div class="detailedPaymentHistory_back">
			<button type="button" class="btn btn-dark"
				onclick="location.href='/launer/mypage/mypage'">이전</button>
		</div>
	</div>
</body>
</html>