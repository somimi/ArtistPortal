$(document).ready(function(){
	
	if($("#installation_submission_for_sale").is(":checked")){
      $('#for-sale').show();    
    }else {
      $('#for-sale').hide();
    }
	
    $("#installation_submission_for_sale").change(function(){
       if($(this).is(":checked")){
         $('#for-sale').show("slow");    
       }else {
         $('#for-sale').hide("slow");
       }

    });


});