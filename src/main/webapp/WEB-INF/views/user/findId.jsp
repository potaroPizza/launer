<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/layouts/user" %>

<t:wrapper>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<link rel="stylesheet" href="<c:url value="/css/user/findIdPwd.css"/>"/>
<script type="text/javascript" src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">
$(function(){
	const $modal = $("#modal-wrap");
	$("#findIdBtn").click(function(){
		$modal.css("display", "flex").animate({
			opacity: 1
		}, 300);
		return false;
	});
	$("#confirm").click(function(){
    	modalClose();
	});
	$("#close").click(function(){
    	modalClose();
	});
	function modalClose(){
		$modal.animate({
			opacity: 0
		}, 300, function() {
			$modal.css("display", "none");
		});
	}
});
</script>
<div id="findIdPwd_wrap">
	<div id="modal-wrap">
		<div class="findId-modal">
			<div class="modalhead">
			    <h2 class="head-title">Launer</h2>
			</div>
			<div class="modal-body">
				<div class="body-content">
					<div class="body-titlebox">
					<span class="body-title">이메일 찾기 결과</span>
					</div>
					<div class="body-contentbox">
					<span>${result}</span>
					</div>
				</div>
			</div>
			<div class="modal-foot">
			<span class="modal-btn confirm" id="confirm">확인</span>
			<span class="modal-btn close" id="close">창 닫기</span>
			</div>
		</div>
	</div>
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
								<option value=1 selected="selected">일반회원</option>
								<option value=2 >배송기사 회원</option>
							</select>
						</p>
						<p id="name_view" style=""><strong id="name_lable">이름</strong>
							<input type="text" name="name" id="name">
						</p>
						<p id="mobile_view"><strong>휴대폰 번호</strong> 
							<input type="text" name="hp" id="hp" maxlength="11" 
								placeholder="-를 제외하고 입력해주세요">
						</p>
						<div class="findIdPwdBtnWrap">
                			<button class="findIdPwdBtn" id="findIdBtn">확인</button>
            			</div>
					</div>
				</div>
		</form>
	</div>
</div>
</t:wrapper>