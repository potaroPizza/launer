/**
 * paymentdetails.jsp 결제내역 페이지
 */
 
 	$(function(){
		$("#startDay").datepicker({
			dateFormat:'yy-mm-dd',
			changeYear:true,
			dayNamesMin:['일','월','화','수','목','금','토'],
			monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
		});
		$("#endDay").datepicker({
			dateFormat:'yy-mm-dd',
			changeYear:true,
			dayNamesMin:['일','월','화','수','목','금','토'],
			monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
		});
	});
	$(function(){
		
		$('#btMonth1').click(function(){
        	$.setDate(1, 'M');	
        });
        
        $('#btMonth3').click(function(){
        	$.setDate(3, 'M');
        });
        
        $('#btMonth6').click(function(){
        	$.setDate(6, 'M');
        });
        $("#paysubmit").click(function(){
			if($("#startDay").val().length<1){
				alert("검색할 결제 시작일을 입력하세요");
				$("#startDay").focus();
				return false;
			}
			if($("#endDay").val().length<1){
				alert("검색할 결제 종료일을 입력하세요");
				$("#endDay").focus();
				return false;
			}
		});
        $.setDate = function(term, type){
    		
    		var str=$('#endDay').val().split('-');
    		var d = new Date(str[0], str[1]-1, str[2]);
    		if(type=="D"){
    			d.setDate(d.getDate()-term);	
    		}else if(type=='M'){
    			d.setMonth(d.getMonth()-term);
    		}
    		
    		$('#startDay').val($.findDate(d));
    	}	
    	
    	$.findDate = function(date){
    	     return date.getFullYear()+"-" + $.formatDate(date.getMonth()+1) +"-"
             	+ $.formatDate(date.getDate());
       	}
       
    	$.formatDate = function(d){
    		if(d<10) 
    			d="0" + d;
    		
    		return d;
    	}
    	
    	
	});
	
	function pageFunc(curPage){
		$('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();
	}
	
	
		