function login(username, password) {
	if (username == "demo" && password == "mode") {
		window.location = "welcome";
	} else {
		window.location = "error";
	}
}


window.onload = function(){

	document.getElementById("showAlert").onclick = () => {alert("showing alert")};

	document.getElementById("showPrompt").onclick = () => {
		let num = prompt("enter a number");
		if (num.length > 0 && !isNaN(+num)){
			alert("correct");
		}
		else {
			alert("incorrect");
		}

	};


}