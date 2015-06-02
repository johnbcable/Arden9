<%@language="JScript"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("The Arden 9: Hampton Sports Club Results");
// Now for any variables local to this page
var debugging=false;
var ConnObj, RS, SQL0, SQL1, SQL2, SQL3, SQL4;
var dbconnect=Application("hamptonsportsdb");
var theyear, thecategory;
var nofinishknt, catknt;
var m_race_year, m_race_date, m_photo_link, m_childrens1, m_childrens2, m_adult1;
var m_results, m_childrensresults, m_hampton, m_race_text;
var race_years = new Array("2014","2013","2012","2011","2010","2009","2008","2007","2006","2005","2004");
var age_categories = new Array("All ages","Male: 16-39","Male: 40-49","Male: 50+","Female: 16-34","Female: 35-44","Female: 45+");
var age_values = new Array("All","M16-39","M40-49","M50+","F16-34","F35-44","F45+");
var posheading = new String("Overall Position").toString();
var nofinishheading = new String("The following runners registered but recorded no finish time:").toString();
var catheading = new String("").toString();
var no_of_years = race_years.length;
var no_of_categories = age_values.length;
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
// Now get summary race details from arden9races
ConnObj = Server.CreateObject("ADODB.Connection");
RS = Server.CreateObject("ADODB.RecordSet");
ConnObj.Open(dbconnect);
// Now construct the SQL depending on the year and category chosen.
SQL1 = new String("SELECT * FROM arden9runners WHERE RaceYear = "+theyear+" AND Hampton = 'Y'").toString();
SQL2 = new String("SELECT * FROM arden9runners WHERE RaceYear = "+theyear+" AND Hampton = 'Y'").toString();
if (thecategory == "All")
{
	posheading = new String("Overall Position In Race").toString();
	nofinishheading = new String("The following runners registered but recorded no finish time:").toString();
}
else
{
	catheading = new String ("in this category").toString();
	posheading = new String("Pos. In Category").toString();
	nofinishheading = new String("The following runners in category "+thecategory+" registered but recorded no finish time:").toString();
	SQL1 += " AND category = '"+thecategory+"'";
	SQL2 += " AND category = '"+thecategory+"'";
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
	if (m_photo_link == "" ||m_photo_link == "null" ||m_photo_link == "undefined")
		m_photo_link = new String("NONE");
	m_results = new String(RS("results")).toString();
	m_childrensresults = new String(RS("childrens_results")).toString();
	m_hampton = new String(RS("hampton_link")).toString();
	m_race_text = new String(RS("race_date_text")).toString();
	RS.MoveNext();
}
RS.Close();
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
		<h3>Hampton Sports Club Results for<br /><%= m_race_text %></h3>
		<div id="resultsform">
			<form name="ArdenResultsForm" action="9milehina.asp" method="get">
				<fieldset>
					<legend>Results selection</legend>
					<div>
						<br />
						<label for="year">Race Year:&nbsp;</label>
						<select name="year">
<%
		for (i=0; i<no_of_years; i++)
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
						<select name="category">
<%
		for (i=0; i<no_of_categories; i++)
		{
			if (age_values[i]==thecategory)
				Response.Write("<option selected value="+age_values[i]+">"+age_categories[i]);
			else
				Response.Write("<option value="+age_values[i]+">"+age_categories[i]);
		}
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
			<p>The winners of the each age category were as follows:</p>
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
				**  indicates a winner for the second year running</font><br />
			</p>
			<p class="centered" style="font-weight:bold;">
				The ladies course record for a Hampton Sports Club participant (63 minutes and 56 seconds) was set by Susan Lawrence in 2008.<br /><br />
				The mens course record for a Hampton participant (63 minutes and 32 seconds) was set by Daniel Eccleston in 2010.
			</p>
			<p>
				The full list of Hampton Sports Club runners <%= catheading %> who completed the course in <%= theyear %> is shown below 
				together with their course time (in minutes:seconds) and their age category to the right of their name. 
				The list is presented in fastest-first order.
			</p>
		</div>
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
					<td width="10%" style="text-align:center;"><%= RS("pos") %></td>
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
				<td width="10%" align="center"><%= RS("pos") %></td>
				<td width="10%" align="center"><%= RS("time") %></td>
				<td width="25%" align="left"><%= RS("forename") %>&nbsp;<%= RS("surname") %></td>
				<td width="35%" align="center"><%= RS("club") %></td>
				<td width="10%" align="center"><%= RS("category") %></td>
				<td width="10%" align="center"><%= RS("raceno") %></td>
			</tr>
<%
				RS.MoveNext();
			}
			RS.Close();
%>
		</table>
		</div>   <!-- runnerstable -->
		<div id="hinanotes" class="borderboth">
			<span class="blueheading">Notes for Hampton Results</span><br /><br />
			<p>
				Runners can only be included in this list if they:<br /><br />
			</p>
			<ol>
				<li>
					<p>
						were a member (sporting or social) of Hampton-In-Arden Sports Club at the time of the race, or<br /><br />
					</p>
				</li>
				<li>
					<p>
						were employed by Hampton-In-Arden Sports Club at the time of the race.<br /><br />
					</p>
				</li>
			</ol>
			<p>
				Runners who are also residents of Hampton-In-Arden but who do not fall into one or both of the above two categories will not have 
				their names and times recorded in the table on this page. Their results will be part of the main <a href="9mileresults.asp">results section</a>.
			</p>
		</div>
		<div id="moreresults">
			<p>
<%
			if (m_childrens1 == "Y" || m_childrens2 == "Y")
			{
%>
				The childrens race(s) ran in <%= theyear %>. Click <a href="<%= m_childrensresults %>">here</a> to view the results.<br />
				<br />
<%
			}
			if (! (m_photo_link == "NONE"))
			{
%>
				Want to see some photos from the <%= theyear %> race? Click <a href="<%= m_photo_link %>">here</a> ....<br />
<%
			}
%>			
			</p>
			<p><a href="9mileraceresults.asp?year=<%= theyear %>">Back to main results page</a></p>
			<p>
				Thanks to everyone who took part this year. Well done - see you again next year! 
			</p>
		</div>      <!-- moreresults -->
		<!--#include file="sponsors.asp" -->
	</div>   <!-- content -->
<!--#include file="ardennav.asp" -->
</body>
</html>
<%
%>
