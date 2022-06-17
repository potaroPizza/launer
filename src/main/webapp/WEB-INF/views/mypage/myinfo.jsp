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
.myinfo_wrap {
	margin: 0 auto;
	width: 1200px;
}

.myinfo_top {
	width: 100%;
	height: 150px;
}

.myinfo_title_wrap {
	font-size: 25px;
	font-weight: bold;
	margin-bottom: 70px;
}
.myinfo_title{
	display: inline-block;	
}

.myinfo_details {
	font-size: 25px;
	font-weight: bold;
	margin-bottom: 50px;
}

.myinfo_detail {
	margin-bottom: 80px;
	font-size: 20px;
	font-weight: bold;
}

.myinfo_detail span {
	font-size: 20px;
	color: gray;
}

.myinfo_delivery {
	margin-bottom: 50px;
	font-size: 25px;
	font-weight: bold;
}


.myinfo_editbtn {
	margin-left: 100px;
	display: inline-block;
}
.myinfo_space{
	width:100%;
	height:15px;
	background-color:#FAFAFA;
	margin-bottom: 50px;
}
.myinfo_withdrawbtn{
	text-align: center;
}
</style>
<body>

	<div class="myinfo_wrap">
		<div class="myinfo_top"></div>
		<div class="myinfo_title_wrap">
			<div class="myinfo_title">
				<p>기본 정보</p>
			</div>
			<div class="myinfo_editbtn">
				<button type="button" class="btn btn-dark">정보 수정</button>
			</div>
		</div>
		<div class="myinfo_detail">
			<p>이메일 &nbsp;&nbsp;&nbsp;&nbsp;<span>launer@naver.com</span></p>
			<p>이름 &nbsp;&nbsp;&nbsp;&nbsp;<span>김러너</span></p>
			<p>전화번호 &nbsp;&nbsp;&nbsp;&nbsp;<span>010-1234-5678</span></p>
		</div>
		<div class="myinfo_space"></div>
		<div class="myinfo_delivery">
			<p>배송 정보</p>
		</div>

		<div class="myinfo_detail">
			<p>배송지&nbsp;&nbsp;&nbsp;&nbsp;<span>서울특별시 서대문구 라멘집</span></p>
			<p>공동현관 출입방법&nbsp;&nbsp;&nbsp;&nbsp;<span>자유 출입가능 & 공동현관 없음</span></p>

		</div>
		<div class="myinfo_withdrawbtn">
				<button type="button" class="btn btn-dark" onclick="location.href='/launer/mypage/withdraw'">회원 탈퇴</button>
			</div>
	</div>
</body>
</html>