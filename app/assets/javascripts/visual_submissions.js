$(document).ready(function(){

	$("#limited-edition").css("display","none");
	$("#limited-edition-1").css("display", "none")
	
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