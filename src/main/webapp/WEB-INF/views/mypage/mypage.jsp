<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/layouts/user" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<t:wrapper>
<link href="<c:url value="/css/bootstrap.min.css"/>" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="<c:url value="/css/reset.css"/>" rel="stylesheet" type="text/css"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/d4af3bb512.js" crossorigin="anonymous"></script>

<style>
	.event-box{
		width: 100%;
		height: 100%;
		position:absolute;
		z-index: 100;
		left:0;
		right: 0;
	}
</style>
<script type="text/javascript">
	$(function() {
		/* $("#mypage-main-wrap .part a").mouseover(function(e) {
			const $secPartOne = $(this);
			e.stopPropagation();
			let x = e.clientX - $secPartOne.offset().left;
			let y = e.clientY - $secPartOne.offset().top;
			
			console.log(x, y);
		}); */
		
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

	<div id="mypage_wrap">
		<div class="mypage_top"></div>
		<div class="mypage_introduce">
			${vo.name }님, &nbsp;<span>러너와</span> <span>함께</span> <span>빨래</span><span>없는</span> <span>생활을</span>
			<span>시작</span><span>하세요!</span>
		</div>
		<div id="mypage-main-wrap" class="clearfix">
			<div class="part">
				<a href="/launer/mypage/mypoint">
					<i class="fa-solid fa-coins"></i>
					<div class="hover-wrap"></div>
					<div class="event-box"></div>
				</a>
			</div>
			<div class="part">
				<a href="/launer/mypage/paymentdetails">
					<i class="fa-solid fa-file-invoice"></i>
					<div class="hover-wrap"></div>
				</a>
			</div>
			<div class="part">
				<a href="/launer/mypage/myinfo">
					<i class="fa-solid fa-address-card"></i>
					<div class="hover-wrap"></div>
				</a>
			</div>
		</div>
		<div id="mypage-text-wrap" class="clearfix">
			<div class="part">
				<span>${vo.point } Point</span>
			</div>
			<div class="part">
				<span>결제내역</span>
			</div>
			<div class="part">
				<span>내 정보</span>
			</div>
		</div>
		
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
</t:wrapper>
