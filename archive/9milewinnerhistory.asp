<%@language="JScript"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("The Arden 9: 9-Mile Winner History");
// Now for any variables local to this page
var debugging=false;
var ConnObj, RS, SQL0, SQL1, SQL2, SQL3, SQL4;
var dbconnect=Application("hamptonsportsdb");
var theyear, thecategory;
var nofinishknt, catknt;
var m_race_year, m_race_date, m_photo_link, m_childrens1, m_childrens2, m_adult1;
var m_results, m_childrensresults, m_hampton, m_race_text, m_race_comments, m_photo_provider;
var race_years = new Array("2014","2013","2012","2011","2010","2009","2008","2007","2006","2005","2004");
var age_categories = new Array("All ages","Male: Open","Male: 16-39","Male: 40-49","Male: 40 and Over", "Male: 50+","Female: Open","Female: 16-34","Female: 35-44","Female: 35 and Over","Female: 45+");
var age_values = new Array("All","M-OPEN", "M16-39","M40-49","M40+","M50+","F-OPEN","F16-34","F35-44","F35+","F45+");
var posheading = new String("Overall Position").toString();
var nofinishheading = new String("The following runners registered but recorded no finish time:").toString();
var catheading = new String("").toString();
var currentdate, currentmonth, currentyear;
var prevcategory, curcategory;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
greeting = "Welcome to the Arden 9: 9-Mile Winner History"
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
ConnObj.Open(dbconnect);
// Now construct the SQL depending on the year and category chosen.
SQL1 = new String("SELECT * from arden9winners ").toString();
if (! (thecategory == "All"))
{
	SQL1 += "WHERE category_code = '"+thecategory+"' ";
	SQL1 += "ORDER BY race_year desc ";
}
else
{
	SQL1 += "ORDER BY category asc, race_year desc ";
}
prevcategory = new String("hsdgvj").toString();
curcategory = new String("All").toString();
// End of page start up coding
if (debugging)
{
	Response.Write("=======================  SQL current_debug_status() ===============================\r\n");
	Response.Write("thecategory = ["+thecategory+"]\r\n");
	Response.Write("SQL1 = ["+SQL1+"]\r\n");
	Response.Write("SQL2 = ["+SQL2+"]\r\n");
	Response.Write("===============  End of SQL current_debug_status() ==============================\r\n");
	Response.End();
}
%>
<!--#include file="pagehead.asp" -->
	<div id="content">
		<h3>Winners Results History</h3>
		<div id="resultsform">
			<form name="ArdenWinnersResultsForm" action="9milewinnerhistory.asp" method="get">
				<fieldset>
					<legend>Winners results selection</legend>
					<div style="text-align:center;">
						<br />
						<label for="category">Age Category:&nbsp;</label>
						<select name="category">
<%
		for (i=0; i<11; i++)
		{
			if (age_values[i]==thecategory)
				Response.Write('<option selected value="'+age_values[i]+'">'+age_categories[i]);
			else
				Response.Write('<option value="'+age_values[i]+'">'+age_categories[i]);
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
		<div id="runnerstable">
			<table>
				<th>Name</th>
				<th style="text-align:center;">Time Taken (mm:ss)</th>
				<th style="text-align:center;">Overall Position</th>
				<th style="text-align:center;">Race<br />Year</th>
				<th>Club</th>
<%
			RS = ConnObj.Execute(SQL1);
			while (! RS.EOF)
			{
				dummyclub = new String(RS("winners_club")).toString();
				if (dummyclub == "" || dummyclub == "null" || dummyclub == "undefined")
					dummyclub = new String(" ");
				curcategory = new String(RS("category")).toString();
				if (! (curcategory == prevcategory))
				{
%>
				<tr>
					<td colspan="5" style="padding-left: 5px; font-weight: bold; background-color: white;"><span class="blueheading">Category:</span>&nbsp;<%= RS("category") %>
				</tr>
<%
				}
%>
				<tr>
					<td width="20%"><%= RS("winners_name") %></td>
					<td width="15%" style="text-align:center;"><%= RS("winners_time") %></td>
					<td width="13%" style="text-align:center;"><%= RS("overall_position") %></td>
					<td width="13%" style="text-align:center;"><%= RS("race_year") %></td>
					<td><%= dummyclub %></td>
				</tr>
<%
				prevcategory = new String(curcategory).toString();
				RS.MoveNext();
			}
			RS.Close();
%>
			</table>
			<br />
			<p>
				<span class="blueheading">Notes</span><br />
				<ol>
					<li>* denotes current course record holder for this category</li><br /><br />
					<li>The Male: 16-39 category operated between 2004 and 2007. It was absorbed into the new Male: Open category for the 2008 race and for subsequent races.</li><br /><br />
					<li>The Female: 16-34 category operated between 2004 and 2007. It was absorbed into the new Female: Open category for the 2008 race and for subsequent races.</li><br /><br />
					<li>The Male: 40 and Over category operated for 2004 only and was then absorbed into the new Male: 40-49 category for subsequent races.</li><br /><br />
					<li>The Female: 35 and Over category operated for 2004 only and was then absorbed into the new Female: 35-44 category for subsequent races.</li><br /><br />
					<li>The Male: Open and Female: Open categories were introduced in 2008.</li><br /><br />
					<li>Categories were once again re-defined from 2013 as follows:-<br /><br />
					<ul type="disc">
						<li>Mens Open (first 3)</li>
						<li>Mens Masters</li>
						<ul>
							<li>Men 35-44</li>
							<li>Men 45-54</li>
							<li>Men 55+</li>
						</ul>
						<li>Mens Team Trophy (for pre-registered teams of 4)</li>
						<li>Ladies Open (first 3)</li>
						<li>Ladies Masters</li>
						<ul>
							<li>Women 35-44</li>
							<li>Women 45-54</li>
							<li>Women 55+</li>
						</ul>
						<li>Womens Team Trophy (for pre-registered teams of 3)</li>
					</ul>
					</li>				 
				</ol>
			</p>
		</div>   <!-- runnerstable -->
		<!--#include file="sponsors.asp" -->
	</div>   <!-- content -->
<!--#include file="ardennav.asp" -->
</body>
</html>
<%
%>
