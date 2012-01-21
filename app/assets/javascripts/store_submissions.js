$(document).ready(function(){
	
	$("#store-type-other").hide();
	
	$("#store_submission_type").change(function(){
		var val = $(this).val();
		
		
		
		if (val == "Other")
		{
			$("#store-type-other").show("slow");
		}
		else
		{
			$("#store-type-other").hide("slow");
		}

		 
	});
	
});