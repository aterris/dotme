// Config Bar
jQuery(document).ready(function($){
	//Config Bar Control
	$('#config-nav > li a').click(function(){
		$(this).next().toggle();
		return false;
	});
	
	
	// Hide Config Bar
	$('#hide').click(function(){$('#config-bar').hide();return false;});
});