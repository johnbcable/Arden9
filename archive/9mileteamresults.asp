<%@language="JScript"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("The Arden 9: 9-Mile Run Results for a Team or Club");
// Now for any variables local to this page
var debugging=false;
var firstletter;
var ConnObj, RS, SQL0, SQL1, SQL2, SQL3, SQL4;
var dbconnect=Application("hamptonsportsdb");
var theteam, theforename;
var nofinishknt, catknt;
var noteamname = false;     // defaults to a surname being supplied
var m_race_year, m_race_date, m_photo_link, m_childrens1, m_childrens2, m_adult1;
var m_results, m_childrensresults, m_hampton, m_race_text, m_race_comments, m_photo_provider;
var race_years = new Array("2014","2013","2012","2011","2010","2009","2008","2007","2006","2005","2004");
var age_categories = new Array("All ages","Male: 16-39","Male: 40-49","Male: 50+","Female: 16-34","Female: 35-44","Female: 45+");
var age_values = new Array("All","M16-39","M40-49","M50+","F16-34","F35-44","F45+");
var posheading = new String("Overall Position").toString();
var nofinishheading = new String("The following runners registered but recorded no finish time:").toString();
var catheading = new String("").toString();
var currentdate, currentmonth, currentyear;
var surnametail, prevteam, theclub, theyear, prizetext, dummy;
// Set up default greeting strings
theteam = new String("").toString();
theforename = new String("").toString();
strdate = datestring();
strtime = timestring();
greeting = "Welcome to the Arden 9: 9-Mile Team Results"
theteam = new String(Request.QueryString("teamname")).toString();
if (theteam == "" || theteam == "null" || theteam == "undefined")
{
	theteam = new String(Request.Form("teamname")).toString();
	if (theteam == "" || theteam == "null" || theteam == "undefined")
	{
		noteamname = true;
		theteam = new String("NONE").toString();;
	}
}
//   if (theteam == "NONE")
//   	 Response.Redirect("9mileraceresults.asp");
ConnObj = Server.CreateObject("ADODB.Connection");
RS = Server.CreateObject("ADODB.RecordSet");
RS2 = Server.CreateObject("ADODB.RecordSet");
ConnObj.Open(dbconnect);
// Now construct the SQL depending on the year and category chosen.
SQL1 = new String("SELECT * FROM arden9runners ").toString();
if (! noteamname)
{
	SQL1 += "WHERE club = '"+theteam+"' ";
	// Now remove any * characters in theteam prior to displaying it
	
	theteam = new String(theteam.replace("*","")).toString();
}
SQL1 += "ORDER BY club, RaceYear desc, Surname, Forename desc";

// End of page start up coding
if (debugging)
{
	Response.Write("=======================  SQL debugging ===============================<br />");
	Response.Write("theteam = ["+theteam+"]<br />");
	Response.Write("SQL1 = ["+SQL1+"]<br />");
	Response.Write("===============  End of SQL debugging ================================<br />");
}
%>
<!--#include file="pagehead.asp" -->
	<div id="content">
		<h3>Team Results Sheet</h3>
		<div id="personsresultsform">
			<form name="ArdenPersonResultsForm" action="9mileteamresults.asp" method="get">
				<fieldset>
					<legend>Choose which team</legend>
					<div style="text-align:center; font-size:0.7em;">
						<br /><br />
						Name of team:&nbsp;<input type="text" name="teamname" id="teamname" size="25" maxlength="35" value="<%= theteam %>">
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
				You must fill in a full team name for the search to proceed. If you dont, and click Fetch,
				you will be returned to the normal race results page
			</p>
			<p>
				While we make every effort to ensure that the results that we will show below are as correct as they can be, 
				if you do see any obvious errors when they are posted here, please let us know
			</p>
		</div>
		<div>
			<p>
				The full list of team result entries for the above is shown below. Each entry
				includes the course time (in minutes:seconds), and the age category applicable at 
				the time of the race (shown to the right of the runner's name). <br /><br />
				The list is presented in descending date (most recent race first) order.
			</p>
		</div>		
<%
if (debugging)
{
	Response.Write("=======================  SQL debugging ===============================<br />");
	Response.Write("theteam = ["+theteam+"]<br />");
	Response.Write("theforename = ["+theforename+"]<br />");
	Response.Write("SQL1 = ["+SQL1+"]<br />");
	Response.Write("===============  End of SQL debugging ================================<br />");
}
if (! noteamname)
{
%>
		<div id="runnerstable" style="clear:both;">
			<table>
				<th style="text-align:center;">Pos.</th>
				<th style="text-align:center;">Time Taken (mm:ss)</th>
				<th >Name</th>
				<th style="text-align:center;">Category</th>
				<th style="text-align:center;">Race<br />No.</th>
<%
			prevteam = new String("KEFGLEKRGRKE").toString();
			prevyear = new String("0000").toString();
			RS = ConnObj.Execute(SQL1);
			while (! RS.EOF)
			{
			 theclub = new String(RS("club")).toString();
			 theyear = new String(RS("RaceYear")).toString();
			if (debugging)
			{
%>
			  <tr>
					<td colspan="7">Row found - surname = <%= RS("surname") %>, year = <%= RS("RaceYear") %></td>
				</tr>
<%
			}
			if (! (prevteam == theclub) )
			{
%>			
			  <tr>
						<td colspan="5" bgcolor="#c0c0c0">
								<span style="font-weight: bold; font-size: 1.25em; margin-left: 10px;"><%= theclub %></span>
						</td>
				</tr>
<%
				prevteam = new String(theclub).toString();
			}
			if (! (theyear == prevyear) )
			{	
				 	prizetext = new String("").toString();						
			    SQL2 = new String("SELECT * FROM arden9winners ").toString();
					SQL2 += "WHERE winners_club = '"+theteam+"' AND category_code in ('F-TEAM','M-TEAM') AND race_year = "+theyear;
if (debugging)
{
	Response.Write("=======================  SQL debugging ===============================<br />");
	Response.Write("theteam = ["+theteam+"]<br />");
	Response.Write("SQL2 = ["+SQL2+"]<br />");
	Response.Write("===============  End of SQL debugging ================================<br />");
}
					RS2 = ConnObj.Execute(SQL2);
					while (! RS2.EOF)
					{
					 			if (prizetext == "")
									 prizetext = new String("Winners of ");
								if (RS2("category_code") == "F-TEAM")
									 prizetext += "Female Team prize";
								if (RS2("category_code") == "M-TEAM")
									 prizetext += "Male Team prize";
								prizetext += "  "
								RS2.MoveNext();
					}
					RS2.Close();
					prizetext = new String(prizetext).toString();
					dummy = prizetext.length;
 				  prizetext = new String( "["+prizetext+"]" ).toString();
%>			
			  <tr>
						<td colspan="5" bgcolor="#66cccc">
								<span style="font-weight: bold; font-size: 1.10em; margin-left: 10px;"><%= theyear %></span>&nbsp;<%= prizetext %>
						</td>
				</tr>
<%
				prevyear = new String(theyear).toString();
			}
%>
				<tr>
					<td style="text-align:center;"><%= RS("Pos") %></td>
					<td style="text-align:center;"><%= RS("time") %></td>
					<td ><%= RS("forename") %>&nbsp;<%= RS("surname") %></td>
					<td style="text-align:center;"><%= RS("category") %></td>
					<td style="text-align:center;"><%= RS("raceno") %></td>
				</tr>
<%
				RS.MoveNext();
			}
			RS.Close();
%>
			<tr>
				<td colspan="5" align="center" bgcolor="#c0c0c0"><hr /></td>
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
