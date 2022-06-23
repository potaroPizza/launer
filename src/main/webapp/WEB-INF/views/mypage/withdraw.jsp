<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/layouts/user" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<t:wrapper>
<script type="text/javascript" 
	src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<style>
	
</style>
<script type="text/javascript">
	$(function(){
		
		$("#withdraw-btn").click(function() {
			if($('#pwd').val().length<1){
				alert('비밀번호를 입력해주세요');
				return false;
			}
			if($('#chk:checked').length<1){
				alert('탈퇴 유의사항을 확인하고 동의해 주세요.');
				return false;
			}

			$('#exampleModal').modal('show');
		});

		$("#withDrawResult-btn").click(function() {
			$("form[name=withdrawFrm]").submit();
		});
	});
	
	
</script>

<div id="withdraw-wrap">
	<div class="withdraw-top"></div>
	<div class="withdraw-title">
		<h2>회원 탈퇴</h2>
		</div>
	<div class="withdraw-explain">
		<p><span style="font-size: 25px; color: black;">${vo.name}님</span> 탈퇴하시겠습니까?</p> 
		<p>지금까지 저희 러너 서비스를 이용해주셔서 감사합니다.</p>
		<p><span>탈퇴하기 전 아래 유의사항을 반드시 확인해주세요.</span></p>
		<ul>
			<!-- 개인 회원 탈퇴 유의사항 -->
				<li><p>탈퇴하신 아이디는 <span>복구가 불가능</span>하며, 탈퇴후 동일한 아이디로 신규가입이 어려울 수 있습니다.<p></li>	
				<li><p>회원탈퇴 시 등록한 게시물은 삭제되지 않으므로, 삭제를 원하시면 회원탈퇴 전에 삭제해 주시기 바랍니다.</p></li>
				<li><p>보유하신 포인트와 결제내역,이용내역이 모두 삭제되며, <span>삭제된 데이터는 복구되지 않습니다.</span></p></li>
			<!-- 배송기사 탈퇴 유의사항 -->
				<li><p>탈퇴하신 아이디는 <span>복구가 불가능</span>하며, 탈퇴후 동일한 아이디로 신규가입이 어려울 수 있습니다.<p></li>	
				<li><p>회원정보, 배송정보 기록이 모두 삭제되며, <span>삭제된 데이터는 복구되지 않습니다.</span></p></li>
		</ul>
	</div>
	<form name="withdrawFrm" method="post" action="<c:url value='/mypage/withdraw'/>">
		<p>본인확인을 위해 비밀번호를 입력해 주세요.</p>
		<div class="inputBx">
		<div class="group-input">
           <!-- <label for="userid">아이디 *</label> -->
           <input type="text" id="userid" class="inputText" name="no" 
           	value="${vo.name}" size=30 readonly="readonly">
       </div>
       <div class="group-input">
           <!-- <label for="pwd">비밀번호 *</label> -->
           <input type="password" id="pwd" class="inputText" name="pwd" size=30;
           placeholder="비밀번호 입력">
       </div>
       </div>
        <div>
        </div>
		<div class="btnWrap">
        	<input type="checkbox" id="chk">&nbsp;유의 사항을 모두 확인했으며, 이에 동의합니다.<br>
		</div>
		<!-- Button trigger modal -->
		<div class="mypage_withdraw_btn">
			<button id="withdraw-btn" type="button" class="btn btn-dark">탈퇴하기</button>
		</div>
		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">탈퇴하기</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body ">정말 러너를 탈퇴 하시겠습니까?</div>
					<div class="modal-footer">
						<button type="button" id="withDrawResult-btn" class="btn btn-dark">탈퇴하기</button>
						<button type="button" class="btn btn-dark"
							data-bs-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>
</t:wrapper>



