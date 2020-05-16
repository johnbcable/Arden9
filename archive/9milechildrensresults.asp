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
var m_results, m_childrensresults, m_hampton, m_race_text;
var race_years = new Array("2013","2012","2011","2011","2010","2009","2008","2007","2006");
var posheading = new String("Overall Position").toString();
var nofinishheading = new String("The following runners registered but recorded no finish time:").toString();
var catheading = new String("").toString();
var no_of_years = race_years.length;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
greeting = "Welcome to the Arden 9: 9-Mile Run Childrens Results"
theyear = new String(Request.QueryString("year")).toString();
if (theyear == "" || theyear == "null" || theyear == "undefined")
{
	theyear = new String(Request.Form("year")).toString();
	if (theyear == "" || theyear == "null" || theyear == "undefined")
		theyear = new String(currentYear()).toString();;
}
// Now get summary race details from arden9races
ConnObj = Server.CreateObject("ADODB.Connection");
RS = Server.CreateObject("ADODB.RecordSet");
ConnObj.Open(dbconnect);
// Now construct the SQL depending on the year and category chosen.
SQL1 = new String("SELECT * FROM arden9childrenrunners WHERE RaceYear = "+theyear).toString();
SQL2 = new String("SELECT * FROM arden9childrenrunners WHERE RaceYear = "+theyear).toString();
posheading = new String("Overall Position").toString();
nofinishheading = new String("The following runners registered but recorded no finish time:").toString();
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
		<h3>The Arden 9-Mile Run: <br>Results Sheet for the Children's Races in <%= theyear %></h3>
		<div id="resultsform">
			<form name="ArdenResultsForm" action="9milechildrensresults.asp" method="get">
				<fieldset>
					<legend>Results selection</legend>
					<div style="text-align:center;">
						<label for="year">Race Year:&nbsp;</label>
						<select name="year">
<%
		for (i=0; i<(no_of_years); i++)
		{
			if (race_years[i]==theyear)
				Response.Write("<option selected>"+race_years[i]);
			else
				Response.Write("<option>"+race_years[i]);
		}
%>						
						</select>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;						
						<input type="submit" value="Fetch">
					</div>
				</fieldset>
			</form>
		</div>		
		<div id="childrensblurb">
			<p>
				Initiated in 2006, the childrens races are very popular. It is always very gratifying to see so many 
				children wanting to take part. There are two main races:
				<ol>
					<li>A short race (approx. 400 metres) comprising one circuit around the back of the astro-turf 
						pitch and back to the start line (by the clubhouse end of the tennis courts), and<br /><br />
					</li>
					<li>A longer race (approx. 1 mile) starting at the same point but passing to the right of the 
						astro-turf pitch, through the wood onto the new football field area, turning left and 
						re-entering the spinney at the far side, then coming back up within the spinney 
						to emerge opposite the clubhouse
					</li>
				</ol>
			</p>
		</div>
		<div id="childrenswinners">
			<p>
				The winners of the races (in the above year) are given immediately below:
			</p>
			<table style="width:80%" align="center">
				<th>Category</th>
				<th>Name</th>
				<th style="text-align:center;">Time Taken (mm:ss)</th>
<%
// Now get the winners for the selected year
SQL4 = new String("SELECT * from arden9childrenwinners where race_year = "+theyear+" ORDER BY category_sequence").toString();
RS = ConnObj.Execute(SQL4);
while (! RS.EOF)
{
%>
				<tr>
					<td width="20%">
						<p style="margin-top: 2; margin-bottom: 2"><b><%= RS("category") %></b>
					</td>
					<td width="20%"><%= RS("winners_name") %></td>
					<td width="15%" style="text-align:center;"><%= RS("winners_time") %></td>
				</tr>
<%
	RS.MoveNext();
}
RS.Close();
%>
			</table>		
		</div>   <!-- childrenswinners -->
		<div id="winnersfootnotes">
			<p>
				*   indicates a course record for this age category<br />
				**  indicates a winner for the second year running</font><br /><br />
			</p>
		</div>
		<div id="shortraceresults">
			<p class="blueheading">The runners in the short race were:</p>
			<table style="width:80%" align="center">
				<th style="text-align:center;">Race No.</th>
				<th>Name</th>
				<th style="text-align:center;">Age</th>
				<th style="text-align:center;">Position<br />in 400<br />yard race</th>
				<th style="text-align:center;">Time(mm:ss)</th>
<%
// Now get the runners for the childrens short race
//
SQL4 = new String("SELECT * from arden9childrenrunners where RaceYear = "+theyear+" AND category = 'SHORT' order by pos").toString();
RS = ConnObj.Execute(SQL4);
while (! RS.EOF)
{
%>
				<tr>
					<td width="10%" style="text-align:center;"><%= RS("RaceNo") %></td>
					<td width="30%"><%= RS("Forename") %>&nbsp;<%= RS("Surname") %></td>
					<td width="25%" style="text-align:center;"><%= RS("Age") %></td>
					<td width="20%" style="text-align:center;"><%= RS("Pos") %></td>
					<td style="text-align:center;"><%= RS("Time") %></td>
				</tr>
<%
	RS.MoveNext();
}
RS.Close();
%>
			</table>		
		
		</div>   <!-- shortraceresults -->		
		<br />
		<div id="longraceresults">
			<p class="blueheading">The runners in the long race were:</p>
			<table style="width:80%" align="center">
				<th style="text-align:center;">Race No.</th>
				<th>Name</th>
				<th style="text-align:center;">Age</th>
				<th style="text-align:center;">Position<br />in 1 mile<br />race</th>
				<th style="text-align:center;">Time(mm:ss)</th>
<%
// Now get the runners for the childrens short race
//
SQL4 = new String("SELECT * from arden9childrenrunners where RaceYear = "+theyear+" AND category = 'LONG' order by pos").toString();
RS = ConnObj.Execute(SQL4);
while (! RS.EOF)
{
%>
				<tr>
					<td width="10%" style="text-align:center;"><%= RS("RaceNo") %></td>
					<td width="30%"><%= RS("Forename") %>&nbsp;<%= RS("Surname") %></td>
					<td width="25%" style="text-align:center;"><%= RS("Age") %></td>
					<td width="20%" style="text-align:center;"><%= RS("Pos") %></td>
					<td style="text-align:center;"><%= RS("Time") %></td>
				</tr>
<%
	RS.MoveNext();
}
RS.Close();
%>
			</table>		
		
		</div>   <!-- longraceresults -->		
		<br />
		<div id="pagelinks">
			<p><a href="9mileraceresults.asp">Back to main results page</a></p>
			<p>
				Thanks to everyone who took part this year. Well done - see you again next year! 
			</p>
		</div>
		<!--#include file="sponsors.asp" -->
	</div>  <!-- content  -->
<!--#include file="ardennav.asp" -->
</body>
</html>
<%
%>
