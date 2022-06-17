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
.paymentDetails_wrap {
	margin: 0 auto;
	width: 1200px;
}

.paymentDetails_top {
	width: 100%;
	height: 100px;
}

.paymentDetails_title {
	width: 1000px;
	font-size: 30px;
	font-weight: bold;
	margin-bottom: 80px;
}

.paymentDetails_date {
	width: 1000px;
	margin: 0 auto;
	margin-bottom: 30px;
	font-size: 20px;
}

.table {
	width: 1000px;
	margin: 0 auto;
	margin-bottom: 20px;
	font-size: 20px;
}

.paymentDetails_amountPayment {
	text-align: right;
	margin-right: 100px;
	font-size: 20px;
}

.paymentDetails_amountPayment span {
	text-decoration: underline;
}

.paymentDetails_back {
	text-align: center;
}

.paymentDetails_date a:visited {
	color: black;
	text-decoration: none;
}

.paymentDetails_date a:link {
	color: black;
	text-decoration: none;
}
</style>
<body>

	<div class="paymentDetails_wrap">
		<div class="paymentDetails_top"></div>
		<div class="paymentDetails_title">
			<p>결제 내역</p>
		</div>
		<div class="paymentDetails_date">
			<div>
				<form name="frm1" method="post" action="<c:url value=''/>">
					<input type="button" value="3개월" class="btn btn-outline-dark">
					<input type="button" value="6개월" class="btn btn-outline-dark">
					<input type="button" value="9개월" class="btn btn-outline-dark">
				</form>
			</div>
		</div>
		<table class="table">
			<colgroup>
				<col style="width: 10%">
				<col style="width: 20%">
				<col style="width: 35%">
				<col style="width: 20%">
				<col style="width: 10%">

			</colgroup>
			<thead>
				<tr>
					<th scope="col">주문코드</th>
					<th scope="col">상품명</th>
					<th scope="col">가격</th>
					<th scope="col">주문일</th>
					<th scope="col">상태</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">00001</th>
					<td>티셔츠</td>
					<td>1000</td>
					<td>22/01/01</td>
					<td>배송중</td>
				</tr>
				<tr>
					<th scope="row">00002</th>
					<td>셔츠</td>
					<td>1000</td>
					<td>22/01/01</td>
					<td>배송중</td>
				</tr>
				<tr>
					<th scope="row">00002</th>
					<td>바지</td>
					<td>1000</td>
					<td>22/01/01</td>
					<td>배송중</td>
				</tr>
			</tbody>
		</table>

		<div class="paymentDetails_amountPayment">
			<p>
				총 결제 금액 <span>1500</span>원
			</p>
		</div>
		<div class="paymentDetails_back">
			<button type="button" class="btn btn-dark"
				onclick="location.href='/launer/mypage/mypage'">이전</button>
		</div>
	</div>
</body>
