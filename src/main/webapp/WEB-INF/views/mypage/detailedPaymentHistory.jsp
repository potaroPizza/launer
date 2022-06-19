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
	height: 100px;
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
	margin-bottom: 30px;
	line-height: 29px;
}

.detailedPaymentHistory_sub span {
	font-size: 18px;
	color: black;
}

.detailedPaymentHistory_back {
	text-align: center;
}

.detailedPaymentHistory-section {
	padding: 2em 0;
}

.detailedPaymentHistory-no-pt {
	padding-top: 0;
}

.detailedPaymentHistory-no-pb {
	padding-bottom: 0;
}

.detailedPaymentHistory-img {
	background-size: cover;
	background-repeat: no-repeat;
	background-position: center center;
}

.detailedPaymentHistory-table-wrap {
	overflow-x: scroll;
}

.detailedPaymentHistory-table {
	min-width: 1000px !important;
	width: 100%;
	background: #fff;
	-webkit-box-shadow: 0px 5px 12px -12px rgba(0, 0, 0, 0.29);
	-moz-box-shadow: 0px 5px 12px -12px rgba(0, 0, 0, 0.29);
	box-shadow: 0px 5px 12px -12px rgba(0, 0, 0, 0.29);
}

.detailedPaymentHistory-table thead.thead-primary {
	background: #045FB4;
}

.detailedPaymentHistory-table thead th {
	border: none;
	padding: 30px;
	font-size: 15px;
	font-weight: 500;
	color: white;
}

.detailedPaymentHistory-table tbody tr {
	margin-bottom: 10px;
}

.detailedPaymentHistory-table tbody th, .detailedPaymentHistory-table tbody td
	{
	border: none;
	padding: 30px;
	font-size: 14px;
	background: #fff;
	border-bottom: 4px solid #f8f9fd;
	vertical-align: middle;
}

.detailedPaymentHistory-table tbody td .detailedPaymentHistory-img {
	width: 100px;
	height: 80px;
	margin-left: 20px;
}

.detailedPaymentHistory-table tbody td .detailedPaymentHistory-explain span {
	color:black;
	font-size:17px;
	font-weight:bold;
	display: block;
}

.detailedPaymentHistory-table tbody td .detailedPaymentHistory-explain span:last-child {
	font-size: 13px;
	color: rgba(0, 0, 0, 0.3);
}

.detailedPaymentHistory-table tbody td {
	font-size: 13px;
	color: black;
	font-weight: bold;
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

		<section class="detailedPaymentHistory-section">
			<div class="detailedPaymentHistory-container">
				<div class="detailedPaymentHistory-row">
					<div class="detailedPaymentHistory-col-md-12">
						<div class="detailedPaymentHistory-table-wrap">
							<table class="detailedPaymentHistory-table">
								<thead class="thead-primary">
									<tr>
										<th>&nbsp;</th>
										<th>상품</th>
										<th>가격</th>
										<th>포인트</th>
										<th>배송상태</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>
											<div class="detailedPaymentHistory-img"
												style="background-image: url(../images/product-4.png);"></div>
										</td>
										<td>
											<div class="detailedPaymentHistory-explain">
												<span>신발 </span> <span>신발 왼쪽에 검은 얼룩 묻었어요</span>
											</div>
										</td>
										<td>500원</td>
										<td>500p</td>
										<td>입금완료</td>
									</tr>
									<tr>
										<td>
											<div class="detailedPaymentHistory-img"
												style="background-image: url(../images/product-4.png);"></div>
										</td>
										<td>
											<div class="detailedPaymentHistory-explain">
												<span>신발 </span> <span>신발 오른쪽에 빨간 얼룩 묻었어요</span>
											</div>
										</td>
										<td>500원</td>
										<td>500p</td>
										<td>배송중</td>
									</tr>
									<tr>
										<td>
											<div class="detailedPaymentHistory-img"
												style="background-image: url(../images/product-4.png);"></div>
										</td>
										<td>
											<div class="detailedPaymentHistory-explain">
												<span>신발 </span> <span>신발 왼쪽에 검은 얼룩 묻었어요</span>
											</div>
										</td>
										<td>1500원</td>
										<td>1500p</td>
										<td>배송완료</td>
									</tr>

								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</section>
		<div class="detailedPaymentHistory_back">
			<button type="button" class="btn btn-dark"
				onclick="location.href='/launer/mypage/paymentDetails'">이전</button>
		</div>

	</div>

</body>
</html>