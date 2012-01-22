$(document).ready(function(){
	
	$("#store-type-other").hide();
	$("#presentation-other").hide();
	
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
	
	$("#store_submission_presentation").change(function(){
		var val = $(this).val();
		
		
		
		if (val == "Other")
		{
			$("#presentation-other").show("slow");
		}
		else
		{
			$("#presentation-other").hide("slow");
		}

		 
	});
	
});