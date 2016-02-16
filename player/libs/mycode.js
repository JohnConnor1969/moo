window.onload = function(){

renderName();

}

window.onkeyup = function(event) {
  if (event.keyCode == 32) { switchbar();};
  if (event.keyCode == 38) { channNext();};
  if (event.keyCode == 40) { channPrev();};
  
}

var site = "78.139.215.205"
var canname = "server not respond";
var showbar = 0;

function channNext() {

}

function channPrev() {

}

function switchbar() {
  if (showbar == 0) {
    $("#header").toggle();
    showbar = 1;
  }

  else {
    $("#header").hide();
    showbar = 0
  }
  
}

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