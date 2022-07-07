<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/layouts/user" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<t:wrapper>
<link href="<c:url value="/css/reset.css"/>" rel="stylesheet" type="text/css"/>
<script src="https://kit.fontawesome.com/d4af3bb512.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="<c:url value='/js/mypage.js'/>"></script>




	<div id="mypage_wrap">
		<div class="mypage_top"></div>
		<div class="mypage_introduceWrap">
		<div class="mypage_introduce">
			${vo.name }님, &nbsp;<span>러너와</span> <span>함께</span> <span>빨래</span><span>없는</span> <span>생활을</span>
			<span>시작</span><span>하세요!</span>
			
		</div>
		<div class="mypage_container1">
			<ul class="mypage_table1">
				<li class="mypage_table1-row">
					<div class="mypage_col1-1">
						<jsp:useBean id="today" class="java.util.Date" />
						<fmt:formatDate var="now" value="${today}" pattern="yyyyMMdd" />
						<fmt:formatDate var="sdate" value="${vo.startDate}"
							pattern="yyyyMMdd" />
						<p>
							세탁 없는 생활 <span class="mypageDate">${now-sdate}</span>일 째
						</p>
					</div>
				</li>
			</ul>
		</div>
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
				<span><fmt:formatNumber value="${vo.point }" pattern="#,###,###,###"></fmt:formatNumber> Point</span>
			</div>
			<div class="part">
				<span>결제내역</span>
			</div>
			<div class="part">
				<span>내 정보</span>
			</div>
		</div>
		
	
		<%-- <div class="mypage_container1">
			<ul class="mypage_table1">
				<li class="mypage_table1-row">
					<div class="mypage_col1-1">
						<jsp:useBean id="today" class="java.util.Date" />
						<fmt:formatDate var="now" value="${today}" pattern="yyyyMMdd" />
						<fmt:formatDate var="sdate" value="${vo.startDate}"
							pattern="yyyyMMdd" />
						<p>
							세탁 없는 생활 <span>${now-sdate}</span>일 째
						</p>
					</div>
				</li>
			</ul>
		</div> --%>
		
		
	
	</div>
</t:wrapper>
