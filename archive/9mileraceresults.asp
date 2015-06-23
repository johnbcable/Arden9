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
var theyear, thecategory;
var nofinishknt, catknt;
var m_race_year, m_race_date, m_photo_link, m_childrens1, m_childrens2, m_adult1;
var m_results, m_childrensresults, m_hampton, m_race_text, m_race_comments, m_photo_provider;
var race_years = new Array("2014","2013","2012","2011","2010","2009","2008","2007","2006","2005","2004");
var age_categories = new Array("All ages","Female: All ages", "Male: all ages", "Male: 16-39","Male: 40-49","Male: 50+","Female: 16-34","Female: 35-44","Female: 45+");
var age_values = new Array("All","Females", "Males", "M16-39","M40-49","M50+","F16-34","F35-44","F45+");
var posheading = new String("Overall Position").toString();
var nofinishheading = new String("The following runners registered but recorded no finish time:").toString();
var catheading = new String("").toString();
var currentdate, currentmonth, currentyear;
var retval = new String("").toString();
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
greeting = "Welcome to the Arden 9: 9-Mile Run Results"
theyear = new String(Request.QueryString("year")).toString();
if (theyear == "" || theyear == "null" || theyear == "undefined")
{
	theyear = new String(Request.Form("year")).toString();
	if (theyear == "" || theyear == "null" || theyear == "undefined")
		theyear = new String(currentYear()).toString();;
}
thecategory = new String(Request.QueryString("category")).toString();
if (thecategory == "" || thecategory == "null" || thecategory == "undefined")
{
	thecategory = new String(Request.Form("category")).toString();
	if (thecategory == "" || thecategory == "null" || thecategory == "undefined")
		thecategory = new String("All").toString();;
}
// Prevent all years and all categories at the same time!
if (theyear == "All" && thecategory == "All")
	theyear = new String(currentYear()).toString();;
currentdate = new Date();
currentyear = new String(currentdate.getFullYear()).toString();
if (theyear == currentyear)
{
	currentmonth = (currentdate.getMonth() + 1);
	if (currentmonth < 6)
		theyear = new String(currentdate.getFullYear()-1).toString();
}
// Now get summary race details from arden9races
ConnObj = Server.CreateObject("ADODB.Connection");
RS = Server.CreateObject("ADODB.RecordSet");
RS2 = Server.CreateObject("ADODB.RecordSet");
ConnObj.Open(dbconnect);
// Now construct the SQL depending on the year and category chosen.
SQL1 = new String("SELECT * FROM arden9runners WHERE RaceYear = "+theyear).toString();
SQL2 = new String("SELECT * FROM arden9runners WHERE RaceYear = "+theyear).toString();
if (thecategory == "All")
{
	posheading = new String("Overall Position").toString();
	nofinishheading = new String("The following runners registered but recorded no finish time:").toString();
}
else
{
	catheading = new String ("in this category").toString();
	posheading = new String("Pos. In Category").toString();
	nofinishheading = new String("The following runners in category "+thecategory+" registered but recorded no finish time:").toString();
	if (thecategory == "Females"){
		SQL1 += " AND [category] LIKE 'F%'";
		SQL2 += " AND [category] LIKE 'F%'";
	} else if (thecategory == "Males") {
		SQL1 += " AND [category] LIKE 'M%'";
		SQL2 += " AND [category] LIKE 'M%'";
	} else {
		SQL1 += " AND category = '"+thecategory+"'";
		SQL2 += " AND category = '"+thecategory+"'";
	}

}
// Now add the positioning and ordering
SQL1 += " AND Pos > 0 ORDER BY Pos";
SQL2 += " AND Pos < 0 ORDER BY Surname";
// Now get the summary race details from arden9races
SQL0 = new String("SELECT * FROM arden9races WHERE race_year = "+theyear).toString();
m_race_year = "-1";
m_race_date = new String("").toString();
m_photo_link = new String("").toString();
m_childrens1 = new String("Y").toString();
m_childrens2 = new String("Y").toString();
m_adult1 = new String("Y").toString();
m_results = new String("").toString();
m_childrensresults = new String("").toString();
m_hampton = new String("").toString();
m_race_text = new String("").toString();
m_race_comments = new String("").toString();
m_photo_provider = new String("").toString();
RS=ConnObj.Execute(SQL0);
while (! RS.EOF)
{
	m_race_year = new String(RS("race_year")).toString();
	m_race_date = new String(RS("race_date")).toString();
	dummydate = new Date(m_race_date);
	m_race_date = new String(dateasstring(dummydate)).toString();
	m_childrens1 = new String(RS("childrens1")).toString();
	m_childrens2 = new String(RS("childrens2")).toString();
	m_adult1 = new String(RS("adult1")).toString();
	m_photo_link = new String(RS("photo_link")).toString();
	m_results = new String(RS("results")).toString();
	m_childrensresults = new String(RS("childrens_results")).toString();
	m_hampton = new String(RS("hampton_link")).toString();
	m_race_text = new String(RS("race_date_text")).toString();
	m_race_comments = new String(RS("race_comment")).toString();
	m_photo_provider = new String(RS("photo_provider")).toString();
	RS.MoveNext();
}
RS.Close();
if (m_race_comments == "" || m_race_comments == "null" || m_race_comments == "undefined")
	m_race_comments = new String("").toString();
if (m_photo_link == "" || m_photo_link == "null" || m_photo_link == "undefined")
	m_photo_link = new String("").toString();
// End of page start up coding
if (debugging)
{
	Response.Write("=======================  SQL current_debug_status() ===============================\r\n");
	Response.Write("theyear = ["+theyear+"]\r\n");
	Response.Write("thecategory = ["+thecategory+"]\r\n");
	Response.Write("SQL1 = ["+SQL1+"]\r\n");
	Response.Write("SQL2 = ["+SQL2+"]\r\n");
	Response.Write("===============  End of SQL current_debug_status() ==============================\r\n");
	Response.End();
}
%>
<!--#include file="pagehead.asp" -->
	<div id="content">
		<h3>Results</h3>
		<div id="resultsform">
			<form name="ArdenResultsForm" action="9mileraceresults.asp" method="get">
				<fieldset>
					<legend>Which results do you want to see</legend>
					<div>
						<br />
						<label for="year">Race Year:&nbsp;</label>
						<select id="year" name="year">
<%
		for (i=0; i<race_years.length; i++)
		{
			if (race_years[i]==theyear)
				Response.Write("<option selected>"+race_years[i]);
			else
				Response.Write("<option>"+race_years[i]);
		}
%>						
						</select>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;						
						<label for="category">Age Category:&nbsp;</label>
						<select id="category" name="category">
<%
	SQL4 = new String("SELECT * FROM arden9winners WHERE [race_year] = "+theyear+" ORDER BY [category_sequence]").toString();
	// End of page start up coding
	// Set up options applicable to al years First
	retval += '<option value="All">All ages\n\r';
	retval += '<option value="Females">Female: all ages\n\r';
	retval += '<option value="Males">Male: all ages\n\r';
	// Now get the categories used in the given year
	RS2 = ConnObj.Execute(SQL4);
	while (! RS2.EOF)
	{
		retval += '<option value="'+RS2("category_code")+'">'+RS2("category")+'\n\r';
		RS2.MoveNext();
	}
	RS2.Close();
	Response.Write(retval);
%>
						</select>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="submit" value="Fetch"><br /><br />
					</div>
				</fieldset>
			</form>
		</div>
		<div id="resultsblurb">
			<p>
				While we make every effort to ensure that the results that we will show below are as correct as they can be, 
				if you do see any obvious errors when they are posted here, please let us know
			</p>
		</div>
		<div id="winnerstable">
			<p>The winners of the each age category on <%= m_race_text %> were as follows:</p>
			<table>
				<th>Category</th>
				<th>Name</th>
				<th style="text-align:center;">Time Taken (mm:ss)</th>
				<th style="text-align:center;">Overall Position</th>
				<th>Club</th>
<%
// Now get the winners for the selected year
SQL4 = new String("SELECT * from arden9winners where race_year = "+theyear+" ORDER BY category_sequence").toString();
RS = ConnObj.Execute(SQL4);
while (! RS.EOF)
{
	dummyclub = new String(RS("winners_club")).toString();
	if (dummyclub == "" || dummyclub == "null" || dummyclub == "undefined")
		dummyclub = new String(" ");
%>
				<tr>
					<td width="20%">
						<p style="margin-top: 2; margin-bottom: 2"><b><%= RS("category") %></b>
					</td>
					<td width="20%"><%= RS("winners_name") %></td>
					<td width="15%" style="text-align:center;"><%= RS("winners_time") %></td>
					<td width="13%" style="text-align:center;"><%= RS("overall_position") %></td>
					<td><%= dummyclub %></td>
				</tr>
<%
	RS.MoveNext();
}
RS.Close();
%>
			</table>		
		
		</div>   <!-- winnerstable -->
		<div id="winnersfootnotes">
			<p>
				*   indicates a course record for this age category<br />
				**  indicates a winner for the second year running<br /><br />
				If you are a winner of either the Male Open or the Female Open titles, you will not also be listed as the winner 
				for your age category - the next fastest runner in that category will be listed instead.<br />
			</p>
			<p class="centered">
				<b>The overall course record (45 minutes, 36 seconds) was set by Martin Williams from Tipton Harriers in 2012.</b>
			</p>
			<div id="racecomments" class="borderboth" style="margin:0;">
<%
if (! (m_race_comments == ""))
{
%>
				<div id="overlayboxquote" class="boxright">
					<h5 class="boxheader">Comments on the day</h5>
					<p><%= m_race_comments %></p>
					<p class="boxsignature">Organisers</p>
				</div>				
<%
}
%>
				<p>
<%
			if (m_childrens1 == "Y" || m_childrens2 == "Y")
			{
%>
					<br />
					<a href="<%= m_childrensresults %>">Childrens race results</a> (<%= theyear %>)<br />
					<br />
<%
			}
			if (!m_photo_link == "")
			{
				if (m_photo_provider == "" || m_photo_provider == "null" || m_photo_provider == "undefined")
					m_photo_provider = new String("");
				else
					m_photo_provider = new String("(provided by "+m_photo_provider+")").toString();
%>
					<a href="<%= m_photo_link %>">Photos</a> (<%= theyear %>)&nbsp;<%= m_photo_provider %><br /><br />
<%
			}
%>			
					<a href="<%= m_hampton %>">Hampton-In-Arden Sports Club Members</a> (<%= theyear %>)
				</p>
			</div>
			<p>
				The full list of runners <%= catheading %> who completed the course in <%= theyear %> is shown below 
				together with their course time (in minutes:seconds) and their age category to the right of their name. 
				The list is presented in fastest-first order.
			</p>
		</div>
<!--
		<div id="fault2012" style="background: #fff; padding: 10px; -moz-border-radius: 10px; -webkit-border-radius: 10px; border-radius: 10px; border: 2px solid black; margin: 10px auto; width: 80%;">
			<p>
				In early postings of the results for 2012, some runners had been allocated to incorrect clubs. This fault has now 
				been corrected and the below table reflects that. No results have yet been sent to WRRL. If there are no further 
				errors, we will send results to WRRL in a few days.
			</p>
		</div>
-->
		<div id="runnerstable">
			<table>
				<th style="text-align:center;"><%= posheading %></th>
				<th style="text-align:center;">Time Taken (mm:ss)</th>
				<th>Name</th>
				<th>Club</th>
				<th style="text-align:center;">Category</th>
				<th style="text-align:center;">Race<br />No.</th>
<%
			catknt = 0;
			RS = ConnObj.Execute(SQL1);
			while (! RS.EOF)
			{
				catknt = catknt + 1;
%>
				<tr>
					<td width="10%" style="text-align:center;"><%= catknt %></td>
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
				<td colspan="6" align="center" bgcolor="#c0c0c0"><hr /></td>
			</tr>
<%
			RS = ConnObj.Execute(SQL2);
			nofinishknt = 0;
			while (! RS.EOF)
			{
				nofinishknt++;
				if (nofinishknt == 1)
				{
%>
			<tr>
				<td colspan="6" align="center" bgcolor="#c0c0c0"><%= nofinishheading %></td>
			</tr>
			<tr>
				<td colspan="6" align="center" bgcolor="#c0c0c0"><hr /></td>
			</tr>
<%
				}
%>
			<tr>
				<td width="10%" class="tdnine" align="center"><%= RS("pos") %></td>
				<td width="10%" class="tdnine" align="center"><%= RS("time") %></td>
				<td width="25%" class="tdnine" align="left"><%= RS("forename") %>&nbsp;<%= RS("surname") %></td>
				<td width="35%" class="tdnine" align="center"><%= RS("club") %></td>
				<td width="10%" class="tdnine" align="center"><%= RS("category") %></td>
				<td width="10%" class="tdnine" align="center"><%= RS("raceno") %></td>
			</tr>
<%
				RS.MoveNext();
			}
			RS.Close();
%>
		</table>
		</div>   <!-- runnerstable -->
		<div id="moreresults">
			<p>
<%
			if (m_childrens1 == "Y" || m_childrens2 == "Y")
			{
%>
				<br />
				The childrens race(s) ran in <%= theyear %>. Click <a href="<%= m_childrensresults %>">here</a> to view the results.<br />
				<br />
<%
			}
			if (!m_photo_link == "")
			{
%>
				Want to see some photos from the <%= theyear %> race? Click <a href="<%= m_photo_link %>">here</a> ....<br /><br />
<%
			}
%>			
				<a href="<%= m_hampton %>">Hampton-In-Arden Sports Club Members - Roll of Honour</a> (<%= theyear %>)
			</p>
			<p>
				Thanks to everyone who took part in this race. Well done - see you again next time!
			</p>
		</div>      <!-- moreresults -->
		<!--#include file="sponsors.asp" -->
	</div>   <!-- content -->
<!--#include file="ardennav.asp" -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script>
	$(document).ready( function() {
		$("#year").change(function() {
   			$("#category").load("9milecategories.asp?year=" + $("#year").val());
		});    // end change event
	});    // end ready
</script>
</body>
</html>
<%
%>
