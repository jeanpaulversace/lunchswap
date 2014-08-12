(function () {
	window.locate = function get_location() {
		  navigator.geolocation.getCurrentPosition(show_map);
		}();

	function show_map(position) {
	  window.latitude = position.coords.latitude.toString();
	 	window.longitude = position.coords.longitude.toString();
	 	updateLocation();
	};
})();

