<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="../inc/top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="<c:url value="/css/bootstrap.min.css"/>" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="<c:url value="/css/reset.css"/>" rel="stylesheet" type="text/css"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/d4af3bb512.js" crossorigin="anonymous"></script>

<style>
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400;500;700&display=swap');
 @keyframes anime_textup { 0% { top: 0; } 20% { top: -0.4rem; } 40% { top: 0 } 60% { top: 0 } 80% { top: 0 } 100% { top: 0 } }
	body {
		font-family: 'Noto Sans KR', sans-serif;
		-ms-user-select: none;
		-moz-user-select: -moz-none;
		-khtml-user-select: none;
		-webkit-user-select: none;
		user-select: none;
	}
 .clearfix::after, .clearfix::before {content: ""; display: block; line-height: 0;}
 .clearfix::after {clear: both;}
 a{color:#000; text-decoration: none;}
 a:hover{color:#000}
.mypage_wrap {
	width: 1200px;
	margin: 0 auto;
}
.mypage_top{
	width:100%;
	height:100px;
}

.mypage_container {
	width: 1200px;
	margin: 0 auto;
}

.mypage_container_list {
	display: flex;
	list-style: none;
}

div#mypage_container {
	margin-bottom: 100px;
}

li {
	margin: 0 auto;
}

.mypage_container_list .mypage_caption {
	position: absolute;
	top: 320px;
	height: 250px;
	padding-top: 100px;
	margin-left: -30px;
	background: rgba(0, 0, 0, 0.6);
	width: 270px;
	opacity: 0;
	-moz-transition: all 0.2s ease-in-out;
	-o-transition: all 0.2s ease-in-out;
	-webkit-trasition: all 0.2s ease-in-out;
	transition: all 0.2s ease-in-out;
	z-index: 10;
}

.mypage_container_list li:hover .mypage_caption {
	opacity: 1;
	-moz-transform: translateY(-50px);
	-ms-transform: translateY(-50px);
	-o-transform: translateY(-50px);
	-webkit-transform: translateY(-50px);
	-transform: translateY(-50px);
	border-radius: 10px;
	color: white;
	text-decoration: none;
}

.mypage_container_list li:visited .mypage_caption {
	color: white;
	text-decoration: none;
}

.mypage_container_list li:link .mypage_caption {
	color: white;
	text-decoration: none;
}

.mypage_container_list, .caption p {
	color: #fff;
	text-align: center;
	font-size: 30px;
}

.mypage_introduce {
	margin-bottom: 80px;
	font-weight: bold;
	font-size: 40px;
}

.mypage_introduce span {
	font-weight: bold;
	font-size: 30px;
	position: relative;
	animation: anime_textup 1.5s infinite;
}

.mypage_introduce span:nth-of-type(1) {
	animation-delay: .1s;
}

.mypage_introduce span:nth-of-type(2) {
	animation-delay: .2s;
}

.mypage_introduce span:nth-of-type(3) {
	animation-delay: .3s;
}

.mypage_introduce span:nth-of-type(4) {
	animation-delay: .4s;
}

.mypage_introduce span:nth-of-type(5) {
	animation-delay: .5s;
}

.mypage_introduce span:nth-of-type(6) {
	animation-delay: .6s;
}

.mypage_introduce span:nth-of-type(7) {
	animation-delay: .7s;
}

.mypage_logout_btn {
	text-align: center;
}

.mypage_nav {
	margin-bottom: 40px;
	font-weight: bold;
}
#mypage-main-wrap {
	width: 100%;
	height: 350px;
}
 #mypage-text-wrap .part{
	 float: left;
	 width: 350px;
	 margin-left: 75px;
	 text-align: center;
	 line-height: 40px;
	 font-size: 30px;
	 margin-top: 40px;
	 position: relative;
	 margin-bottom: 30px;
	 z-index: 30;
 }#mypage-text-wrap .part:nth-child(1){margin-left: 0}
 #mypage-main-wrap .part{
	 width: 350px;
	 height: 100%;
	 float: left;
	 margin-left: 75px;
	 border-radius: 56px;
	 background: #ffffff;
	 box-shadow:  17px 17px 51px #d9d9d9,
	 -17px -17px 51px #ffffff;
	 line-height: 350px;
	 text-align: center;
	 font-size: 58pt;
	 position: relative;
	 overflow: hidden;
 }
 #mypage-main-wrap .part a{
	 display: block;
	 position: relative;
	 z-index: 10;
 }
 #mypage-main-wrap .part:nth-child(1){margin-left: 0}

 #mypage-main-wrap .hover-wrap{
	 width: 0;
	 height: 0;
	 position: absolute;
	 background: #466391;
	 bottom: -100%;
	 right: -100%;
	 border-radius: 100%;
	 z-index: -1;
 }
</style>
<script type="text/javascript">
	$(function() {
		$("#mypage-main-wrap .part").hover(function() {
			$(this).stop().animate({
				top: "-3%"
			}, 400);
			$(this).find(".hover-wrap").stop().animate({
				width: "400%",
				height: "400%"
			}, 600);

			$(this).find("a").stop().animate({color: "#fff"}, 600);
		},function() {
			$(this).stop().animate({
				top: "0"
			}, 400);
			$(this).find(".hover-wrap").stop().animate({
				width: 0,
				height: 0
			}, 600);
			$(this).find("a").stop().animate({color: "#000"}, 600);
		});
	})
</script>
<body>
	<div class="mypage_wrap">
		<div class="mypage_top"></div>
		<div class="mypage_introduce">
			김러너님, &nbsp;<span>러너와</span> <span>함께</span> <span>빨래</span><span>없는</span> <span>생활을</span>
			<span>시작</span><span>하세요!</span>
		</div>
		<div id="mypage-main-wrap" class="clearfix">
			<div class="part">
				<a href="#">
					<i class="fa-solid fa-coins"></i>
					<div class="hover-wrap"></div>
				</a>
			</div>
			<div class="part">
				<a href="#">
					<i class="fa-solid fa-file-invoice"></i>
					<div class="hover-wrap"></div>
				</a>
			</div>
			<div class="part">
				<a href="#">
					<i class="fa-solid fa-address-card"></i>
					<div class="hover-wrap"></div>
				</a>
			</div>
		</div>
		<div id="mypage-text-wrap" class="clearfix">
			<div class="part">
				<span>1,000 Point</span>
			</div>
			<div class="part">
				<span>결제내역</span>
			</div>
			<div class="part">
				<span>내 정보</span>
			</div>
		</div>
		<%--<div id="mypage_container">
			<ul class="mypage_container_list">
				<li><img src="../images/point.jpg"> <a
					href="/launer/mypage/mypoint">
						<div class="mypage_caption">
							<p>포인트</p>
						</div>
				</a></li>
				<li><img src="../images/paymentdetails.jpg"> <a
					href="/launer/mypage/paymentDetails">
						<div class="mypage_caption">
							<p>결제내역</p>
						</div>
				</a></li>
				<li><img src="../images/myinformation.jpg"> <a
					href="/launer/mypage/myinfo">
					<div class="mypage_caption">
						<p>내정보</p>
					</div></a></li>
			</ul>
		</div>--%>
		<!-- As a link -->
		<div class="mypage_nav">
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
  				<div class="container-md">
    			<a class="navbar-brand" href="#">공지사항</a>
 				 </div>
			</nav>
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
  				<div class="container-md">
    			<a class="navbar-brand" href="#">설정</a>
 				 </div>
			</nav>
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
  				<div class="container-md">
    			<a class="navbar-brand" href="#">고객센터</a>
 				 </div>
			</nav>
		</div>
		<!-- Button trigger modal -->
		<%--<div class="mypage_logout_btn">
			<button type="button" class="btn btn-dark" data-bs-toggle="modal"
				data-bs-target="#exampleModal">로그아웃</button>
		</div>--%>
		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">로그아웃</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body ">로그아웃 하시겠습니까?</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-dark" onclick="location.href='/launer'">로그아웃</button>
						<button type="button" class="btn btn-dark"
							data-bs-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
