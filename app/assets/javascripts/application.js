// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require jquery.purr
//= require best_in_place
//= require dataTables/jquery.dataTables
//= require TableTools-2.0.3/media/js/TableTools
//= require_tree .

jQuery(document).ready(function($) {

	var popup_notes = $("<div/>");
	$('Body').append(popup_notes);
	
	$(popup_notes).attr('id', 'popup_notes');
	$(popup_notes).attr('class', 'popup_block');
	
	$(popup_notes).append('<form accept-charset="UTF-8" action="/store_submissions/4" class="edit_store_submission" id="edit_store_submission_4" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="_method" type="hidden" value="put" />');
	
	$('.best_in_place').best_in_place();
		
	$('#store-index').dataTable({
		"sDom": 'T<"clear">lfrtip',
		"oTableTools": {
            "sSwfPath": "/assets/TableTools-2.0.3/media/swf/copy_csv_xls_pdf.swf"
        },
		sPaginationType: "full_numbers",
		bJQueryUI: true,
		"bStateSave": true
	});
	
	$('#artist-index').dataTable({
		"sDom": 'T<"clear">lfrtip',
		"oTableTools": {
            "sSwfPath": "/assets/TableTools-2.0.3/media/swf/copy_csv_xls_pdf.swf"
        },
		sPaginationType: "full_numbers",
		bJQueryUI: true,
		"bStateSave": true
	});
	
	$('#visual-index').dataTable({
		"sDom": 'T<"clear">lfrtip',
		"oTableTools": {
            "sSwfPath": "/assets/TableTools-2.0.3/media/swf/copy_csv_xls_pdf.swf"
        },
		sPaginationType: "full_numbers",
		bJQueryUI: true,
		"bStateSave": true
	});
	
	$('#literary-index').dataTable({
		sPaginationType: "full_numbers",
		bJQueryUI: true,
		"bStateSave": true
	});
	
	$('#artist-visual-index').dataTable({
		sPaginationType: "full_numbers",
		bJQueryUI: true,
		"bStateSave": true
	});
	
	$('#artist-store-index').dataTable({
		sPaginationType: "full_numbers",
		bJQueryUI: true,
		"bStateSave": true
	});
	
	
	
	$('#film-index').dataTable({
		sPaginationType: "full_numbers",
		bJQueryUI: true,
		"bStateSave": true
	});
	
	$('#performance-index').dataTable({
		sPaginationType: "full_numbers",
		bJQueryUI: true,
		"bStateSave": true
	});
		
 
	$('a.poplight[href^=#]').click(function(e) {
	    var popID = $(this).attr('rel'); 
	    var popURL = $(this).attr('href');
		
		
		console.log($(e.currentTarget).parents('tr').data('id'));
	

	    //Pull Query & Variables from href URL
	    var query= popURL.split('?');
	    var dim= query[1].split('&');
	    var popWidth = dim[0].split('=')[1]; 

	    
	    $('#' + popID).fadeIn().css({ 'width': Number( popWidth ) }).prepend('<a href="#" class="close"><img src="/assets/close_pop.png" class="btn_close" title="Close Window" alt="Close" /></a>');

	    
	    var popMargTop = ($('#' + popID).height() + 80) / 2;
	    var popMargLeft = ($('#' + popID).width() + 80) / 2;

	    
	    $('#' + popID).css({
	        'margin-top' : -popMargTop,
	        'margin-left' : -popMargLeft
	    });

	    //Fade in Background
	    $('body').append('<div id="fade"></div>'); 
	    $('#fade').css({'filter' : 'alpha(opacity=80)'}).fadeIn(); 
	    return false;
	});


	$('a.close, #fade').live('click', function() { 
	    $('#fade , .popup_block').fadeOut(function() {
	        $('#fade, a.close').remove();  
	    });
	    return false;
	});
	
	$("ul.subnav").parent().append("<span></span>"); //Only shows drop down trigger when js is enabled (Adds empty span tag after ul.subnav*)  
  
    $("ul.topnav li span").click(function() { //When trigger is clicked...  
  
        //Following events are applied to the subnav itself (moving subnav up and down)  
        $(this).parent().find("ul.subnav").slideDown('fast').show(); //Drop down the subnav on click  
  
        $(this).parent().hover(function() {  
        }, function(){  
            $(this).parent().find("ul.subnav").slideUp('slow'); //When the mouse hovers out of the subnav, move it back up  
        });  
  
        //Following events are applied to the trigger (Hover events for the trigger)  
        }).hover(function() {  
            $(this).addClass("subhover"); //On hover over, add class "subhover"  
        }, function(){  //On Hover Out  
            $(this).removeClass("subhover"); //On hover out, remove class "subhover"  
    });

});