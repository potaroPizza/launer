<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script type="text/javascript">
	$(function(){
		$('#submit').click(function(){
			if($('#username').val().length<1){
				alert('이름을 입력하세요');
				$('#username').focus();
				event.preventDefault();
			}else if($('#pwd').val()!=$('#con-pwd').val()){
				alert('비밀번호가 일치하지 않습니다.');
				$('#con-pwd').focus();
				event.preventDefault();
			}else if($('#hp').val().length<1){
				alert('전화번호를 입력하세요');
				$('#hp').focus();
				event.preventDefault();
			}else if(!validate_phone($('#hp').val())
				alert('전화번호는 숫자만 가능합니다.');
				$('#hp').focus();
				event.preventDefault();				
			}
		});
	});
	
</script>

<div class="register-form margin_100">
	<div class="filter-widget">
		<h4 class="fw-title center">내 정보 수정</h4>
	</div>
	<form method="post"
		action="<c:url value='/indivMypage/indivMypageEdit.do'/>">
		<div class="group-input">
			<label for="username">이름 *</label> <input type="text" id="username"
				class="col-lg-12" name="userName" value="${vo.userName}">
		</div>
		<div class="group-input">
			<label for="userid">아이디(이메일) *</label> <input type="text" id="userid"
				class="col-lg-12" name="userId" value="${vo.userId}"
				readonly="readonly">
		</div>
		<div class="group-input">
			<label for="pwd">비밀번호 *</label> <input type="password" id="pwd"
				class="col-lg-12" name="userPassword">
		</div>
		<div class="group-input">
			<label for="con-pwd">비밀번호 확인 *</label> <input type="password"
				id="con-pwd" class="col-lg-12">
		</div>

		<div class="group-input">
			<label for="hp">전화번호 *</label> <input type="text" id="hp"
				class="col-lg-4" maxlength="11" name="userHp" value="${vo.userHp }">
		</div>
		<div class="group-input">
			<h4>배송 정보</h4>
			<label for="zipcode">우편번호</label> <input type="text" id="zipcode"
				placeholder="우편번호" class="col-lg-7" name="userZipcode"
				value="${vo.userZipcode }" ReadOnly> <input type="button"
				onclick="execZipcode()" value="우편번호 찾기"
				class="col-lg-4 site-btn margin_left"><br>
			<br>주소 <input type="text" id="address" placeholder="주소"
				name="userAddress" value="" ReadOnly><br>
			<br>상세주소 <input type="text" id="detailAddress" placeholder="상세주소"
				name="userAddressdetail" value=""><br>
			<br>공동현관 출입<input type="text" id="" placeholder="공동현관출입"
				name="userEntrance door" value=""><br>
		</div>

		<button type="submit" class="site-btn register-btn" id="submit">수정</button>
	</form>
	<div class="withdraw btn">
	<a href="#"> 회원 탈퇴</a>
	
	</div>


</div>


