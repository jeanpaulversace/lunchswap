(function () {
	window.updateLocation = function () {

		console.log("longitude from ajax request", longitude);
		console.log("latitude from ajax request", latitude);

		var data = {latitude: latitude, longitude: longitude}

		var request = $.ajax({
			url: "/update_location",
			type: "POST",
			beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
			dataType: "json",
			data: data
		})

		request.done(function( msg ) {
		  console.log( msg );
		});
		 
		request.fail(function( jqXHR, textStatus ) {
		  console.log( "Request failed: " + textStatus + "/"+ jqXHR);
		});
	}
})();