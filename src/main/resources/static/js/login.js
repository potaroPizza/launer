$(function(){
	//로그인 탭
	$("#memberBtn").click((e) => {
	e.preventDefault();
	$("#memberBtn").addClass('on');
	$('#driverBtn').removeClass('on');
	$("#loginDriver").removeClass('on');
	$("#loginGeneralMember").addClass('on');
	});
	
	$("#driverBtn").click((e) => {
	e.preventDefault();
	$("#driverBtn").addClass('on');
	$("#memberBtn").removeClass('on');
	$("#loginGeneralMember").removeClass('on');
	$("#loginDriver").addClass('on');
	});
	
	//배송기사 로그인시 엔터(안됨ㅠㅠ)
	$("#driverLoginBtn").submit(function(){
		$("#userLogintBtn").submit;
		event.preventDefault();
	});
});
  