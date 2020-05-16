<%@language="JScript"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="racefuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Arden-9 Road Race");
var pagetitle = new String("Test Race Page");
// Now for any variables local to this page
var debugging=false;
var ConnObj, RS, SQL1, SQL2, SQL3;
var raceObj = new Object();
var racedate = new String("2013-06-23").toString();
var racereport = new String();
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
greeting = "Welcome to the Arden 9: 9-Mile Run Course Map"
// End of page start up coding
%>
<!--#include file="pagehead.asp" -->
	<div id="content">
		<h3>Administration - Testing Race Functions</h3>
<%
 	// First, create a new date object with racedate
 	var thedate = new Date(racedate);
 	// Now print date components to check it was created right
 	Response.Write("Looking for 23 June 2013 ...<br />");
 	Response.Write(thedate.getDay()+" "+thedate.getMonth()+" "+thedate.getFullYear()+"<br />");
 	// Now create new race entry and print it
 	raceObj = newRace(thedate);
 	Response.Write("<br />");
 	racereport = printRace(raceObj);
 	Response.Write("----------------------------------<br />"+racereport+"<br />----------------------------------");
 	Response.Write("<br />");

%>		
<!--#include file="sponsors.asp" -->
	</div>   <!--   content   -->
<br />
<!--#include file="ardennav.asp" -->
</body>
</html>
<%
%>

