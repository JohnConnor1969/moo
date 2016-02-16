window.onload = function(){

}

window.onkeyup = function(event) {
  switchbar();
}



var showbar = 0;
function switchbar() {
  if (showbar == 0) {
    $("#PlaybackControl").toggle();
    showbar = 1;
  }

  else {
    $("#PlaybackControl").hide();
    showbar = 0
  }
  
};
function renderTime() {


var timenow = new Date();
var h = timenow.getHours();
var m = timenow.getMinutes();

var myTime = document.getElementById('time');
if (m < 10) {
m = "0" + m
};
myTime.innerHTML = h + ":" + m 
setTimeout('renderTime()', 15000);
}
renderTime();