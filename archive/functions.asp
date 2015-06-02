<script language=JScript runat=Server>
// List of function prototypes
//
// timestring()
// datestring()
// timegreeting()
// dateasstring(adate) 
// timeasstring(atime)
// ddmmyyyy(Date)
// getMonthNumber(strMonth)
// fulltextdate(adate)
//
//==================================================
function timestring() {
var d, hh, mm, ss, s = "";
var c = ":";
d = new Date();
hh=d.getHours();
mm=d.getMinutes();
ss=d.getSeconds();
if (hh < 10)
s += "0";
s += hh + c;
if (mm < 10)
s += "0";
s += mm + c;
if (ss < 10)
s += "0";
s += ss;
return (s);
}
//==================================================
function datestring(){
   var d, day, x, s = "";
   var x = new Array("Sunday", "Monday", "Tuesday");
   var x = x.concat("Wednesday","Thursday", "Friday");
   var x = x.concat("Saturday");
   d = new Date();
   day = d.getDay();
   s += x[day] + " "
   s += d.getDate() + "/";
   s += (d.getMonth() + 1) + "/";
   s += d.getYear();
   return(s);
}
//==================================================
function timegreeting() {
var d, h, s = "Good "
d = new Date();
h = d.getHours();
if (h < 12)
s += "morning";
if (h > 11 & h < 18)
s += "afternoon";
if (h > 17)
s += "evening";
return (s);
}
//==================================================
function dateasstring(d){
   var day, x, s = "";
   var x = new Array("Sunday", "Monday", "Tuesday");
   var x = x.concat("Wednesday","Thursday", "Friday");
   var x = x.concat("Saturday");
   day = d.getDay();
   s += x[day] + " "
   s += d.getDate() + "/";
   s += (d.getMonth() + 1) + "/";
   s += d.getYear();
   return(s);
}
//==================================================
function timeasstring(t){
   var day, x, s = "", minutes, hours;
    hours = t.getHours();
   if (hours < 10)
	s += "0";
   s += hours+":";
   minutes = t.getMinutes();
   if (minutes < 10)
	s += "0";
   s += minutes;
   return(s);
}
//==================================================
function today(){
	var d = new Date();   
	var day, month, x, s = "";
	day = d.getDate();
	if (day < 10)
		s += "0";
	s += day+"/";
	month = (d.getMonth() + 1)
	if (month < 10)
		s+= "0";
	s += month + "/";
   s += d.getFullYear();
   return(s);
}
//==================================================
function ddmmyyyy(d){
   var day, month, x, s = "";
   day = d.getDate();
	if (day < 10)
		s += "0";
	s += day+"/";
   month = (d.getMonth() + 1)
	if (month < 10)
		s+= "0";
	s += month + "/";
   s += d.getFullYear();
   return(new String(s).toString());
}
//==================================================
function getMonthNumber(strMonth){
var months = new Array("January","February","March","April","May","June","July","August","September","October","November","December");
var i, retval;
retval = -1;
for (i = 0; i < 12; i++)
{
  if (strMonth == months[i])
  	retval = i+1;
}
return(retval);
}
//==================================================
function currentYear()
{
	var today = new Date();
	var s = new String("").toString();
	s += today.getFullYear();
	return(s);
}
//==================================================
function fulltextdate(d){
   var thedate = new Date(d);
   var day, month, x, s = "";
   var x = new Array("Sunday", "Monday", "Tuesday","Wednesday","Thursday", "Friday","Saturday");
    var months = new Array("January","February","March","April","May","June","July","August","September","October","November","December");
   day = thedate.getDay();
    month = thedate.getMonth();
   s += x[day] + " " + thedate.getDate() + " " + months[month] + ", " + thedate.getYear();
   return(s);
}



</script>