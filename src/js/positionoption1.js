$(document).ready(function(){
$('#btnGetValue').click(function(){
	var x=$('input[name=members]:checked').val();
	alert(x);
});
});