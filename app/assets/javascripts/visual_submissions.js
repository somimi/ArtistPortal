$(document).ready(function(){
	
	$('.best_in_place').best_in_place()

	$("#limited-edition").css("display","none");
	$("#limited-edition-1").css("display", "none")
	$("#notes-show").css("display", "none")
	$("#quality-notes").css("display", "none")
	$("#display-notes").css("display", "none")
	$("#packing-show").css("display", "none")
	
	if ($("li-check").is(":checked"))
	{
		$("#limited-edition").css("display", "block")
		$("#limited-edition-1").css("display", "block")
	}

	$("input[name$='visual_submission[edition]']").click(function(){

	var radio_value = $(this).val();

	if (radio_value == 'Original') {
		$("#limited-edition").hide("slow");
		$("#limited-edition-1").hide("slow");
	}
	else if (radio_value == 'Open Edition') {
		$("#limited-edition").hide("slow");
		$("#limited-edition-1").hide("slow");
	}
	else if (radio_value == 'Limited Edition') {
		$("#limited-edition").show("slow");
		$("#limited-edition-1").show("slow");
	}

	});
	
   $("#notes-box").click(function(){

	// If checked
	if ($("#notes-box").is(":checked"))
	{

		$("#notes-show").show("slow");
	}
	else
	{
		$("#notes-show").hide("slow");
	}
  });

   $("#display-check").click(function(){

	// If checked
	if ($("#display-check").is(":checked"))
	{

		$("#display-notes").show("slow");
	}
	else
	{
		$("#display-notes").hide("slow");
	}
  });

   $("#packing-check").click(function(){

	// If checked
	if ($("#packing-check").is(":checked"))
	{

		$("#packing-show").show("slow");
	}
	else
	{
		$("#packing-show").hide("slow");
	}
  });

	$("#visual_submission_quality").change(function(){

	var selectValue;

	selectValue = $("#visual_submission_quality").val();
	
	if (selectValue == "Damaged"){
		$("#quality-notes").show("slow");
	}
	else if(selectValue == "Perfect"){
		$("#quality-notes").hide("slow");
	}

	switch (selectValue)
	{
		case "Sculpture":
				$("#dim-check").prop("checked", true).trigger("change");
				break;
		case "Jewelry":
		        $("#dim-check").prop("checked", true).trigger("change");
				break;
		case "Ceramics":
				$("#dim-check").prop("checked", true).trigger("change");
				break;
		case "Textile":
				$("#dim-check").prop("checked", true).trigger("change");
				break;
	    default:
				$("#dim-check").prop("checked", false).trigger("change");


	}


  });

  $("#visual_submission_medium").change(function(){
	
	var selectValue;
	
	selectValue = $("#visual_submission_medium").val();
	
	switch (selectValue)
	{
		case "Sculpture":
				$("#dim-check").prop("checked", true).trigger("change");
				break;
		case "Jewelry":
		        $("#dim-check").prop("checked", true).trigger("change");
				break;
		case "Ceramics":
				$("#dim-check").prop("checked", true).trigger("change");
				break;
		case "Textile":
				$("#dim-check").prop("checked", true).trigger("change");
				break;
	    default:
				$("#dim-check").prop("checked", false).trigger("change");
	
				
	}

	
  });
	

 $("#dim-check").change(function(){

	// If checked
	if ($("#dim-check").is(":checked"))
	{
		
		$("#three-dee").show("slow");
		$("#file-field-1").show("slow");
		$("#file-field-2").show("slow");
	}
	else
	{
		$("#three-dee").hide("slow");
		$("#file-field-1").hide("slow");
		$("#file-field-2").hide("slow");
	}
  });

});