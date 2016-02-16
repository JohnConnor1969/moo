window.onload = function(){

renderName();

}

window.onkeyup = function(event) {
  if (event.keyCode == 32) { switchbar();};
  if (event.keyCode == 38) { switchbar();};
  if (event.keyCode == 40) { switchbar();};
  
}


var canname = "channel name";
var showbar = 0;
function switchbar() {
  if (showbar == 0) {
    $("#header").toggle();
    showbar = 1;
  }

  else {
    $("#header").hide();
    showbar = 0
  }
  
};

function renderName() {

  var myChannel = document.getElementById('logo');
  myChannel.innerHTML = canname;
}

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