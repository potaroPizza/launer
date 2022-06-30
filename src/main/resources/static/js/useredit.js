/**useredit.jsp  회원정보 수정페이지 
 * 
 */
 function isPassword(asValue) {
	var regExp = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
 
	return regExp.test(asValue); // 형식에 맞는 경우 true 리턴
}

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
	
	$(function(){		
			$('#hp').keyup(function(){
				if(!validate_hp($('#hp').val())){
					$('.error_next_box').eq(3).text("전화번호 형식이 맞지 않습니다.").css("color","red");
				}else{
					$('.error_next_box').eq(3).text("")
				}
			
			})
			$('#pwd').keyup(function(){
				if(!isPassword($('#pwd').val())){
					$('.error_next_box').eq(1).text("비밀번호를 입력해주세요.").css("color","red");
				}else{
					$('.error_next_box').eq(1).text("")
				}
			
			})
			$('#addressDetail').keyup(function(){
				if($('#addressDetail').val()==""){
					$('.error_next_box').eq(6).text("상세주소를 입력해주세요.").css("color","red");
				}else{
					$('.error_next_box').eq(6).text("")
				}
			})
			$('#entermethod').keyup(function(){
				if($('#entermethod').val()==""){
					$('.error_next_box').eq(7).text("공동현관 출입방법을 입력해주세요.").css("color","red");
				}else{
					$('.error_next_box').eq(7).text("")
				}
			})
		});