// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

function addTag() {
	var d = document.getElementById("add-tag");
	d.style.display = "inline-block";
	document.getElementById("add-tag-button").style.display = "none";
}

function undisplayForm() {
	document.getElementById("add-tag").style.display = "none";
	document.getElementById("add-tag-button").style.display = "inline-block";
}
