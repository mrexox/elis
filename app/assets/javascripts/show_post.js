var AUTH_TOKEN = $('meta[name=csrf-token]').attr('content');
$(document).ready(function() {
	$( "#categories" ).click(function() {
		$( "#tags-categories" ).toggle(200);
	});
	var like_btn = document.getElementsByClassName('likes')[0];
	like_btn.addEventListener('click', function(){
		$.ajax({
			headers:{
				'X-CSRF-TOKEN': AUTH_TOKEN
			},
			type: 'POST',
			url: window.location.pathname + '/like',
			statusCode: {
				404: function(data){console.dir(data);},
				423: function(data) {console.log(data);notify(3,data.responseJSON.message);},
				202: function(){
					var f = parseInt(like_btn.innerHTML);
					like_btn.textContent = +f + 1;
				}
			}
		});
	});
	$('#like').on('click', wasLiked);
});

function wasLiked() {
	var like = document.getElementById('like');
	like.classList.remove('likes');
	like.classList.add('liked');
}
