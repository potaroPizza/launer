<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/layouts/user"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<t:wrapper>

	<div id="detailedPaymentHistory_wrap">
		<div class="detailedPaymentHistory_top"></div>
		<div class="detailedPaymentHistory_title">
			<P>상세 주문내역</P>
		</div>
		<div class="detailedPaymentHistory_sub">
			<p>
				주문자 &nbsp;&nbsp;&nbsp;&nbsp;<span>${vo.name}</span>
			</p>
			<p>
				주문번호 &nbsp;&nbsp;&nbsp;&nbsp;<span>${list[0].paymentHistoryViewVO.orderNo}
				</span>
			</p>
			<p>
				주문일자 &nbsp;&nbsp;&nbsp;&nbsp;<span><fmt:formatDate
						value="${list[0].paymentHistoryViewVO.regdate}"
						pattern="yyyy년  MM월  dd일   HH:mm:ss" /> </span>
			</p>
			<p>
				전화번호 &nbsp;&nbsp;&nbsp;&nbsp;<span>${vo.hp} </span>
			</p>
			<p>
				주소 &nbsp;&nbsp;&nbsp;&nbsp;<span>${list[0].paymentHistoryViewVO.address}
					&nbsp;&nbsp; ${list[0].paymentHistoryViewVO.addressDetail}</span>
			</p>
			<p>
				공동현관 출입방법 &nbsp;&nbsp;&nbsp;&nbsp;<span>${list[0].paymentHistoryViewVO.entermethod}</span>
			</p>
			<p>
				주문 요청사항 &nbsp;&nbsp;&nbsp;&nbsp;<span>${list[0].paymentHistoryViewVO.orderRequest}</span>
			</p>
			<p>
				총 주문금액 &nbsp;&nbsp;&nbsp;&nbsp;<span><fmt:formatNumber
						value="${list[0].paymentHistoryViewVO.totalPrice}"
						pattern="#,###,###,###"></fmt:formatNumber> 원</span>
			</p>
		</div>
		<hr>
		<section class="detailedPaymentHistory-section">
			<div class="detailedPaymentHistory-container">
				<div class="detailedPaymentHistory-row">
					<div class="detailedPaymentHistory-col-md-12">
						<div class="detailedPaymentHistory-table-wrap">
							<table class="detailedPaymentHistory-table">
								<thead class="thead-primary">
									<tr>
										<th id="detailedPaymentHistory_col1"></th>
										<th id="detailedPaymentHistory_col2">상품</th>
										<th id="detailedPaymentHistory_col3">주문금액</th>
										<th id="detailedPaymentHistory_col4">적립 포인트</th>
										<th id="detailedPaymentHistory_col5">상태</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="vo2" items="${list }" varStatus="st">

										<tr>
											<td>
												<div class="detailedPaymentHistory-img"
													style="background-image: url(${vo2.paymentHistoryViewVO.imgurl });"></div>
											</td>
											<td>
												<div class="detailedPaymentHistory-explain">
													<span>${vo2.paymentHistoryViewVO.categoryName } </span> <span>수량:${vo2.paymentHistory.get(st.index).QUAN	 }
													</span>
												</div>
											</td>
											<td><fmt:formatNumber pattern="#,###">${vo2.paymentHistoryViewVO.price }</fmt:formatNumber>원
											</td>
											<td><fmt:formatNumber type="number" pattern="#,###"
													maxFractionDigits="0"
													value="${vo2.paymentHistoryViewVO.price/100 }" />P</td>
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