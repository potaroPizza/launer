<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="../inc/top.jsp" %>
<script type="text/javascript"
	src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>

<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function execZipcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = '';

                if (data.userSelectedType === 'R') { // 도로명 주소
                    addr = data.roadAddress;
                } else { // 지번주소
                    addr = data.jibunAddress;
                }

                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
</script>

<style>
body {
    background: #f5f6f7;
}

#useredit_top{
	width: 100%;
	height: 120px;
}

#useredit_wrapper {
    width:1200px;
    margin: 0 auto;
}

#useredit_content {
    position: absolute;
    left: 50%;
    transform: translate(-50%);
    width: 460px;
}
#useredit_sub{
	font-weight: bold;
	font-size: 30px;
	margin-left: 50px;
	margin-bottom: 50px;
}




/* 입력폼 */


h3 {
    margin: 19px 0 8px;
    font-size: 14px;
    font-weight: 700;
}


.box {
    display: block;
    width: 100%;
    height: 51px;
    border: solid 1px #dadada;
    padding: 10px 14px 10px 14px;
    box-sizing: border-box;
    background: #fff;
    position: relative;
    border-radius: 7px;
}

.int {
    display: block;
    position: relative;
    width: 100%;
    height: 29px;
    border: none;
    background: #fff;
    font-size: 15px;
}

.box.int_id {
    padding-right: 110px;
}

.box.int_pass {
    padding-right: 40px;
}

.box.int_pass_check {
    padding-right: 40px;
}


.pswdImg {
    width: 18px;
    height: 20px;
    display: inline-block;
    position: absolute;
    top: 50%;
    right: 16px;
    margin-top: -10px;
    cursor: pointer;
}



/* 에러메세지 */

.error_next_box {
    margin-top: 9px;
    font-size: 12px;
    color: red;    
    display: none;
}

#alertTxt {
    position: absolute;
    top: 19px;
    right: 38px;
    font-size: 12px;
    color: red;
    display: none;
}

/* 버튼 */

.useredit_btn_area {
    margin: 30px 0 91px;
}

#btnuseredit {
    width: 100%;
    padding: 21px 0 17px;
    border: 0;
    cursor: pointer;
    color: #fff;
    background-color: #045FB4;
    font-size: 20px;
    font-weight: 400;
    border-radius: 7px;
}
</style>
<script>
	
</script>

<body>

        <!-- wrapper -->
        <div id="useredit_wrapper">
        	
        <div id="useredit_top"></div>
			<div id="useredit_sub">
				<p>내 정보 수정</p>
			</div>	
            <!-- content-->
            <form method="post"
				action="<c:url value=''/>">
            <div id="useredit_content">

                <!-- ID -->
                <div>
                    <h3 class="useredit_title">
                        <label for="id">아이디(이메일)</label>
                    </h3>
                    <span class="box int_id">
                        <input type="text" id="id" class="int" maxlength="20" readonly="readonly">
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- PW1 -->
                <div>
                    <h3 class="useredit_title"><label for="pswd1">비밀번호</label></h3>
                    <span class="box int_pass">
                        <input type="text" id="pswd1" class="int" maxlength="20">
                        <span id="alertTxt">사용불가</span>
                        <img src="../images/m_icon_pass.png" id="pswd1_img1" class="pswdImg">
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- PW2 -->
                <div>
                    <h3 class="useredit_title"><label for="pswd2">비밀번호 재확인</label></h3>
                    <span class="box int_pass_check">
                        <input type="text" id="pswd2" class="int" maxlength="20">
                        <img src="../images/m_icon_check_disable.png" id="pswd2_img1" class="pswdImg">
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- NAME -->
                <div>
                    <h3 class="useredit_title"><label for="name">이름</label></h3>
                    <span class="box int_name">
                        <input type="text" id="name" class="int" readonly="readonly">
                    </span>
                    <span class="error_next_box"></span>
                </div>
                
                <!-- MOBILE -->
                <div>
                    <h3 class="useredit_title"><label for="phoneNo">휴대전화</label></h3>
                    <span class="box int_mobile">
                        <input type="tel" id="mobile" class="int" maxlength="11" placeholder=" ' - ' 없이 전화번호 입력해주세요">
                    </span>
                    <span class="error_next_box"></span>    
                </div>

                <div>
                    <h3 class="useredit_title"><label for="zipcode">우편번호</label></h3>
                    <span class="box int_zipcode">
                        <input type="text" id="zipcode" class="int" maxlength="20" onclick="execZipcode()" readonly="readonly">
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
                        <input type="text" id="enterMethod" class="int" maxlength="30" placeholder="공동현관 출입방법 입력">
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
    
</body>
<script type="text/javascript"
	src="<c:url value='/js/useredit.js'/>"></script>

