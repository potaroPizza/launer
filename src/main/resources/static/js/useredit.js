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
                document.getElementById("addressDetail").focus();
            }
        }).open();
    }
	function validate_hp(hp){
	var pattern = new RegExp(/([01]{2})([01679]{1})([0-9]{3,4})([0-9]{4})/);
	return pattern.test(hp);
}
	

	$(function(){
		$('form[name=usereditfrm]').submit(function(){
			if($("#pwd").val().length<1) {
				alert("비밀번호를 입력하세요");
				$("#pwd").focus();
				return false;
			}else if($("#hp").val().length<1) {
				alert("전화번호를 입력하세요");
				$("#hp").focus();
				return false;
			}else if(!validate_hp($('#hp').val())){
				alert("전화번호 형식이 맞지 않습니다.");	
				$("#hp").focus();
				return false;
			}
		});
		
	});