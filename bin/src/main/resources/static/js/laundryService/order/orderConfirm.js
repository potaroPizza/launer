 $(function(){
    $('#flexCheckDefault').change(function(){
		if($(this).is(":checked")){
			console.log("동의");		
			$('#orderAgree').show();
			$('#orderDisagree').hide();
		}else{
			console.log("비동의");
			$('#orderDisagree').show();
			$('#orderAgree').hide();	
		}
	});
	
    $("#orderInfo-tac-agreeBtn").click(function(){
        $('#staticBackdrop').modal("hide");

    });
});




$(document).ready(function(){
	
	//수거시간계산
	var tDate = new Date();
	tDate.setHours(tDate.getHours()+6);
	
	function getYmd10() {
		  var d = new Date();
		  d.setHours(tDate.getHours()+24);
	  
	  return d.getFullYear() + "년 " + (d.getMonth()+1) + "월 " + d.getDate() + "일 " + d.getHours() + "시 ";
	}
	
    $('#orderAgree').hide();
    $('#orderDisagree').show();
    $('#shortPoint').hide();
	$('#take-date').text(getYmd10()+"이전");
    

});
