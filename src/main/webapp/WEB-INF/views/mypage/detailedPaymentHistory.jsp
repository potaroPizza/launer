<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/layouts/user" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

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
				주문번호 &nbsp;&nbsp;&nbsp;&nbsp;<span>000001</span>
			</p>
			<p>
				주소 &nbsp;&nbsp;&nbsp;&nbsp;<span>신촌</span>
			</p>
			<p>
				주문일자 &nbsp;&nbsp;&nbsp;&nbsp;<span>2022/06/14</span>
			</p>
			<p>
				총 금액 &nbsp;&nbsp;&nbsp;&nbsp;<span>1500원</span>
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
										<th>포인트</th>
										<th>배송상태</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>
											<div class="detailedPaymentHistory-img"
												style="background-image: url(../images/product-4.png);"></div>
										</td>
										<td>
											<div class="detailedPaymentHistory-explain">
												<span>신발 </span> <span>신발 왼쪽에 검은 얼룩 묻었어요</span>
											</div>
										</td>
										<td>500원</td>
										<td>500p</td>
										<td>입금완료</td>
									</tr>
									<tr>
										<td>
											<div class="detailedPaymentHistory-img"
												style="background-image: url(../images/product-4.png);"></div>
										</td>
										<td>
											<div class="detailedPaymentHistory-explain">
												<span>신발 </span> <span>신발 오른쪽에 빨간 얼룩 묻었어요</span>
											</div>
										</td>
										<td>500원</td>
										<td>500p</td>
										<td>배송중</td>
									</tr>
									<tr>
										<td>
											<div class="detailedPaymentHistory-img"
												style="background-image: url(../images/product-4.png);"></div>
										</td>
										<td>
											<div class="detailedPaymentHistory-explain">
												<span>신발 </span> <span>신발 왼쪽에 검은 얼룩 묻었어요</span>
											</div>
										</td>
										<td>1500원</td>
										<td>1500p</td>
										<td>배송완료</td>
									</tr>

								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</section>
		<div class="detailedPaymentHistory_back">
			<button type="button" class="btn btn-dark"
				onclick="location.href='/launer/mypage/paymentdetails'">이전</button>
		</div>

	</div>

</t:wrapper>