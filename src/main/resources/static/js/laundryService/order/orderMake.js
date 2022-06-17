
$(function() {
    $(".orderInfo-guide a").hover(function(){
        $(this).find(".hover-btn").stop().animate({
            width: "100%"
        }, 300, "swing");
        $(this).find("p").stop().animate({color: "#fff"}, 400);
    },function() {
        $(this).find(".hover-btn").stop().animate({
            width: "0"
        }, 300, "swing");
        $(this).find("p").stop().animate({color: "#000"}, 400);
    });
    
    /*$("select[id='order-daily']").change(function(){
  		console.log($("select[id='order-daily'] option:selected").text()); //text값 가져오기
	
  		
});*/

$("select[id='order-daily']").change(function () {
    var selectedOptionsDaily = [];
    $("select[id='order-daily'] option:selected").each(function(){
        var value = $(this).val();
        if($.trim(value)){
            selectedOptionsDaily.push(value);
        }
    });
    console.log(selectedOptionsDaily);
});

$("select[id='order-indivisual']").change(function () {
    var selectedOptionsIndivisual = [];
    $("select[id='order-indivisual'] option:selected").each(function(){
        var value = $(this).val();
        if($.trim(value)){
            selectedOptionsIndivisual.push(value);
        }
    });
    console.log(selectedOptionsIndivisual);
});

	$("#orderInfo-tac-agreeBtn").click(function(){
	        $('#staticBackdrop').modal("hide");
	
	});
	
		
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
	
		
		
		
	
	
	//"flexCheckDefault"
	/*var agreed = false;
	if ($('#flexCheckDefault').is(':checked')){
		span.show();
		console.log("동의");
	}else{
		span.hide();
	}
	
	$('#submit').click(function(){
		if(!$(#flexCheckDefault).is(':checked')){
			alert('약관에 동의해야 회원가입을 진행할 수 있습니다.');
			event.preventDefault();
			$('#staticBackdrop').modal('show');
		}
		
	});*/
}); //jquery
    
    
    
  /*  var selected = [];
    $("select[id='order-daily']").change(function() {
    	selected[$(this).val()] = $(this).val(); 
    	
    	console.log(selected);   	
});*/

     /*var selected = [];
     $("select[id='order-daily']").change(function(){
         $('#order-daily :selected').each(function(){
             selected[$(this).val()]=$(this).text();
             });
         console.log(selected);
     });*/

$(document).ready(function(){
    $(".mul-select").select({
            placeholder: "상품선택", //placeholder
            tags: true,
            tokenSeparators: ['/',',',';'," "] 

	});
	
	$('#orderAgree').hide();
	$('#orderDisagree').hide();
	

	
})





