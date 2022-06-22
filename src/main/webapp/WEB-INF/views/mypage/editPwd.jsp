<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/layouts/user"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core"%>

<t:wrapper>
<style>

</style>
<script type="text/javascript">
	$(function(){
		$('form[name=editPwdfrm]').submit(function(){
		
			if($('#pwd').val().length<1){
				alert('비밀번호를 입력하세요.');
				$('#pwd').focus();
				event.preventDefault();
			}else if($('#newPwd').val().length<1){
				alert('새 비밀번호를 입력하세요.');
				$('#newPwd').focus();
				event.preventDefault();
			}else if($('#pwd').val()==$('#newPwd').val()){
				alert('동일한 비밀번호로 변경할 수 없습니다.');
				$('#newPwd2').focus();
				event.preventDefault();
			}else if($('#newPwd2').val().length<1){
				alert('새 비밀번호를 입력하세요.');
				$('#newPwd2').focus();
				event.preventDefault();
			}else if($('#newPwd').val()!=$('#newPwd2').val()){
				alert('새 비밀번호가 일치하지 않습니다.');
				$('#newPwd2').focus();
				event.preventDefault();
				}
			});
		});
</script>
	<!-- wrapper -->
	<div id="editPwd_wrapper">

		<div id="editPwd_top"></div>
		<div id="editPwd_sub">
			<p>비밀번호 변경</p>
		</div>

		<div id="editPwd_explain">
			<ul>
				<li><p>러너는 회원님의 중요한 개인정보를 관리자도 알 수 없도록 암호화하여 철저히 관리하고 있습니다.</p></li>
				<li><p>개인정보 보호를 위해 동일한 숫자반복 등과 같이 다른사람이 쉽게 알아낼 수 있는 비밀번호는
						사용하지 마십시오.</p></li>
				<li><p>개인정보는 보안 강화를 위하여 비밀번호의 대소문자를 구분하고 있습니다. 비밀번호 대소문자를
						확인하시고 입력해주세요.</p></li>
				<li><p>비밀번호는 주기적으로 변경해 주시기 바랍니다.</p></li>
				<li><p>비밀번호는 8~16자 이내, 숫자/특수문자/영문 대소문자를 사용해주세요.</p></li>
			</ul>
		</div>

		<!-- content-->
		<form method="post" name="editPwdfrm"
			action="<c:url value='/mypage/editPwd'/>">
			<div id="editPwd_content">

				<div>
					<h3 class="editPwd_title">
						<label for="pwd">현재 비밀번호</label>
					</h3>
					<span class="box int_pass"> 
					<input type="password" id="pwd"
						name="pwd" class="int" maxlength="20"> 
					<span id="alertTxt">사용불가</span>
						<img src="../images/m_icon_pass.png" id="pwd_img1" class="pswdImg">
					</span> <span class="error_next_box"></span>
				</div>
				<div>
					<h3 class="editPwd_title">
						<label for="newPwd">새 비밀번호</label>
					</h3>
					<span class="box int_pass"> 
					<input type="password" id="newPwd"
						name="newPwd" class="int" maxlength="20"> 
					<span id="alertTxt">사용불가</span>
						<img src="../images/m_icon_pass.png" id="pwd_img1" class="pswdImg">
					</span> <span class="error_next_box"></span>
				</div>
				<div>
					<h3 class="editPwd_title">
						<label for="newPwd2">새 비밀번호 확인</label>
					</h3>
					<span class="box int_pass"> 
					<input type="password" id="newPwd2"
						name="newPwd2" class="int" maxlength="20"> <span id="alertTxt">사용불가</span>
						<img src="../images/m_icon_pass.png" id="pwd_img1" class="pswdImg">
					</span> <span class="error_next_box"></span>
				</div>

				<!-- editPwd BTN-->
				<div class="editPwd_btn_area">
					<button type="submit" id="btneditPwd">
						<span>변경하기</span>
					</button>
				</div>
			</div>
		</form>
		<!-- content-->
	</div>
	<!-- wrapper -->
</t:wrapper>