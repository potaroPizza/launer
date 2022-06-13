<%--
  Created by IntelliJ IDEA.
  User: p__mp4
  Date: 2022/06/13
  Time: 12:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="inc/top.jsp" %>

<script src="<c:url value="/js/main.js"/>" type="text/javascript" text="javascript"></script>
<script src="<c:url value="/js/raindrops.js"/>" type="text/javascript" text="javascript"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css" />

<div id="wrap">
    <aside id="main-list-bar">
        <div class="line"></div>
        <div class="part-one part on">
            <div class="main-list-bar-on"></div>
            <p class="num">1</p>
            <div class="sub">소<br />개</div>
        </div>
        <div class="line"></div>
        <div class="part-two part">
            <div class="main-list-bar-on"></div>
            <p class="num">2</p>
            <div class="sub">소<br />개</div>
        </div>
        <div class="line"></div>
        <div class="part-three part">
            <div class="main-list-bar-on"></div>
            <p class="num">3</p>
            <div class="sub">소<br />개</div>
        </div>
        <div class="line"></div>
        <div class="part-four part">
            <div class="main-list-bar-on"></div>
            <p class="num">4</p>
            <div class="sub">소<br />개</div>
        </div>
    </aside>
    <div class="con-wrap">
        <div class="margin-wrap"></div>
        <main>
            <section class="part-one">
                <h1 id="title">
                    <span class="one">러너<br /> Launer</span>
                </h1>
                <h2 id="sub-title">
                    비대면 세탁서비스
                </h2>
                <div class="img-box one">
                    <img src="${pageContext.request.contextPath}/images/washer.jpg" alt="basin" />
                </div>
                <div class="img-box two">
                    <img src="${pageContext.request.contextPath}/images/parcel.jpg" alt="parcel" />
                </div>
                <div class="img-box three">
                    <img src="${pageContext.request.contextPath}/images/clothes.jpg" alt="parcel" />
                </div>
            </section>
            <section class="part-two clearfix main-width">
                <div class="brn-box">
                    <a href="#">
                        <h3 class="sub-title-font"><i class="fa-solid fa-users"></i> 일반회원</h3>
                        <span>
                                지금 주문하면 24시간 이내 수거해요. 세탁 없는 삶, 바로 시작해보세요!
                            </span>
                        <p>Join</p>
                        <div class="circle"></div>
                    </a>
                </div>
                <div class="brn-box">
                    <a href="#">
                        <h3 class="sub-title-font"><i class="fa-solid fa-box"></i> 배송기사</h3>
                        <span>
                                우리들과 함께 나아갈 배송기사님을 모십니다.
                            </span>
                        <p><span>Join</span></p>
                        <div class="circle"></div>
                    </a>
                </div>
                <div class="brn-brand-exp">
                        <span>
                            때 묻은 옷, 시커먼 걱정도 모두 문 앞에 꺼내 두세요.
                            당신이 잠든 사이 우리가 깨끗이 세탁할게요.
                        </span>
                </div>
            </section>
            <section class="part-three main-width">
                <h3 class="title-font">우리들의 서비스</h3>
                <div class="serv-intro clearfix">
                    <div class="text">
                        <div class="first">
                            <div class="element">
                                <div class="icon"></div>
                                <span class="sub-text">비대면 세탁</span>
                            </div>
                            <div class="element">
                                <div class="icon"></div>
                                <span class="sub-text">신속한 배송</span>
                            </div>
                            <div class="element">
                                <div class="icon"></div>
                                <span class="sub-text">실시간 현황</span>
                            </div>
                        </div>
                        <div class="second">
                            <div class="title">
                                <p>
                                    우리 모두가 배송을 할 수 있습니다.
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="icon-box">
                        <img src="${pageContext.request.contextPath}/images/washer.svg" alt="icon" />
                    </div>
                </div>
            </section>
            <section class="part-four">
                <div class="sub-part">
                    <h3 class="title-font">저녁 있는 삶을 위해 세탁에서 퇴근하세요</h3>
                    <article class="part clearfix">
                        <div class="img-box"></div>
                        <div class="text-box r">
                            <h4 class="sub-title-font">간단한 이용방법</h4>
                            <span>주문 후, 수거한 다음 24시간 이내로 문 앞에 배송됩니다.</span>
                            <a href="#">
                                <div class="hover-btn"></div>
                                <p>자세히 알아보기</p>
                            </a>
                        </div>
                    </article>
                    <article class="part clearfix">
                        <div class="text-box l">
                            <h4 class="sub-title-font">합리적 가격</h4>
                            <span>정해진 가격 외 추가요금을 요구하지 않습니다. 정찰제로 안심하고 맡기세요.</span>
                            <a href="#">
                                <div class="hover-btn"></div>
                                <p>가격표 보기</p>
                            </a>
                        </div>
                        <div class="img-box"></div>
                    </article>
                    <article class="part clearfix">
                        <div class="img-box"></div>
                        <div class="text-box r">
                            <h4 class="sub-title-font">서비스 지역</h4>
                            <span>우리는 서울 전지역을 서비스합니다. 각 구별로 지점이 있으며, 지역은 앞으로 더욱 확대될 예정입니다.</span>
                            <a href="#">
                                <div class="hover-btn"></div>
                                <p>서비스 지역 보기</p>
                            </a>
                        </div>
                    </article>
                </div>
            </section>
            <section class="part-five">
                <h3 class="title-font main-width">우리들의 꿀팁 <i class="fa-solid fa-thumbs-up"></i></h3>
                <div class="swiper mySwiper">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide">Slide 1</div>
                        <div class="swiper-slide">Slide 2</div>
                        <div class="swiper-slide">Slide 3</div>
                        <div class="swiper-slide">Slide 4</div>
                        <div class="swiper-slide">Slide 5</div>
                        <div class="swiper-slide">Slide 6</div>
                        <div class="swiper-slide">Slide 7</div>
                        <div class="swiper-slide">Slide 8</div>
                        <div class="swiper-slide">Slide 9</div>
                    </div>
                    <div class="swiper-pagination"></div>
                </div>
            </section>
        </main>
    </div>
</div>
</body>

</html>
