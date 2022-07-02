/**
 * withdraw.jsp 탈퇴화면 페이지
 */
 
 	$(function(){
		
		$("form[name=withdrawFrm] #withdraw-btn").click(function() {
			if($('form[name=withdrawFrm] #pwd').val().length<1){
				alert('비밀번호를 입력해주세요');
				return false;
			}
			if($('form[name=withdrawFrm] #chk:checked').length<1){
				alert('탈퇴 유의사항을 확인하고 동의해 주세요.');
				return false;
			}

			$('form[name=withdrawFrm] #exampleModal').modal('show');
		});

		$("form[name=withdrawFrm] #withDrawResult-btn").click(function() {
			$("form[name=withdrawFrm]").submit();
		});
		
		$("form[name=withdrawSocialFrm] #withdraw-btn").click(function() {
			
			if($('form[name=withdrawSocialFrm] #chk:checked').length<1){
				alert('탈퇴 유의사항을 확인하고 동의해 주세요.');
				return false;
			}

			$('form[name=withdrawSocialFrm] #exampleModal').modal('show');
		});

		$("form[name=withdrawSocialFrm] #withDrawResult-btn").click(function() {
			$("form[name=withdrawSocialFrm]").submit();
		});
	});