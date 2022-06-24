<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/layouts/user" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

</style>
<script type="text/javascript">
window.onload = function() {
	
	const pointRow = document.querySelectorAll(".mypoint_table-row");
		const pointColor =  document.querySelectorAll(".point_cal");
	
	pointRow.forEach((item, idx) => {
		let exp = item.childNodes[5].innerText.charAt(0);
		let exp2 = item.childNodes[5].innerText;
		
		let resText = "";
		let resText2 ="+"
		if(exp === "-") {
			resText = "포인트 차감";
			//pointRow[idx].childNodes[5].style.color="red";
			$(item).find(".mypoint_col-2").css("color", "red");
			$(item).find(".mypoint_col-3").css("color", "red");
		}else {
			resText = "포인트 적립";
			//pointRow[idx].childNodes[5].style.color="green";
			pointRow[idx].childNodes[5].innerText = resText2+item.childNodes[5].innerText;
			$(item).find(".mypoint_col-2").css("color", "green");
			$(item).find(".mypoint_col-3").css("color", "green");
		}
		pointRow[idx].childNodes[3].innerText = resText; 
		
	})
	
	
}
</script>
<t:wrapper>
	<div id="mypoint_wrap">
		<div class="mypoint_top"></div>
		<div class="mypoint_title">
			<p>포인트</p>
		</div>
		<div class="mypoint_container1">
			<ul class="mypoint_table1">
				<li class="mypoint_table1-row">
					<div class="mypoint_col1-1">${vo.name}님의 포인트</div>
					<div class="mypoint_col1-2">${vo.point}P</div>
				</li>
			</ul>
		</div>

		<div class="mypoint_details">
			<p>포인트 이용내역</p>
		</div>
		<div class="mypoint_container">
			<ul class="mypoint_table">
				<li class="mypoint_table-header">
					<div class="mypoint_col-1">날짜</div>
					<div class="mypoint_col-2">내역</div>
					<div class="mypoint_col-3">포인트</div>
				</li>
				<c:if test="${empty list }">
					<div class="mypoint_col-1" data-label="날짜"></div>
					<div class="mypoint_col-2" data-label="내역" > 이용 내역이 없습니다.</div>
					<div class="mypoint_col-3" data-label="포인트" ></div>
				</c:if>
				<c:if test="${!empty list }">
				<c:forEach var="pointDetailAllVo" items="${list }">
				<li class="mypoint_table-row">
					<div class="mypoint_col-1" data-label="날짜"><fmt:formatDate value="${pointDetailAllVo.pointViewVO.regdate}" pattern="yyyy-MM-dd"/></div>
					<div class="mypoint_col-2" data-label="내역" id="point_detail"></div>
					<div class="mypoint_col-3" data-label="포인트" id="point_cal"><fmt:formatNumber value="${pointDetailAllVo.pointViewVO.point}" pattern="#,###"></fmt:formatNumber>P</div>
				</li>
				
				</c:forEach>
				</c:if>
			</ul>
		</div>

		<div class="mypoint_notification">
			<p>포인트 이용 유의사항</p>
			<ul>
				<li>포인트 사용시, 구매금액 제한 없이 결제 시 즉시 사용됩니다.</li>
				<li>회원 탈퇴시 보유하신 포인트 모두 소멸됩니다.</li>
			</ul>
		</div>
	</div>
</t:wrapper>