<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="../inc/top.jsp" %>
<style>
.detailedPaymentHistory_wrap{
	margin: 0 auto;
	width:1200px;
	
}
.detailedPaymentHistory_top{
		height:80px;	
		width:100%;
	}

.detailedPaymentHistory_title{
	font-size: 35px;
	font-weight: bold;
	margin-bottom: 50px;
}
.detailedPaymentHistory_sub{
	font-size:20px;
	font-weight: bold;
	color: gray;
	margin-bottom: 70px;
}
.detailedPaymentHistory_sub span{
	font-size: 18px;
	color:black;
}
.detailedPaymentHistory_list{
	border-top: 3px solid black;
	border-bottom: 3px solid black;
	width: 1000px;
    height: 200px;
}
.detailedPaymentHistory_img{
	display: inline-block;
	border: 1px solid;
	margin-top: 25px;
	width: 200px;
    height: 150px;
    margin-left: 40px;
}
.detailedPaymentHistory_detail{
	display: inline-block;
	width: 600px;
    height: 150px;
    margin-left: 90px;
    font-size: 18px;
    font-weight: bold;
    color:gray;
}
.detailedPaymentHistory_detail p{
	margin-left: 30px;
}
.detailedPaymentHistory_detail span{
	color:black;
	font-size: 17px;
}

</style>

<body>
	<div class="detailedPaymentHistory_wrap" >
	<div class="detailedPaymentHistory_top"></div>
		<div class="detailedPaymentHistory_title">
			<P>상세 주문내역</P>
		</div>
		<div class="detailedPaymentHistory_sub">
			<p>주문번호 &nbsp;&nbsp;&nbsp;&nbsp;<span>생활빨래</span></p>
			<p>주소  &nbsp;&nbsp;&nbsp;&nbsp;<span>신촌</span></p>
			<p>주문일자  &nbsp;&nbsp;&nbsp;&nbsp;<span>2022/06/14</span></p>
			<p>총 금액  &nbsp;&nbsp;&nbsp;&nbsp;<span>1500원</span></p>
		</div>
		<div class="detailedPaymentHistory_list">
		<div class="detailedPaymentHistory_img">
		</div>
		<div class="detailedPaymentHistory_detail">
		<p>상품명  &nbsp;&nbsp;&nbsp;&nbsp;<span>생활빨래</span> </p> 
		<p>상품금액 &nbsp;&nbsp;&nbsp;&nbsp;<span>1500원</span></p> 
		<p>배송상태 &nbsp;&nbsp;&nbsp;&nbsp;<span>배송중</span></p> 
		<p>포인트 &nbsp;&nbsp;&nbsp;&nbsp;<span>500p</span></p> 
		</div>
		</div>
	</div>
</body>
</html>