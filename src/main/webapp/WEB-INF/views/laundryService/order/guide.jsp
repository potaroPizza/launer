<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/layouts/user"%>

<t:wrapper>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<script src="<c:url value="/js/bootstrap.min.js"/>"
		type="text/javascript" text="javascript"></script>
		
<style>
img.guideImg {
    width: 83px;
}

.step {
    margin: 30px;
}

.guideTitle {
    border: 1px solid black;
    border-radius: 42px;
    width: 278px;
    text-align: center;
    height: 41px;
    padding-top: 10px;
    font-size: 19px;
    font-weight: bold;
    margin-bottom: 50px;
}

.guideWrapper p {
    line-height: 28px;
    font-size: 1.3em;
}

.imgDiv {
    margin-bottom: 15px;
}

.guideStitle {
    font-size: 1.5em;
    font-weight: bold;
    margin-bottom: 20px;
    margin-top: 20px;
}
.guideWrapper {
    padding: 150px;
    height: 1230px;
    width: 1200px;
    margin: auto;
}
</style>

<body>
	<div class="guideWrapper">
		<div class="guideTitle">세탁물 맡기는 방법</div>
		<div id="step1" class="step">
			<div class="imgDiv">
				<img src="<c:url value="/images/shopping-bag.png"/>"
					alt="shopping-bag" class="guideImg">
			</div>
			<div>
				<p>
					모든세탁물은 아래의 분류 방법대로<br> <span
						style="color: rgb(16, 90, 181); font-weight: bold;">비닐이나
						쇼핑백에 구분해서</span> 담아주세요
				</p>
			</div>
		</div>
		<hr>
		<div id="step2" class="step">
			<div class="imgDiv">
				<img src="<c:url value="/images/water-drop.png"/>"
					alt="water-drop" class="guideImg">
			</div>
			<div>
				<h3>생활빨래</h3>
				<p>
					<span
						style="font-weight: bold; background: linear-gradient(to top, #d7ecff 50%, transparent 50%)">'러너
						생활빨래'</span> 를 표기해주세요
				</p>
				<p>속옷은 별도로 포장하여 생활빨래와 함께 담아주세요</p>
			</div>
		</div>
		<hr>
		<div id="step3" class="step">
			<div>
				<img src="<c:url value="/images/shirt.png"/>"
					alt="shirt" class="guideImg">
			</div>
			<div>
				<h3>드라이클리닝</h3>
				<p>
					<span
						style="font-weight: bold; background: linear-gradient(to top, #d7ecff 50%, transparent 50%)">'러너
						드라이클리닝'</span> 을 표기해주세요
				</p>
			</div>
		</div>
		<hr>
		<div id="step4" class="step">
			<div>
				<img src="<c:url value="/images/blanket.png"/>" alt="blanket"
					class="guideImg"> <img
					src="<c:url value="/images/curtains.png"/>" alt="curtains"
					class="guideImg"> <img
					src="<c:url value="/images/sneakers.png"/>" alt="sneakers"
					class="guideImg">
			</div>
			<div>
				<h3>기타</h3>
				<p>
					<span
						style="font-weight: bold; background: linear-gradient(to top, #d7ecff 50%, transparent 50%)">'러너
						세탁물명(이불,운동화 등)'</span> 을 표기해주세요
				</p>
			</div>
		</div>

	</div>
</t:wrapper>