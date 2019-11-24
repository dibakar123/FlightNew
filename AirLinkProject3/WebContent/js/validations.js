function adultChange() {
	var val = document.getElementById("adult").value;
	// alert(val);
	document.getElementById("outad").innerHTML = "<font color=white>Adult :"
			+ val + "</font>";

}
function childChange() {
	var val = document.getElementById("child").value;
	document.getElementById("outch").innerHTML = "<font color=white>Child :"
			+ val + "</font>";
	// document.getElementById("outch").text=val;
	// alert(val);
}
