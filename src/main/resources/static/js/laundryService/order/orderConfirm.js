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
	
	$('#submit').click(function(){
		if(!$('#flexCheckDefault').is(':checked')){
			alert('약관에 동의해주세요.');
			event.preventDefault();
			$('#staticBackdrop').modal("show");
		}
		
		
	});

    $("#orderInfo-tac-agreeBtn").click(function(){
        $('#staticBackdrop').modal("hide");

    });


});



$(document).ready(function(){

    $('#orderAgree').hide();
    $('#orderDisagree').show();

});
