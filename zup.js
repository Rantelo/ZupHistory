var canvasR = null;
var canvasL = null;
function init() {
	canvasR = document.getElementsByClassName('right')[0];
	canvasL = document.getElementsByClassName('left')[0];

	var contextR = canvasR.getContext("2d");
	var contextL = canvasL.getContext("2d");

	contextR.beginPath();
	contextR.fillStyle = "#F1FFE3";
	contextR.moveTo(0,8);
	contextR.lineTo(8, 16);
	contextR.lineTo(0, 24);
	contextR.fill();

	contextL.beginPath();
	contextL.fillStyle = "#FCFBF4";
	contextL.moveTo(12, 8);
	contextL.lineTo(4, 16);
	contextL.lineTo(12, 24);
	contextL.fill();

	for (var i = document.getElementsByClassName('right').length - 1; i >= 0; i--) {
		var ctx = document.getElementsByClassName('right')[i].getContext("2d");
		ctx.drawImage(canvasR,0,0);
	};
	for (var i = document.getElementsByClassName('left').length - 1; i >= 0; i--) {
		var ctx = document.getElementsByClassName('left')[i].getContext("2d");
		ctx.drawImage(canvasL,0,0);
	};
}

window.onload = init();
