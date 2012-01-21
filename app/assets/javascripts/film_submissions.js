$(document).ready(function(){
	
	$("#delivery-physical").hide();
	$("#delivery-upload").hide();

	$("input[name$='film_submission[delivery_type]']").click(function(){
		
		var radio_value = $(this).val();
		
		if (radio_value == 'URL') {
			$("#delivery-url").show("slow");
			$("#delivery-physical").hide("slow");
			$("#delivery-upload").hide("slow");
		}
		else if (radio_value == 'Physical Mail') {
			$("#delivery-url").hide("slow");
			$("#delivery-physical").show("slow");
			$("#delivery-upload").hide("slow");
		}
		else if (radio_value == 'Upload') {
			$("#delivery-url").hide("slow");
			$("#delivery-physical").hide("slow");
			$("#delivery-upload").show("slow");
		}
		 
	});
	
});