<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/layouts/user" %>

<t:wrapper>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script src="<c:url value="/js/pricelist.js"/>" type="text/javascript" text="javascript"></script>
<div id="pricelist_wrap">
	<div class="pricelist_subwrap">
		<div id="pricelist_subwrap2">
			<div id="pricelist_menu">
				<h2>세탁가격을<br>알려드립니다</h2>
				<div class="pricelist_tab">
					<ul>
						<li><a href ="#luxury">명품관</a></li>
						<li><a href ="#schooluniform">교복</a></li>
						<li><a href ="#top">상의</a></li>
						<li><a href ="#golf">골프웨어</a></li>
						<li><a href ="#outer">상의 외투</a></li>
						<li><a href ="#bottom">하의</a></li>
						<li><a href ="#shoes">신발</a></li>
						<li><a href ="#etc">기타</a></li>
						<li><a href ="#bed">침구류</a></li>
						<li><a href ="#curtain">커튼</a></li>
						<li><a href ="#rug">러그</a></li>
						<li><a href ="#event">이벤트</a></li>
					</ul>
				</div>
			</div>
			<div class="price_detail">
			<!---------명품관---------->
				<div id="luxury" class="laundrytab">
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
									<label>명품 셔츠 / 남방</label>
									<span>구매 가격 20만원 이상 제품</span>
								</div>
							</div>
							<strong>10,000원</strong>
						</li>
					</ul>
				</div>
			<!---------교복---------->
				<div id="schooluniform" class="laundrytab">
					<h3>상의</h3>
					<ul id="priceInfo">
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>교복 셔츠</label>
									<span></span>
								</div>
							</div>
							<strong>2,000원</strong>
						</li>
					</ul>
					<h3>하의</h3>
					<ul id="priceInfo">
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>교복 바지</label>
									<span></span>
								</div>
							</div>
							<strong>4,000원</strong>
						</li>
					</ul>
				</div>
			<!---------상의---------->
				<div id="top" class="laundrytab">
					<h3>남성</h3>
					<ul id="priceInfo">
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>일반 와이셔츠</label>
									<span>일반 폴리제질</span>
								</div>
							</div>
							<strong>2,000원</strong>
						</li>
					</ul>
					<h3>여성</h3>
					<ul id="priceInfo">
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>셔츠 및 블라우스</label>
									<span>일반 폴리제질</span>
								</div>
							</div>
							<strong>3,000원</strong>
						</li>
					</ul>
					<h3>공용</h3>
					<ul id="priceInfo">
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>민소매</label>
									<span>일반적인 면 혼방, 합성섬유제질</span>
								</div>
							</div>
							<strong>3,000원</strong>
						</li>
					</ul>
				</div>
			<!---------골프 웨어---------->
				<div id="golf" class="laundrytab">
					<h3>공용</h3>
					<ul id="priceInfo">
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>골프웨어 및 스포츠웨어 상의</label>
									<span>골프웨어 및 고어텍스 기능이 포함된 스포츠 아웃도어용 기능성 상의</span>
								</div>
							</div>
							<strong>8,000원</strong>
						</li>
					</ul>
				</div>
			<!---------상의 외투---------->
				<div id="outer" class="laundrytab">
					<h3>가디건</h3>
					<ul id="priceInfo">
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>숏 가디건</label>
									<span></span>
								</div>
							</div>
							<strong>6,000원</strong>
						</li>
					</ul>
					<h3>양복</h3>
					<ul id="priceInfo">
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>양복 상의</label>
									<span></span>
								</div>
							</div>
							<strong>5,000원</strong>
						</li>
					</ul>
					<h3>자켓/점퍼</h3>
					<ul id="priceInfo">
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>후드집업/아노락</label>
									<span></span>
								</div>
							</div>
							<strong>6,000원</strong>
						</li>
					</ul>
					<h3>코트</h3>
					<ul id="priceInfo">
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>트랜치 코트(반코트)</label>
									<span></span>
								</div>
							</div>
							<strong>12,000원</strong>
						</li>
					</ul>
					<h3>패딩</h3>
					<ul id="priceInfo">
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>경량 패딩 및 패딩조끼</label>
									<span></span>
								</div>
							</div>
							<strong>10,000원</strong>
						</li>
					</ul>
					<h3>가죽</h3>
					<ul id="priceInfo">
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>인조가죽 자켓(숏)</label>
									<span>
									전문적인 가죽세탁과정7일~14일 소요되며, 
									재질에 따라 세탁이 불가능할 수 있습니다.
									</span>
								</div>
							</div>
							<strong>12,000원</strong>
						</li>
					</ul>
				</div>
			<!---------하의---------->
				<div id="bottom" class="laundrytab">
					<h3>일반</h3>
					<ul id="priceInfo">
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>양복 하의</label>
									<span>정장, 양복하의류</span>
								</div>
							</div>
							<strong>4,000원</strong>
						</li>
					</ul>
					<h3>스커트</h3>
					<ul id="priceInfo">
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>일반 스커트</label>
									<span>면, 폴리, 린넨(마)합성재질의 스커트류</span>
								</div>
							</div>
							<strong>6,000원</strong>
						</li>
					</ul>
				</div>
			<!---------신발---------->
				<div id="shoes" class="laundrytab">
					<h3>일반</h3>
					<ul id="priceInfo">
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>일반 운동화/캔버스(물빨래)</label>
									<span>천,매시,캔버스 재질의 소재(20만원 이하의 제품)</span>
								</div>
							</div>
							<strong>6,000원</strong>
						</li>
					</ul>
				</div>
			<!---------기타---------->
				<div id="etc" class="laundrytab">
					<h3>일반</h3>
					<ul id="priceInfo">
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>넥타이</label>
									<span></span>
								</div>
							</div>
							<strong>3,000원</strong>
						</li>
					</ul>
				</div>
			<!---------침구류---------->
				<div id="bed" class="laundrytab">
					<h3>일반</h3>
					<ul id="priceInfo">
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>베게/방석 커버</label>
									<span>베게솜은 세탁이 불가능합니다.</span>
								</div>
							</div>
							<strong>2,000원</strong>
						</li>
					</ul>
					<h3>이불</h3>
					<ul id="priceInfo">
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>이불/침대커버(홀겹)</label>
									<span>방수커버는 세탁이 불가능합니다.</span>
								</div>
							</div>
							<strong>11,000원</strong>
						</li>
					</ul>
					<h3>토퍼/패드</h3>
					<ul id="priceInfo">
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>토퍼(높이 4cm이하)</label>
									<span>캠핑용품 및 내장재가 메모리폼,스펀지는 세탁불가 품목입니다.</span>
								</div>
							</div>
							<strong>53,000원</strong>
						</li>
					</ul>
				</div>
			<!---------커튼---------->
				<div id="curtain" class="laundrytab">
					<h3>일반</h3>
					<ul id="priceInfo">
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>창문 커튼(2m 이하)</label>
									<span>세트가 아닌 '1장' 가격으로 측정됩니다.</span>
								</div>
							</div>
							<strong>15,000원</strong>
						</li>
					</ul>
					<h3>암막</h3>
					<ul id="priceInfo">
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>암막/거실커튼(2m 이하)</label>
									<span>세트가 아닌 '1장' 가격으로 측정됩니다.</span>
								</div>
							</div>
							<strong>21,000원</strong>
						</li>
					</ul>
				</div>
			<!---------러그---------->
				<div id="rug" class="laundrytab">
					<h3>단모</h3>
					<ul id="priceInfo">
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>단모러그(가로 ~ 160cm)</label>
									<span>크기 및 재질에 따라 추가비용/세탁불가 항목일 수 있습니다.</span>
								</div>
							</div>
							<strong>16,000원</strong>
						</li>
					</ul>
					<h3>장모</h3>
					<ul id="priceInfo">
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>장모러그(가로 ~ 160cm)</label>
									<span>크기 및 재질에 따라 추가비용/세탁불가 항목일 수 있습니다.</span>
								</div>
							</div>
							<strong>17,000원</strong>
						</li>
					</ul>
				</div>
			<!---------이벤트---------->
				<div id="event" class="laundrytab">
					<h3>양복</h3>
					<ul id="priceInfo">
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>양복 세트(상의+하의)</label>
									<span>양복 상의+하의,와이셔츠 미 포함</span>
								</div>
							</div>
							<strong>9,000원</strong>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
</t:wrapper>