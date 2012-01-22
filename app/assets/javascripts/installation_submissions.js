$(document).ready(function(){

	$("#for-sale").css("display","none");

	
    $("#installation_submission_for_sale").change(function(){
       if($(this).is(":checked")){
         $('#for-sale').show("slow");    
       }else {
         $('#for-sale').hide("slow");
       }

    });


});