<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/layouts/user" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:wrapper>
<script type="text/javascript" src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/useredit.js'/>"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 
    <div id="useredit_wrapper">
     <!-- 일반 회원 사용자 폼 -->   	
		<c:if test="${map['SOCIAL_LOGIN_KEY']==null}">
        <div id="useredit_top"></div>
			<div id="useredit_sub">
				<p>내 정보 수정</p>
			</div>	
            <!-- content-->
            <form method="post" name="usereditfrm" action="<c:url value='/mypage/useredit'/>">
            <div id="useredit_content">

                <!-- ID -->
                <div>
                    <h3 class="useredit_title"><label for="id">아이디(이메일)</label></h3>
                    <span class="box int_id" style="background-color: #e9e9e9;">
                        <input type="text" id="userid" name="id" class="int" value="${map['EMAIL']}" maxlength="20" readonly="readonly" disabled style="background-color: #e9e9e9;">
                    </span>
                    <span class="error_next_box"></span>
                </div>
                <!-- PW1 -->
                <div>
                    <h3 class="useredit_title"><label for="pwd">비밀번호</label></h3>
                    <span class="box int_pass">
                        <input type="password" id="pwd" name="pwd" class="int" maxlength="16" placeholder="비밀번호를 입력해주세요.">
                        <span id="alertTxt">사용불가</span>
                        <img src="../images/m_icon_pass.png" id="pwd_img1" class="pswdImg">
                    </span>
                    <span class="error_next_box"></span>
                </div>
				

                <!-- NAME -->
                <div>
                    <h3 class="useredit_title"><label for="name">이름</label></h3>
                    <span class="box int_name" style="background-color: #e9e9e9;">
                        <input type="text" id="name" class="int" name="name" value="${map['NAME']}" readonly="readonly" disabled style="background-color: #e9e9e9;">
                    </span>
                    <span class="error_next_box"></span>
                </div>
                
                <!-- hp -->
                <div>
                    <h3 class="useredit_title"><label for="phoneNo">휴대전화</label></h3>
                    <span class="box int_hp">
                        <input type="tel" id="hp" name="hp" class="int" value="${map['HP']}" maxlength="11" placeholder=" ' - ' 없이 전화번호를 입력해주세요">
                    </span>
                    <span class="error_next_box"></span>    
                </div>

                <div>
                    <h3 class="useredit_title"><label for="zipcode">우편번호  <input type="button" onclick="execZipcode()" id="btnZipcode" value="우편번호 찾기" name="btnZipcode"></label></h3>
                    <span class="box int_zipcode">
                        <input type="text" id="zipcode" name="zipcode" class="int" maxlength="20" value="${map['ZIPCODE']}" onclick="execZipcode()" placeholder="우편번호 수정하기" readonly="readonly">
                    	</span>
                    <span class="error_next_box"></span>
                </div>
                
                <div>
                    <h3 class="useredit_title"><label for="address">주소</label></h3>
                    <span class="box int_address">
                        <input type="text" id="address" name="address" class="int" maxlength="20" value="${map['ADDRESS']}" readonly="readonly">
                    </span>
                    <span class="error_next_box"></span>
                </div>
                
                <div>
                    <h3 class="useredit_title"><label for="addressDetail">상세주소</label></h3>
                    <span class="box int_addressDetail"> 
                        <input type="text" id="addressDetail" name="addressDetail" class="int" maxlength="30" value="${map['ADDRESS_DETAIL']}" placeholder="상세주소를 입력해주세요.">
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <div>
                    <h3 class="useredit_title"><label for="enterMethod">공동현관 출입방법</label></h3>
                    <span class="box int_entermethod">
                        <input type="text" id="entermethod" name="entermethod" class="int"  maxlength="30" value="${map['ENTERMETHOD']}" placeholder="공동현관 출입방법을 입력해주세요.">
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
       </c:if>
       
       <!--소셜 로그인 사용자 폼(네이버,카카오)  -->
	<c:if test="${map['SOCIAL_LOGIN_KEY']!=null}">
        <div id="useredit_top"></div>
			<div id="useredit_sub">
				<p>내 정보 수정</p>
			</div>	
            <!-- content-->
            <form method="post" name="usereditfrmSocial" action="<c:url value='/mypage/usereditSocial'/>">
            <div id="useredit_content">

                <!-- ID -->
                <div>
                    <h3 class="useredit_title"><label for="id">아이디(이메일)</label></h3>
                    <span class="box int_id" style="background-color: #e9e9e9;">
                        <input type="text" id="userid" name="id" class="int" value="${map['EMAIL']}" maxlength="20" readonly="readonly" disabled style="background-color: #e9e9e9;">
                    </span>
                    <span class="error_next_box"></span>
                </div>
                <!-- NAME -->
                <div>
                    <h3 class="useredit_title"><label for="name">이름</label></h3>
                    <span class="box int_name" style="background-color: #e9e9e9;">
                        <input type="text" id="name" class="int" name="name" value="${map['NAME']}" readonly="readonly" disabled style="background-color: #e9e9e9;">
                    </span>
                    <span class="error_next_box"></span>
                </div>
                
                <!-- hp -->
                <div>
                    <h3 class="useredit_title"><label for="phoneNo">휴대전화</label></h3>
                    <span class="box int_hp">
                        <input type="tel" id="hp" name="hp" class="int" value="${map['HP']}" maxlength="11" placeholder=" ' - ' 없이 전화번호를 입력해주세요">
                    </span>
                    <span class="error_next_box"></span>    
                </div>

                <div>
                    <h3 class="useredit_title"><label for="zipcode">우편번호  <input type="button" onclick="execZipcode()" id="btnZipcode" value="우편번호 찾기" name="btnZipcode"></label></h3>
                    <span class="box int_zipcode">
                        <input type="text" id="zipcode" name="zipcode" class="int" maxlength="20" value="${map['ZIPCODE']}" onclick="execZipcode()" placeholder="우편번호 수정하기" readonly="readonly">
                    	</span>
                    <span class="error_next_box"></span>
                </div>
                
                <div>
                    <h3 class="useredit_title"><label for="address">주소</label></h3>
                    <span class="box int_address">
                        <input type="text" id="address" name="address" class="int" maxlength="20" value="${map['ADDRESS']}" readonly="readonly">
                    </span>
                    <span class="error_next_box"></span>
                </div>
                
                <div>
                    <h3 class="useredit_title"><label for="addressDetail">상세주소</label></h3>
                    <span class="box int_addressDetail"> 
                        <input type="text" id="addressDetail" name="addressDetail" class="int" maxlength="30" value="${map['ADDRESS_DETAIL']}" placeholder="상세주소를 입력해주세요.">
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <div>
                    <h3 class="useredit_title"><label for="enterMethod">공동현관 출입방법</label></h3>
                    <span class="box int_entermethod">
                        <input type="text" id="entermethod" name="entermethod" class="int"  maxlength="30" value="${map['ENTERMETHOD']}" placeholder="공동현관 출입방법을 입력해주세요.">
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
       </c:if>
       
       <!-- 배송기사 폼 -->
	<c:if test="${map['USERS_CLASS_NO']==2}">
        <div id="useredit_top"></div>
			<div id="useredit_sub">
				<p>내 정보 수정</p>
			</div>	
            <!-- content-->
            <form method="post" name="deliveryeditfrm" action="<c:url value='/delivery/useredit'/>">
            <div id="useredit_content">

                <!-- ID -->
                <div>
                    <h3 class="useredit_title"><label for="id">아이디(이메일)</label></h3>
                    <span class="box int_id" style="background-color: #e9e9e9;">
                        <input type="text" id="userid" name="id" class="int" value="${map['EMAIL']}" maxlength="20" readonly="readonly" disabled style="background-color: #e9e9e9;">
                    </span>
                    <span class="error_next_box"></span>
                </div>
                <!-- NAME -->
                <div>
                    <h3 class="useredit_title"><label for="name">이름</label></h3>
                    <span class="box int_name" style="background-color: #e9e9e9;">
                        <input type="text" id="name" class="int" name="name" value="${map['NAME']}" readonly="readonly" disabled style="background-color: #e9e9e9;">
                    </span>
                    <span class="error_next_box"></span>
                </div>
                
                <!-- hp -->
                <div>
                    <h3 class="useredit_title"><label for="phoneNo">휴대전화</label></h3>
                    <span class="box int_hp">
                        <input type="tel" id="hp" name="hp" class="int" value="${map['HP']}" maxlength="11" placeholder=" ' - ' 없이 전화번호를 입력해주세요">
                    </span>
                    <span class="error_next_box"></span>    
                </div>

                <div>
                    <h3 class="useredit_title"><label for="office">지점</label></h3>
                    <span class="box int_office" style="width:76%; display: inline-block;">
                     <select name="officeSelect" id="officeSelect">
							<option value="강남지점">강남지점</option>
							<option value="강동지점">강동지점</option>
							<option value="강북지점">강북지점</option>
							<option value="강서지점">강서지점</option>
							<option value="관악지점">관악지점</option>
							<option value="광진지점">광진지점</option>
							<option value="노원지점">노원지점</option>
							<option value="동대문지점">동대문지점</option>
							<option value="서대문지점">서대문지점</option>
							<option value="송파지점">송파지점</option>
							<option value="양천지점">양천지점</option>
							<option value="용산지점">용산지점</option>
							<option value="종로지점">종로지점</option>
							<option value="중랑지점">중랑지점</option>
						</select>
                        <input type="text" id="office" name="office" class="int"  value="">
                    </span>
                    <span class="error_next_box"></span>
                </div>
                <div>
                    <h3 class="useredit_title"><label for="accHolder">계좌주</label></h3>
                    <span class="box int_accHolder">
                        <input type="text" id="accHolder" name="accHolder" class="int"  maxlength="10" value="">
                    </span>
                    <span class="error_next_box"></span>
                </div>
                <div>
                    <h3 class="useredit_title"><label for="accNum">계좌번호</label></h3>
                    <select name="bank" id="bank">
							<option value="국민은행">국민은행</option>
							<option value="기업은행">기업은행</option>
							<option value="NH농협은행">NH농협은행</option>
							<option value="NH농협은행">NH농협은행</option>
							<option value="신한은행">신한은행</option>
							<option value="우리은행">우리은행</option>
							<option value="카카오뱅크">카카오뱅크</option>
							<option value="토스뱅크">토스뱅크</option>
							<option value="하나은행">하나은행</option>
							<option value="한국씨티은행">한국씨티은행</option>
							<option value="SC제일은행">SC제일은행</option>
						</select>
                    <span class="box int_accNum" style="width:73%; display: inline-block;	">
                        <input type="text" id="accNum" name="accNum" class="int"  maxlength="20" value="">
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
       </c:if>
            
    </div>

</t:wrapper>