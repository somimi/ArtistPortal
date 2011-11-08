// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function() {
 
	$('a.poplight[href^=#]').click(function() {
	    var popID = $(this).attr('rel'); 
	    var popURL = $(this).attr('href');

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

});