<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../inc/top.jsp" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
<script src="<c:url value="/js/bootstrap.min.js"/>" type="text/javascript" text="javascript"></script>
 
    <!-- select -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.0/css/select2.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.0/js/select2.min.js"></script>
	

<script src="<c:url value="/js/laundryService/order/orderMake.js"/>" type="text/javascript" text="javascript"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/laundryService/order/orderMake.css" type="text/css" />
  
	<div id="orderWrapper">
    
        <p><span>한서현 님</span> 수거 수정 요청</p>
        <div class="orderInfo">
    
            <div class="orderInfo-address">
                <div>
                    <div>수거/배송 주소</div>
                    <span id ="orderInfo-address-edit"><a href="#" >수정 > </a></span>
                    
                   <div class ="orderInfo-address-myaddress">
                        <span>서울특별시 마포구 대흥동 고산 1길 1-1 101호</span><br>
                        <span class ="orderInfo-address-myaddress-enter">현관출입방법 : </span><span class="orderInfo-address-myaddress-enter">없음</span>
                   </div>
    
                </div>
                <div>
                </div>
            </div>
    
            <div class ="orderInfo-guide">
                <div><i class="fa-solid fa-bell"></i>&nbsp;처음이신가요 ? </div>
                <a href="#"><div class = "hover-btn" style ="width: 0px;"></div>
                <p style="color: rgb(0, 0, 0);">첫고객 가이드</p>
                </a>

            
            </div>
            <hr>
            <div class="orderInfo-order">
                <div>세탁물 선택</div>

                 <div class="orderInfo-order-daily">
                    <p>생활빨래</p>

                    <div class="row">
                        <div class="col col-sm-6 col-md-6 col-lg-4 col-xl-3">
                            <div class="form-group">
                                <select class="mul-select" multiple="true" name="daily" id="order-daily">
                                    <option value="1">생활의류</option>
                                    <option value="2">속옷</option>
                                    <option value="3">양말</option>
                                    <option value="4">이불</option>
                                    <option value="5">커튼</option>
                                </select>
                            </div> 
                       </div>
                    </div>
                </div>

                <div class="orderInfo-order-indivisual">
                    <p>개별클리닝</p>

                    <div class="row">
                        <div class="col col-sm-6 col-md-6 col-lg-4 col-xl-3">
                            <div class="form-group">
                                <select class="mul-select" multiple="true" 
                                    name="indivisual" id="order-indivisual">
                                    <option value="1">와이셔츠</option>
                                    <option value="2">교복셔츠</option>
                                    <option value="3">니트</option>
                                    <option value="4">정장자켓</option>
                                    <option value="5">코트</option>
                                    <option value="6">패딩조끼</option>
                                    <option value="7">모자</option>
                                </select>
                            </div> 
                       </div>
                    </div>
                </div>
              
                <div class="orderInfo-request">
                    <div>세탁요청사항</div>
                    <textarea name="" id="" cols="50" rows="10"></textarea>
                </div>
                <hr>
                <div class = "orderInfo-tac">
                     <!-- 약관동의버튼 -->
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                        이용약관
                      </button>

                      <!-- 약관동의 모달 -->
                      <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title" id="staticBackdropLabel">수거신청 약관</h5>
                              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam metus justo, molestie quis tincidunt in, dignissim eu orci. Nullam malesuada nunc ut accumsan posuere. Suspendisse efficitur sapien nulla, non consequat tellus dapibus et. Sed porta rutrum elit, eget imperdiet orci sollicitudin at. Morbi at imperdiet velit. Duis tincidunt luctus dui, commodo vehicula ipsum cursus sit amet. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi vestibulum fermentum lacus et pellentesque. In feugiat ligula mollis rhoncus lacinia. Vivamus pulvinar orci ac auctor tristique. In eget massa enim. Donec vitae orci in tellus bibendum tempus. Aenean vehicula enim quis metus aliquet, at consectetur quam sagittis. Aenean nulla dui, varius et nisi id, fringilla vestibulum purus.
                            </div>
                            <div class="modal-footer">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                    <label class="form-check-label" for="flexCheckDefault">
                                      위 약관에 동의합니다
                                    </label>
                                  </div>&nbsp;
                              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                              <button type="button" class="btn btn-primary" id="orderInfo-tac-agreeBtn">확인</button>
                            </div>
                          </div>
                        </div>
                      </div>


                    <span id="orderAgree">&nbsp;<i class="fas fa-solid fas fa-check"></i>동의</span>
                    <br>
                    <div class="sp1"></div>
                    <span id="orderDisagree">&nbsp;<i class="fas fa-solid fas fa-exclamation"></i>&nbsp;약관동의해주세요</span>
                </div>

                <div class = "orderInfo-goOrder">
                    <input type="button" class = "orderBtn" value="수거신청" id="submit">
                </div>
            </div>
    
    
        </div>
    </div>



</body>
</html>