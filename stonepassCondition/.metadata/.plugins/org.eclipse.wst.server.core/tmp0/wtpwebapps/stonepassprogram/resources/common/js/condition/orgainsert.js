$(document).on('click', '#orga_insert', function(e) {

	var orga_name = document.getElementById('orga_name').value;
	var orga_url = document.getElementById('orga_url').value;

	$.ajax({
		url: "condition",
		data: {
			orga_name: orga_name,
			orga_url: orga_url
		},
		type: "post",
		success: function(result) {

			opener.parent.location.reload();
			window.close();
		},
		error: function() {
			alert("error");
		}

	});


	$(document).on('click', '#cencle', function(e) {


		e.preventDefault();
		window.open("about:blank", "_self").close();
	});

});