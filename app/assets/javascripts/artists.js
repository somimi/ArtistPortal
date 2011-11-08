$(document).ready(function(){

   $("#shipping-check").click(function(){

	// If checked
	if ($("#shipping-check").is(":checked"))
	{
		
		$("#shipping-address").hide("slow");
	}
	else
	{
		$("#shipping-address").show("slow");
	}
  });

});