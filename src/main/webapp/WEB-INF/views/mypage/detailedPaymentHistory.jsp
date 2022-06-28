<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/layouts/user" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<t:wrapper>
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
	<div id="detailedPaymentHistory_wrap">
		<div class="detailedPaymentHistory_top"></div>
		<div class="detailedPaymentHistory_title">
			<P>상세 주문내역</P>
		</div>
		<div class="detailedPaymentHistory_sub">
			<p>
				주문번호 &nbsp;&nbsp;&nbsp;&nbsp;<span>${list[0].paymentHistoryViewVO.orderNo} </span>
			</p>
			<p>
				주문일자 &nbsp;&nbsp;&nbsp;&nbsp;<span><fmt:formatDate value="${list[0].paymentHistoryViewVO.regdate}" pattern="yyyy년  MM월  dd일   HH:mm:ss"/> </span>
			</p>
			<p>
				주소 &nbsp;&nbsp;&nbsp;&nbsp;<span>${list[0].paymentHistoryViewVO.address} &nbsp;&nbsp;
					${list[0].paymentHistoryViewVO.addressDetail}</span>
			</p>
			<p>
				공동현관 출입방법 &nbsp;&nbsp;&nbsp;&nbsp;<span>${list[0].paymentHistoryViewVO.entermethod}</span>
			</p>
			<p>
				주문 요청사항 &nbsp;&nbsp;&nbsp;&nbsp;<span>${list[0].paymentHistoryViewVO.orderRequest}</span>
			</p>
			<p>
				총 금액 &nbsp;&nbsp;&nbsp;&nbsp;<span>${list[0].paymentHistoryViewVO.totalPrice}원</span>
			</p>
		</div>
		<section class="detailedPaymentHistory-section">
			<div class="detailedPaymentHistory-container">
				<div class="detailedPaymentHistory-row">
					<div class="detailedPaymentHistory-col-md-12">
						<div class="detailedPaymentHistory-table-wrap">
							<table class="detailedPaymentHistory-table">
								<thead class="thead-primary">
									<tr>
										<th>&nbsp;</th>
										<th>상품</th>
										<th>가격</th>
										<th>적립 포인트</th>
										<th>주문상태</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="vo2" items="${list }">
								
									<tr>
										<td>
											<div class="detailedPaymentHistory-img"
												style="background-image: url(${vo2.paymentHistoryViewVO.imgurl });"></div>
										</td>
										<td>
											<div class="detailedPaymentHistory-explain">
												<span>${vo2.paymentHistoryViewVO.categoryName } </span>
												 <span>수량:<%-- ${vo2.paymentHistory[1].QUAN } --%> </span>
											</div>
										</td>
										<td><fmt:formatNumber pattern="#,###">${vo2.paymentHistoryViewVO.price }</fmt:formatNumber>원 </td>
										<td><fmt:formatNumber type="number" pattern="#,###" maxFractionDigits="0" value="${vo2.paymentHistoryViewVO.price/100 }" />p</td>
										<td>${vo2.paymentHistoryViewVO.status }</td>
									</tr>
								

								</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</section>

	</div>

</t:wrapper>