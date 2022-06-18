<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../inc/top.jsp" %>

<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"/>"/>
<script src="<c:url value="/js/bootstrap.min.js"/>" type="text/javascript" text="javascript"></script>
<script src="<c:url value="/js/laundryService/order/orderConfirm.js"/>" type="text/javascript" text="javascript"></script>
<link rel="stylesheet" href="<c:url value="/css/laundryService/order/orderConfirm.css"/>" type="text/css"/>
<script type="text/javascript">

	
</script>

<div class="margin-top-fixed"></div>
<div class="orderConfirm-wrapper-wrapper">
    <div class="orderConfirm-wrapper">
        <div class="orderConfirm-inform">
            <p>주문확인하기</p>
            <div class="orderNormalP">세탁이 없는 일상을 시작하기 전 마지막 단계입니다.<br> 수거요청정보가 정확한지 확인해주십시오</div>
        </div>
        <hr>
        <div class="orderDivForm">
            <form name="frmOrder" method="post">
                <div class="orderConfirm-user">
                    <div class="user-date">
                        <label for="take-date">수거일 : </label>
                        <input type="text" name="take-date" id="take-date" class="orderConfirm-input" value="5월 30일"
                               readonly>
                    </div>
                    <div class="user-name">
                        <label for="orderUserName">이름 : </label>
                        <input type="text" name="name" id="name" class="orderConfirm-input" value="한서현" readonly>
                    </div>
                    <div class="user-hp">
                        <label for="take-date">전화번호 : </label>
                        <input type="text" name="hp" id="hp" class="orderConfirm-input" value="5월 30일" readonly>
                    </div>

                    <div class="user-address">
                        <label for="address">주소 : </label>
                        <input type="text" name="address" id="address" class="orderConfirm-input"
                               value="서울특별시 대흥동 고산 1길 1-1 101 호" readonly>
                    </div>
                    <div class="user-address-method">
                        <label for="entherMethod">현관출입방법 : </label>
                        <input type="text" name="entherMethod" id="entherMethod" class="orderConfirm-input"
                               value="없음" readonly>
                    </div>
                </div>
                <hr>
                <div class="orderConfirm-clothing">
                    <table class="orderConfirm-clothing-table"
                           summary="수거요청상품 목록에 대한 표로서 상품명, 가격,금액,이미지 등의 정보를 제공합니다">
                        <colgroup>
                            <col style="">
                            <col style="">
                            <col style="">
                            <col style="">
                            <col style="">
                        </colgroup>
                        <thead>
                        <tr>
                            <th scope="col">상품번호</th>
                            <th scope="col">카테고리그룹</th>
                            <th scope="col">상품명, 수량</th>
                            <th scope="col">금액</th>
                        </tr>
                        </thead>
                        <tbody>
                        <!-- 반복시작 -->
                        <!-- 반복끝 -->
                        </tbody>
                    </table>

                    <hr>
                    <div class="orderConfirm-finalInfo">
                        <div class="orderConfirm-finalInfo-div">
                            <label for="price_sum">상품금액 : </label>
                            <input type="text" name="price_sum" id="price_sum" class="orderConfirm-input"
                                   value="10000원" readonly>
                        </div>
                        <div class="orderConfirm-finalInfo-div">
                            <label for="">포인트사용 : </label>
                            <input type="text" name="usePoint" id="usePoint" value="">
                            <input type="button" value="사용" id="usePointBtn">&nbsp;

                            <span>보유포인트 : </span><span>0</span><span>p</span><br>
                            <span class="shortPoint">보유포인트보다 값이 큽니다</span>
                        </div>
                        <div class="orderConfirm-finalInfo-div">
                            <label for="total_price">총결제금액 : </label>
                            <input type="text" name="total_price" id="total_price" class="orderConfirm-input"
                                   value="" readonly>
                        </div>
                    </div>

                    <hr>
                    <div class="orderInfo-tac">
                        <!-- 약관동의버튼 -->
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                data-bs-target="#staticBackdrop">
                            이용약관
                        </button>

                        <!-- 약관동의 모달 -->
                        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false"
                             tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="staticBackdropLabel">수거신청 약관</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                        Etiam metus justo, molestie quis tincidunt in, dignissim
                                        eu orci. Nullam malesuada nunc ut accumsan posuere. Susp
                                        endisse efficitur sapien nulla, non consequat tellus
                                        dapibus et. Sed porta rutrum elit, eget imperdiet orci
                                        sollicitudin at. Morbi at imperdiet velit. Duis tincidunt
                                        luctus dui, commodo vehicula ipsum cursus sit amet.
                                        Class aptent taciti sociosqu ad litora torquent per
                                        conubia nostra, per inceptos himenaeos. Morbi vestibulum
                                        fermentum lacus et pellentesque. In feugiat ligula
                                        mollis rhoncus lacinia. Vivamus pulvinar orci ac auctor
                                        tristique. In eget massa enim. Donec vitae orci in
                                        tellus bibendum tempus. Aenean vehicula enim quis metus
                                        aliquet, at consectetur quam sagittis. Aenean nulla dui,
                                        varius et nisi id, fringilla vestibulum purus.
                                    </div>
                                    <div class="modal-footer">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value=""
                                                   id="flexCheckDefault">
                                            <label class="form-check-label" for="flexCheckDefault">
                                                위 약관에 동의합니다
                                            </label>
                                        </div>&nbsp;
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소
                                        </button>
                                        <button type="button" class="btn btn-primary" id="orderInfo-tac-agreeBtn">확인
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <span id="orderAgree">&nbsp;<i class="fas fa-solid fas fa-check"></i>동의</span>
                        <br>
                        <div class="sp1"></div>
                        <span id="orderDisagree">&nbsp;<i
                                class="fas fa-solid fas fa-exclamation"></i>&nbsp;약관동의해주세요</span>
                    </div>


                </div>
                <hr>
                <div class="orderInfo-goOrder">
                    <input type="button" class="orderBtn" value="결제요청" id="submit">
                </div>


            </form>
        </div>
    </div>

</div>


</body>
</html>
 
 
 
 
 
 
 