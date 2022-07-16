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
			<div id="guidance">
				<p>※일부 품목은 준비중인 관계로 실제 주문시 다를 수 있습니다.</p>
			</div>
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
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>명품 하의 / 치마 / 원피스</label>
									<span>구매 가격 30만원 이상 제품</span>
								</div>
							</div>
							<strong>11,000원</strong>
						</li>
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>명품 맨투맨 / 후드티</label>
									<span>구매 가격 20만원 이상 제품</span>
								</div>
							</div>
							<strong>13,000원</strong>
						</li>
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>명품운동화류</label>
									<span>구매가격 50만원 이상 제품</span>
								</div>
							</div>
							<strong>26,000원</strong>
						</li>
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>명품 경량 패딩류</label>
									<span>구매 가격 60만원 이상 제품</span>
								</div>
							</div>
							<strong>30,000원</strong>
						</li>
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>명품 오리털/거위털 패딩류</label>
									<span>구매 가격 100만원 이상 제품</span>
								</div>
							</div>
							<strong>40,000원</strong>
						</li>
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>명품 동절기 코트류(울/모직)</label>
									<span>구매 가격 50만원 이상 제품</span>
								</div>
							</div>
							<strong>45,000원</strong>
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
								</div>
							</div>
							<strong>2,000원</strong>
						</li>
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>교복 니트조끼</label>
								</div>
							</div>
							<strong>3,000원</strong>
						</li>
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>교복 가디건</label>
								</div>
							</div>
							<strong>4,000원</strong>
						</li>
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>교복 자켓</label>
								</div>
							</div>
							<strong>4,000원</strong>
						</li>
					</ul>
					<h3>하의</h3>
					<ul id="priceInfo">
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>교복 바지</label>
								</div>
							</div>
							<strong>4,000원</strong>
						</li>
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>교복 치마</label>
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
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>남방 / 면,린넨(마) 소재 셔츠 류</label>
									<span>남방류, 면, 린넨(마) 재질의 셔츠</span>
								</div>
							</div>
							<strong>4,000원</strong>
						</li>
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>와이셔츠 표백 및 얼룩 제거</label>
									<span>오염(땀,생활얼룩 등)얼룩 제거</span>
								</div>
							</div>
							<strong>4,000원</strong>
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
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>원피스</label>
									<span>접수시 부착물을 탈착하여 접수 부탁드립니다.</span>
								</div>
							</div>
							<strong>8,000원</strong>
						</li>
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>점프슈트</label>
								</div>
							</div>
							<strong>9,000원</strong>
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
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>반팔 티셔츠</label>
									<span>일반적인 면 혼방, 합성섬유제질</span>
								</div>
							</div>
							<strong>4,000원</strong>
						</li>
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>긴팔티셔츠, 맨투맨, 후드티</label>
									<span>일반적인 면 혼방, 합성섬유제질</span>
								</div>
							</div>
							<strong>5,000원</strong>
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
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>골프웨어 및 스포츠웨어 하의</label>
									<span>골프웨어 및 고어텍스 기능이 포함된 스포츠 아웃도어용 기능성 상의</span>
								</div>
							</div>
							<strong>9,000원</strong>
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
								</div>
							</div>
							<strong>6,000원</strong>
						</li>
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>봄 / 가을자켓</label>
									<span>일반폴리, 린넨(마), 청, 항공 점퍼 자켓 류</span>
								</div>
							</div>
							<strong>6,000원</strong>
						</li>
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>겨울용 점퍼, 자켓 류</label>
									<span>겨울용 누빔 점퍼 등</span>
								</div>
							</div>
							<strong>9,000원</strong>
						</li>
					</ul>
					<h3>코트</h3>
					<ul id="priceInfo">
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>트랜치 코트(반코트)</label>
								</div>
							</div>
							<strong>12,000원</strong>
						</li>
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>울 / 모직 코트</label>
								</div>
							</div>
							<strong>15,000원</strong>
						</li>
					</ul>
					<h3>패딩</h3>
					<ul id="priceInfo">
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>경량 패딩 및 패딩조끼</label>
								</div>
							</div>
							<strong>10,000원</strong>
						</li>
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>아웃도어용 구스덕다운</label>
									<span>명품류 혹은 방수, 발수, 고어택스 등의 기능이 포함된 스포츠 아웃도어용 다운패딩</span>
								</div>
							</div>
							<strong>18,000원</strong>
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
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>천연가죽 자켓(숏)</label>
									<span>
									전문적인 가죽세탁과정7일~14일 소요되며, 
									재질에 따라 세탁이 불가능할 수 있습니다.
									</span>
								</div>
							</div>
							<strong>55,000원</strong>
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
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>반바지</label>
									<span>면, 청바지, 일반폴리재질 등</span>
								</div>
							</div>
							<strong>3,000원</strong>
						</li>
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>바지</label>
									<span>면, 청바지, 통바지 등</span>
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
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>(동절기)스커트</label>
									<span>동절기 합성재질의 스커트류</span>
								</div>
							</div>
							<strong>7,000원</strong>
						</li>
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>(주름,실크,쉬폰)스커트</label>
									<span>주름, 실크, 쉬폰 재질의 스커트류</span>
								</div>
							</div>
							<strong>8,000원</strong>
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
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>세무/가죽이 포함된 운동화</label>
									<span>재질 및 형태에 따른 추가비용이 발생 할 수 있습니다.(20만원 이하의 제품)</span>
								</div>
							</div>
							<strong>8,000원</strong>
						</li>
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>골프화 및 등산화</label>
									<span>재질 및 형태에 따른 추가비용이 발생할 수 있습니다.</span>
								</div>
							</div>
							<strong>11,000원</strong>
						</li>
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>목이 올라오는 운동화류</label>
									<span>나이키조던(30만원이하) 및 하이탑류</span>
								</div>
							</div>
							<strong>11,000원</strong>
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
								</div>
							</div>
							<strong>3,000원</strong>
						</li>
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>캡모자</label>
								</div>
							</div>
							<strong>5,000원</strong>
						</li>
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>목도리 / 스카프</label>
								</div>
							</div>
							<strong>7,000원</strong>
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
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>발매트</label>
								</div>
							</div>
							<strong>5,000원</strong>
						</li>
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>담요</label>
								</div>
							</div>
							<strong>7,000원</strong>
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
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>일반 이불</label>
								</div>
							</div>
							<strong>15,000원</strong>
						</li>
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>극세사 이불</label>
								</div>
							</div>
							<strong>17,000원</strong>
						</li>
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>오리털 이불</label>
								</div>
							</div>
							<strong>33,000원</strong>
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
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>토퍼 (높이 5cm 이상)</label>
									<span>캠핑용품 및 내장재가 메모리폼,스펀지는 세탁불가 품목입니다.</span>
								</div>
							</div>
							<strong>80,000원</strong>
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
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>창문 커튼(3m 이하)</label>
									<span>세트가 아닌 '1장' 가격으로 측정됩니다.</span>
								</div>
							</div>
							<strong>18,000원</strong>
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
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>암막/거실 커튼(3m 이하)</label>
									<span>세트가 아닌 '1장' 가격으로 측정됩니다.</span>
								</div>
							</div>
							<strong>26,000원</strong>
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
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>단모러그(가로 ~ 200cm)</label>
									<span>크기 및 재질에 따라 추가비용/세탁불가 항목일 수 있습니다.</span>
								</div>
							</div>
							<strong>19,000원</strong>
						</li>
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>단모러그(가로 ~ 240cm)</label>
									<span>크기 및 재질에 따라 추가비용/세탁불가 항목일 수 있습니다.</span>
								</div>
							</div>
							<strong>21,000원</strong>
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
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>장모러그(가로 ~ 200cm)</label>
									<span>크기 및 재질에 따라 추가비용/세탁불가 항목일 수 있습니다.</span>
								</div>
							</div>
							<strong>20,000원</strong>
						</li>
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>장모러그(가로 ~ 240cm)</label>
									<span>크기 및 재질에 따라 추가비용/세탁불가 항목일 수 있습니다.</span>
								</div>
							</div>
							<strong>24,000원</strong>
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
					<h3>수트(일반수트x)</h3>
					<ul id="priceInfo">
						<li class="priceInfobox">
							<div id="priceInfobox_left">
								<div class="priceName">
									<label>아이언맨 수트</label>
									<span>토니 스타크씨 요청으로 준비중</span>
								</div>
							</div>
							<strong>30,000,000원</strong>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
</t:wrapper>