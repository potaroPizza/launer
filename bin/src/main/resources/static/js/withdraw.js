/**
 * withdraw.jsp 탈퇴화면 페이지
 */
 
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