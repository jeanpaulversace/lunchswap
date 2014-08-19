(function () {
	window.locate = function get_location() {
		  navigator.geolocation.getCurrentPosition(showMap);
		}();

	function showMap(position) {
	  window.latitude = position.coords.latitude.toString();
	 	window.longitude = position.coords.longitude.toString();
	 	updateLocation();
	};
})();