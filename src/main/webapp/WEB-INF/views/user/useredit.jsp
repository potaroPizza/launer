<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/layouts/user" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<t:wrapper>
<script type="text/javascript"
	src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>

</style>
    <!-- wrapper -->
    <div id="useredit_wrapper">
        	
        <div id="useredit_top"></div>
			<div id="useredit_sub">
				<p>내 정보 수정</p>
			</div>	
            <!-- content-->
            <form method="post" name="usereditfrm"
				action="<c:url value=''/>">
            <div id="useredit_content">

                <!-- ID -->
                <div>
                    <h3 class="useredit_title">
                        <label for="id">아이디(이메일)</label>
                    </h3>
                    <span class="box int_id">
                        <input type="text" id="id" class="int" value="${vo.email }" readonly="readonly">
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- PW1 -->
                <div>
                    <h3 class="useredit_title"><label for="pwd1">비밀번호</label></h3>
                    <span class="box int_pass">
                        <input type="password" id="pwd1" class="int" maxlength="20">
                        <span id="alertTxt">사용불가</span>
                        <img src="../images/m_icon_pass.png" id="pwd1_img1" class="pswdImg">
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- PW2 -->
                <div>
                    <h3 class="useredit_title"><label for="pwd2">비밀번호 재확인</label></h3>
                    <span class="box int_pass_check">
                        <input type="password" id="pwd2" class="int" maxlength="20">
                        <img src="../images/m_icon_check_disable.png" id="pwd2_img1" class="pswdImg">
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- NAME -->
                <div>
                    <h3 class="useredit_title"><label for="name">이름</label></h3>
                    <span class="box int_name">
                        <input type="text" id="name" class="int" value="${vo.name }" readonly="readonly">
                    </span>
                    <span class="error_next_box"></span>
                </div>
                
                <!-- MOBILE -->
                <div>
                    <h3 class="useredit_title"><label for="phoneNo">휴대전화</label></h3>
                    <span class="box int_mobile">
                        <input type="tel" id="mobile" class="int" value="${vo.hp }" maxlength="11" placeholder=" ' - ' 없이 전화번호를 입력해주세요">
                    </span>
                    <span class="error_next_box"></span>    
                </div>

                <div>
                    <h3 class="useredit_title"><label for="zipcode">우편번호</label></h3>
                    <span class="box int_zipcode">
                        <input type="text" id="zipcode" class="int" maxlength="20" onclick="execZipcode()" placeholder="우편번호 수정하기" readonly="readonly">
                    </span>
                    <span class="error_next_box"></span>
                </div>
                
                <div>
                    <h3 class="useredit_title"><label for="address">주소</label></h3>
                    <span class="box int_address">
                        <input type="text" id="address" class="int" maxlength="20" readonly="readonly">
                    </span>
                    <span class="error_next_box"></span>
                </div>
                
                <div>
                    <h3 class="useredit_title"><label for="detailAddress">상세주소</label></h3>
                    <span class="box int_detailAddress">
                        <input type="text" id="detailAddress" class="int" maxlength="30" placeholder="상세주소 입력">
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <div>
                    <h3 class="useredit_title"><label for="enterMethod">공동현관 출입방법</label></h3>
                    <span class="box int_detailAddress">
                        <input type="text" id="enterMethod" class="int"  maxlength="30" placeholder="공동현관 출입방법 입력">
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- useredit BTN-->
                <div class="useredit_btn_area">
                    <button type="submit" id="btnuseredit">
                        <span>수정하기</span>
                    </button>
                </div>
            </div> 
            </form>
            <!-- content-->
    </div>
        <!-- wrapper -->
<script type="text/javascript"
	src="<c:url value='/js/useredit.js'/>"></script>
</t:wrapper>