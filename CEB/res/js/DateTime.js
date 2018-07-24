window.onload=setInterval(clock,1000);

function clock(){
	var d=new Date();
	
	var date=d.getDate();
	
	var year=d.getFullYear();
	
	var month=d.getMonth();
	var monthArr=["January","February","March","April","May","June","July","August","September","October","November","December"];
	month=monthArr[month];
	
	var day=d.getDay();
	var dayArr=["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];
	day=dayArr[day];
	
	document.getElementById("time").innerHTML=d.toLocaleTimeString();
	document.getElementById("date").innerHTML=date+" "+month+" "+year;
	document.getElementById("day").innerHTML=day;
}