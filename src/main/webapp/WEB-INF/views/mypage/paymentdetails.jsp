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
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(function(){
		$("#startDay").datepicker({
			dateFormat:'yy-mm-dd',
			changeYear:true,
			dayNamesMin:['일','월','화','수','목','금','토'],
			monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
		});
		$("#endDay").datepicker({
			dateFormat:'yy-mm-dd',
			changeYear:true,
			dayNamesMin:['일','월','화','수','목','금','토'],
			monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
		});
	});
</script>
<style>
.paymentdetails_wrap {
	margin: 0 auto;
	width: 1200px;
}

.paymentdetails_top {
	width: 100%;
	height: 150px;
}

.paymentdetails_title {
	width: 1000px;
	font-size: 30px;
	font-weight: bold;
	margin-bottom: 80px;
}

.paymentdetails_date {
	width: 1200px;
	margin: 0 auto;
	margin-bottom: 30px;
	margin-left: 45px;
}



.paymentdetails_amountPayment {
	text-align: right;
	font-size: 20px;
}

.paymentdetails_amountPayment span {
	font-weight: bold;
}

.paymentdetails_back {
	text-align: center;
}

.paymentdetails_date a:visited {
	color: black;
	text-decoration: none;
}

.paymentdetails_date a:link {
	color: black;
	text-decoration: none;
}

.paymentdetails_container {
	max-width: 1200px;
	margin-left: auto;
	margin-right: auto;
	padding-left: 10px;
	padding-right: 10px;
	margin-bottom: 70px;
}

.paymentdetails_table li {
	border-radius: 3px;
	padding: 5px 30px;
	display: flex;
	justify-content: space-between;
	margin-bottom: 10px;
}

.paymentdetails_table-header {
	background-color: #045FB4;
	font-size: 17px;
	font-weight: bold;
	text-transform: uppercase;
	letter-spacing: 0.03em;
	color: white;
	text-align: center;
}

.paymentdetails_table-row {
	background-color: #ffffff;
	box-shadow: 0px 0px 9px 0px rgba(0, 0, 0, 0.1);
	font-size: 15px;
	font-weight: bold;
	text-align: center;
}

.paymentdetails_col-1 {
	flex-basis: 15%;
}

.paymentdetails_col-2 {
	flex-basis: 40%;
}

.paymentdetails_col-3 {
	flex-basis: 10%;
}

.paymentdetails_col-4 {
	flex-basis: 15%;
}

.paymentdetails_col-5 {
	flex-basis: 10%;
}

a {
	display: block;
}
</style>
<body>

	<div class="paymentdetails_wrap">
		<div class="paymentdetails_top"></div>
		<div class="paymentdetails_title">
			<p>결제 내역</p>
		</div>
		<div class="paymentdetails_date">
			<form name="frm1" method="post" action="<c:url value=''/>">
				<input type="button" value="3개월" class="btn btn-outline-dark">
				<input type="button" value="6개월" class="btn btn-outline-dark">
				<input type="button" value="9개월" class="btn btn-outline-dark">
				<br> <br> <input type="text" name="startDay" id="startDay"
					value="${dateSearchVO.startDay }"> ~ <input type="text"
					name="endDay" id="endDay" value="${dateSearchVO.endDay }">
				<input type="submit" id="" value="조회">
			</form>
		</div>
		<div class="paymentdetails_container">
			<ul class="paymentdetails_table">
				<li class="paymentdetails_table-header">
					<div class="paymentdetails_col-1">주문코드</div>
					<div class="paymentdetails_col-2">상품명</div>
					<div class="paymentdetails_col-3">가격</div>
					<div class="paymentdetails_col-4">주문일</div>
					<div class="paymentdetails_col-5">상태</div>
				</li>
				<li class="paymentdetails_table-row">
					<div class="paymentdetails_col-1" data-label="주문코드">00001</div>
					<div class="paymentdetails_col-2" data-label="상품명">
						<a href="/launer/mypage/detailedPaymentHistory">신발외 5건</a>
					</div>
					<div class="paymentdetails_col-3" data-label="가격">5000원</div>
					<div class="paymentdetails_col-4" data-label="주문일">2022-06-18</div>
					<div class="paymentdetails_col-5" data-label="상태">배송중</div>
				</li>
				<li class="paymentdetails_table-row">
					<div class="paymentdetails_col-1" data-label="주문코드">00002</div>
					<div class="paymentdetails_col-2" data-label="상품명">청바지외 5건</div>
					<div class="paymentdetails_col-3" data-label="가격">15000원</div>
					<div class="paymentdetails_col-4" data-label="주문일">2022-06-18</div>
					<div class="paymentdetails_col-5" data-label="상태">배송완료</div>
				</li>
				<li class="paymentdetails_table-row">
					<div class="paymentdetails_col-1" data-label="주문코드">00003</div>
					<div class="paymentdetails_col-2" data-label="상품명">신발외 5건</div>
					<div class="paymentdetails_col-3" data-label="가격">5000원</div>
					<div class="paymentdetails_col-4" data-label="주문일">2022-06-18</div>
					<div class="paymentdetails_col-5" data-label="상태">배송중</div>
				</li>
				<li class="paymentdetails_table-row">
					<div class="paymentdetails_col-1" data-label="주문코드">00004</div>
					<div class="paymentdetails_col-2" data-label="상품명">신발외 5건</div>
					<div class="paymentdetails_col-3" data-label="가격">5000원</div>
					<div class="paymentdetails_col-4" data-label="주문일">2022-06-18</div>
					<div class="paymentdetails_col-5" data-label="상태">배송중</div>
				</li>
				<li class="paymentdetails_table-row">
					<div class="paymentdetails_col-1" data-label="주문코드">00005</div>
					<div class="paymentdetails_col-2" data-label="상품명">신발외 5건</div>
					<div class="paymentdetails_col-3" data-label="가격">45000원</div>
					<div class="paymentdetails_col-4" data-label="주문일">2022-06-18</div>
					<div class="paymentdetails_col-5" data-label="상태">결제완료</div>
				</li>

			</ul>
		</div>

		<div class="paymentdetails_amountPayment">
			<p>
				총 결제 금액 <span>1500</span>원
			</p>
		</div>
		<div class="paymentdetails_back">
			<button type="button" class="btn btn-dark"
				onclick="location.href='/launer/mypage/mypage'">이전</button>
		</div>
	</div>



</body>
