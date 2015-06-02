<%@language="JScript"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("The Arden 9: 9-Mile Run Results for an Individual");
// Now for any variables local to this page
var debugging=false;
var firstletter;
var ConnObj, RS, SQL0, SQL1, SQL2, SQL3, SQL4;
var dbconnect=Application("hamptonsportsdb");
var thesurname, theforename;
var nofinishknt, catknt;
var nosurname = false;     // defaults to a surname being supplied
var m_race_year, m_race_date, m_photo_link, m_childrens1, m_childrens2, m_adult1;
var m_results, m_childrensresults, m_hampton, m_race_text, m_race_comments, m_photo_provider;
var race_years = new Array("2014","2013","2012","2011","2010","2009","2008","2007","2006","2005","2004");
var age_categories = new Array("All ages","Male: 16-39","Male: 40-49","Male: 50+","Female: 16-34","Female: 35-44","Female: 45+");
var age_values = new Array("All","M16-39","M40-49","M50+","F16-34","F35-44","F45+");
var posheading = new String("Overall Position").toString();
var nofinishheading = new String("The following runners registered but recorded no finish time:").toString();
var catheading = new String("").toString();
var currentdate, currentmonth, currentyear;
var surnametail;
// Set up default greeting strings
thesurname = new String("").toString();
theforename = new String("").toString();
strdate = datestring();
strtime = timestring();
greeting = "Welcome to the Arden 9: 9-Mile Personal Results"
thesurname = new String(Request.QueryString("surname")).toString();
if (thesurname == "" || thesurname == "null" || thesurname == "undefined")
{
	thesurname = new String(Request.Form("surname")).toString();
	if (thesurname == "" || thesurname == "null" || thesurname == "undefined")
	{
		nosurname = true;
		thesurname = new String("NONE").toString();;
	}
}
thesurname = thesurname.toLowerCase();
firstletter = new String(thesurname.substring(0,1)).toString();
firstletter = firstletter.toUpperCase();
surnametail = new String(thesurname.substring(1)).toString();
surnametail = surnametail.toLowerCase();
thesurname = new String(firstletter+surnametail).toString();
// Now need to check for presence of apostrophe and set next character to upper case
aposindex = thesurname.indexOf("'");
if (aposindex > 0)
	thesurname = (thesurname.substring(0,aposindex)) + (thesurname.substring(aposindex,1)).toUpperCase() + thesurname.substring(aposindex+1);

// Must be narrowed down to have at least one of a forneame or a surname
//	if (thesurname == "None")
//		Response.Redirect("9mileraceresults.asp");
// 
ConnObj = Server.CreateObject("ADODB.Connection");
RS = Server.CreateObject("ADODB.RecordSet");
ConnObj.Open(dbconnect);
// Now construct the SQL depending on the year and category chosen.
SQL1 = new String("SELECT * FROM arden9runners ").toString();
SQL2 = new String("SELECT * FROM arden9runners ").toString();
if (! nosurname)
{
	SQL1 += "WHERE surname = '"+thesurname+"' ";
	// Now remove any * characters in thesurname prior to displaying it
	thesurname = new String(thesurname.replace("*","")).toString();
}
SQL1 += "ORDER BY Surname, Forename, RaceYear desc";
// End of page start up coding
if (debugging)
{
	Response.Write("=======================  SQL debugging ===============================<br />");
	Response.Write("firstletter= ["+firstletter+"]<br />");
	Response.Write("the rest   = ["+thesurname.substring(1)+"]<br />");
	Response.Write("thesurname = ["+thesurname+"]<br />");
	Response.Write("theforename = ["+theforename+"]<br />");
	Response.Write("SQL1 = ["+SQL1+"]<br />");
	Response.Write("===============  End of SQL debugging ================================<br />");
}
%>
<!--#include file="pagehead.asp" -->
	<div id="content">
		<h3>Person Results Sheet</h3>
		<div id="personsresultsform">
			<form name="ArdenPersonResultsForm" action="9milepersonresults.asp" method="get">
				<fieldset>
					<legend>Personal results selection</legend>
					<div style="text-align:center; font-size:0.7em;">
						<br /><br />
						Surname:&nbsp;<input type="text" name="surname" id="surname" size="25" maxlength="35" value="<%= thesurname %>">
						&nbsp;&nbsp;&nbsp;
						<input type="submit" value="Fetch"><br /><br />
					</div>
				</fieldset>
			</form>
		</div>
		<div id="resultsblurb">
			<p>
				N.B.<br />
				====<br />
				You must fill in either a full or part surname for the search to proceed. If you dont, and click Fetch,
				you will be returned to the normal race results page
			</p>
			<p>
				While we make every effort to ensure that the results that we will show below are as correct as they can be, 
				if you do see any obvious errors when they are posted here, please let us know
			</p>
		</div>
		<div>
			<p>
				The full list of personal result entries for the above is shown below. Each entry
				includes the course time (in minutes:seconds), and the age category applicable at 
				the time of the race (shown to the right of the runner's name). <br /><br />
				The list is presented in descending date (most recent race first) order.
			</p>
		</div>		
<%
if (debugging)
{
	Response.Write("=======================  SQL debugging ===============================<br />");
	Response.Write("thesurname = ["+thesurname+"]<br />");
	Response.Write("theforename = ["+theforename+"]<br />");
	Response.Write("SQL1 = ["+SQL1+"]<br />");
	Response.Write("===============  End of SQL debugging ================================<br />");
}
if (! nosurname)
{
%>
		<div id="runnerstable" style="clear:both;">
			<table>
				<th width="5%" style="text-align:center;">Year</th>
				<th width="5%" style="text-align:center;">Pos.</th>
				<th width="10%" style="text-align:center;">Time Taken (mm:ss)</th>
				<th width="20%">Name</th>
				<th width="30%">Club</th>
				<th width="10%" style="text-align:center;">Category</th>
				<th style="text-align:center;">Race<br />No.</th>
<%
			RS = ConnObj.Execute(SQL1);
			while (! RS.EOF)
			{
			if (debugging)
			{
%>
			  <tr>
					<td colspan="7">Row found - surname = <%= RS("surname") %>, year = <%= RS("RaceYear") %></td>
				</tr>
<%
			}
%>
				<tr>
					<td width="5%" style="text-align:center;"><%= RS("RaceYear") %></td>
					<td width="5%" style="text-align:center;"><%= RS("Pos") %></td>
					<td width="10%" style="text-align:center;"><%= RS("time") %></td>
					<td width="25%"><%= RS("forename") %>&nbsp;<%= RS("surname") %></td>
					<td width="35%"><%= RS("club") %></td>
					<td width="10%" style="text-align:center;"><%= RS("category") %></td>
					<td width="10%" style="text-align:center;"><%= RS("raceno") %></td>
				</tr>
<%
				RS.MoveNext();
			}
			RS.Close();
%>
			<tr>
				<td colspan="7" align="center" bgcolor="#c0c0c0"><hr /></td>
			</tr>
		</table>
		</div>   <!-- runnerstable -->
<%
}
%>
		
		<!--#include file="sponsors.asp" -->
	</div>   <!-- content -->
<!--#include file="ardennav.asp" -->
</body>
</html>
<%
%>
