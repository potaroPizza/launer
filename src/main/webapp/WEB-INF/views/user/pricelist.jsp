<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../inc/top.jsp"%>
<link rel="stylesheet" href="<c:url value="/css/user/pricelist.css"/>" />

<title>러너 가격표</title>
<body>
<div id="pricelistWrap">
	<div class="pricelistsubWrap">
		<div id="pricelistsubWrap2">
			<div id="pricelistMenu">
				<h2>세탁가격을<br>알려드립니다</h2>
				<div id="pricelistTab">
					<ul class="pricelistTabnav">
						<li>명품관</li><li>교복</li><li>상의</li><li>골프웨어</li>
						<li>상의 외투</li><li>하의</li><li>신발</li><li>기타</li>
						<li>침구류</li><li>커튼</li><li>러그</li>
					</ul>
				</div>
			</div>
			<div id="priceDetail">
				<h3>일반</h3>
				<ul id="priceInfo">
					<li class="priceInfobox">
						<div id="priceInfobox_left">
							<div class="priceName">
								<label>명품 반팔티</label>
								<span>구매 가격 10만원 이상 제품</span>
							</div>
						</div>
						<strong>8,000원</strong>
					</li>
					<li class="priceInfobox">
						<div id="priceInfobox_left">
							<div class="priceName">
								<label>명품 셔츠/남방</label>
								<span>구매 가격 20만원 이상 제품</span>
							</div>
						</div>
						<strong>10,000원</strong>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>
</body>