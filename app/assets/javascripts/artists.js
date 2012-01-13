$(document).ready(function(){
	
	if ($("#shipping-check").is(":checked"))
	{
		$("#shipping-address").hide();
	}
	
	if ($("#represent-check").not("checked"))
	{
		$("represent").hide();
	}

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

   $("#represent-check").click(function(){

	// If checked
	if ($("#represent-check").is(":checked"))
	{
		
		$("#represent").show("slow");
	}
	else
	{
		$("#represent").hide("slow");
	}
  });

});