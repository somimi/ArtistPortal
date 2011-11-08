$(document).ready(function(){

	$("#limited-edition").css("display","none");
   $("#li-check").click(function(){

	// If checked
	if ($("#li-check").is(":checked"))
	{
		
		$("#limited-edition").show("slow");
	}
	else
	{
		$("#limited-edition").hide("slow");
	}
  });

	$("#three-dee").css("display","none");
   $("#dim-check").click(function(){

	// If checked
	if ($("#dim-check").is(":checked"))
	{
		
		$("#three-dee").show("slow");
	}
	else
	{
		$("#three-dee").hide("slow");
	}
  });

});