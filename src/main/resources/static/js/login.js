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
  });
  