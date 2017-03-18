// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

function generatePermalink() {
	var name = document.getElementById('name').value;
	name = name.toLowerCase();
	name = name.replace(/\s+/g, '-');
	document.getElementById('permalink').value = name;
}
