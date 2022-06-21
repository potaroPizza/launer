<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../inc/top.jsp"%>
<link rel="stylesheet" href="<c:url value="/css/user/findIdPwd.css"/>" />
<link rel="stylesheet" href="<c:url value="/css/user/userfooter.css"/>" />

<body>
<div id="findIdPwdWrap">
	<div class="findIdPwdsubWrap">
		<div class="titleArea">
			<h2>이메일 찾기</h2>
			<ul>
				<li>가입하신 방법에 따라 이메일 찾기가 가능합니다.</li>
	        	<li>본인 이름과 가입하실때 입력한 전화번호를 입력하시면 이메일주소를 알려드립니다.</li>
    		</ul>
		</div>
		<form name="findIdfrm" method="post" 
			action="<c:url value='/user/findId'/>">
				<div class="findIdPwdsubWrap">
					<div id="findIdPwdbox">
			            <p class="memberType"><strong>회원유형</strong>
			            	<select id="searchType" name="searchType">
								<option value="general" selected="selected">일반회원</option>
								<option value="driver">배송 기사 회원</option>
							</select>
						</p>
						<p id="name_view" style=""><strong id="name_lable">이름</strong>
							<input id="name" name="name" type="text">
						</p>
						<p id="mobile_view"><strong>휴대폰 번호</strong> 
							<input id="hp1" name="hp1" maxlength="3" type="text"> - 
							<input id="hp2" name="hp2" maxlength="4" type="text"> -
							<input id="hp3" name="hp3" maxlength="4" type="text">
						</p>
						<div class="findIdPwdBtnWrap">
                			<button class="findIdPwdBtn">확인</button>
            			</div>
					</div>
				</div>
		</form>
	</div>
</div>
<footer id="userfooterWrap">
	<div class="userfooterSubwrap">
		<div id="userFooter">
			<div class="userFooterLeft">
				<div id="userFooterMenu">
	                <a href="/user/agreement">이용약관</a>
	                <a href="/user/privacy">개인정보취급방침</a>
	                <a href="/user/guide">이용안내</a>
	                <a>고객센터</a>
            	</div>
            	<div id="userFooterCompany">
	                <p>(주)러너<span class="line">|</span>대표 : 정지효<span class="line">|</span>
	                	<span>TEL 02-3000-3000</span><span class="line"></span>FAX 02-3000-3000 
	                	<span class="line"></span></p>
	                <p>본사 주소 : 서울특별시 서대문구 신촌로 141, 202호 </p>
	                <p>세탁센터 주소 : 서울특별시 서대문구 신촌로 141, 러너 세탁 센터 </p>
	                <p>사업자등록번호 : 123-45-67890<span class="line">|</span>통신판매업신고번호 : 제 2023-서울서대문-0202호
	                	<span class="line">|</span>개인정보관리책임자 : 송정인</p>
	                <p>대표 메일, 제휴문의  laundryavengers@ezen.co.kr </p>
	                <p>Copyright © 런드리 어벤져스. All rights reserved.</p>
            	</div>
			</div>
			<div class="userFooterRight">
	            <div id="userFooterBox">
	                <p class="title">고객센터</p>
	                <p class="Tel"><span class="num">02&nbsp;3000&nbsp;3000</span></p>
	            </div>
	            <div id="userFooterInfo">
	                <p><span>평일</span>AM  09:30 - PM 06:00</p>
	                <p><span>점심</span>AM  13:20 - PM 14:10</p>
	                <p><span>휴무</span>토 / 일 / 공휴일</p>
	                <br> 
	                <p>수거 배송비 / 이젠은행 000-123456-78910 (주)러너</p> 
	            </div>
        	</div>
		</div>
	</div>
</footer>
</body>

</html>