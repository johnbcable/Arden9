<%@language="JScript"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("The Arden 9: 9-Mile Run Results");
// Now for any variables local to this page
var debugging=false;
var ConnObj, RS, SQL0, SQL1, SQL2, SQL3, SQL4;
var dbconnect=Application("hamptonsportsdb");
var retval = new String("").toString();   // string containing the HTML sent back
var theyear;
var currentdate, currentmonth, currentyear;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
theyear = new String(Request.QueryString("year")).toString();
if (theyear == "" || theyear == "null" || theyear == "undefined")
{
	theyear = new String(Request.Form("year")).toString();
	if (theyear == "" || theyear == "null" || theyear == "undefined")
		theyear = new String(currentYear()).toString();;
}
// Now get category list for this year from the database
ConnObj = Server.CreateObject("ADODB.Connection");
RS = Server.CreateObject("ADODB.RecordSet");
ConnObj.Open(dbconnect);
// Now construct the SQL depending on the year and category chosen.
SQL1 = new String("SELECT * FROM arden9winners WHERE [race_year] = "+theyear+" ORDER BY [category_sequence]").toString();
// End of page start up coding
// Set up options applicable to al years First
retval += '<option value="All">All ages\n\r';
retval += '<option value="Females">Female: all ages\n\r';
retval += '<option value="Males">Male: all ages\n\r';
// Now get the categories used in the given year
RS = ConnObj.Execute(SQL1);
while (! RS.EOF)
{
	retval += '<option value="'+RS("category_code")+'">'+RS("category")+'\n\r';
	RS.MoveNext();
}
RS.Close();
Response.Write(retval);
// Response.End();
%>
