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
    
    
    $("#plusI").hide();
    $(".addBtnWrap").hover(function(){
	    $(this).css("background", "#D7E6FF");
    $("#plusI").show();
	    
    },function(){
        $(this).css("background", "#FFF");
    $("#plusI").hide();
    });
    
   /* $($("#XDel")).hide();
    $(this).hover(function(){
	    $(this).css("background", "#D7E6FF");
    $(this).show();
	    
    },function(){
        $(this).css("background", "#FFF");
    $(this).hide();
    });
*/
    



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
	


			$('#orderAgree').hide();
		
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


}); //jquery






