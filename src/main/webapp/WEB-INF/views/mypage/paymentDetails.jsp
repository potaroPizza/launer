<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<style>
.paymentDetails_wrap{
	margin: 0 auto;
	width: 1200px;
	margin-top: 200px;
}
.paymentDetails_date{
	width:1000px;
	margin: 0 auto;
	margin-bottom: 30px;
	font-size: 20px;
}
.table{
	width:1000px;
	margin: 0 auto;
	margin-bottom: 20px;
	font-size:20px;
}
.paymentDetails_amountPayment{
	text-align: right;
	margin-right: 100px;
    font-size: 20px;
}
.paymentDetails_back{
	text-align: center;
}
</style>
<body>

	<div class="paymentDetails_wrap">
	<div class="paymentDetails_date">
	<a href="#">3개월</a> | <a href="#">6개월</a> | <a href="#"> 9개월</a>  
	</div>
	<table class="table">
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
  </tbody>
</table>

<div class="paymentDetails_amountPayment">
<p>총 결제 금액 <span>1500</span>원</p>
</div>
<div class="paymentDetails_back">
 <a href="/herb/member/mypage">이전</a>
</div>					
</div>	
</body>
