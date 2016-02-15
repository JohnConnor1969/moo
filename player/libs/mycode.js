window.onload = function(){

}

function renderTime() {


var timenow = new Date();
var h = timenow.getHours();
var m = timenow.getMinutes();

var myTime = document.getElementById('time');
myTime.innerHTML = h + ":" + m 
setTimeout('renderTime()', 3000);
}
renderTime();