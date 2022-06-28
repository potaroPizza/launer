$(function(){
	$(document).ready(function() {
        $(".laundrytab").hide();  
        
        $(".pricelist_tab li:eq(0)").addClass("on");
        $(".laundrytab:eq(0)").show();

        $(".pricelist_tab li").click(function() {

            $(".pricelist_tab li").removeClass("on"); 
            $(this).addClass("on");
            $(".laundrytab").hide(); 

            var activeTab = $(this).find("a").attr("href");
            $(activeTab).fadeIn();  
            return false;
        });
    });
});
