$('document').ready(function() {
	const searchForm = $('#search_form');
	$('#search_query').on('keyup', function(e) {
		// Simple attempt to autosearch with typing
		console.log(e.target.value)
		// searchForm.submit();
	});
});

