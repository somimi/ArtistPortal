$(document).ready(function(){
	
	$("#shipping-co").hide();
	
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


  $("#artist_return_arrangements").change(function(){
	
	var selectValue;
	
	selectValue = $("#artist_return_arrangements").val();
	
	if (selectValue == "I would prefer to have my shipping account directly billed")
	{
		$("#shipping-co").show("slow");
	}
	else
	{
		$("#shipping-co").hide("slow");
	}
	


	
  });

});