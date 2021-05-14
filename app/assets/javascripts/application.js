// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

function checkform()
{
var f = document.forms["questionForm"].elements;
var cansubmit = true;

for (var i = 0; i < f.length; i++) {
  if (f[i].value == -1) cansubmit = false;
}

if(cansubmit){
  document.getElementById("submitbutton").disabled = false;
  document.getElementById("submitbutton").style.backgroundColor = "#4CAF50";
}else{
  document.getElementById("submitbutton").disabled = true;
  document.getElementById("submitbutton").style.backgroundColor = "red";
}

}
