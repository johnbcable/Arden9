<%@language="JScript"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="resultfuncs.asp" -->
<%
var strtime, strdate, title2;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Saving an Arden 9 Race Result for a Runner");
// Now for any variables local to this page
var mUnique;
var ConnObj;
var RS;
var SQL1, SQL2;
var dbConnect="DSN=hamptonsports";
var mOurScore, mTheirScore, mNote;
var mFixtureDate, mVenue, mOpponents;
var mOpponents, mVenue;
var mPair1, mPair2;
// Start page processing
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
// Initialise update variables
mUnique=Trim(new String(Request.Form("uniqueid")));
mOurScore=Trim(new String(Request.Form("hamptonscore")));
mTheirScore=Trim(new String(Request.Form("opponentscore")));
mNote=Trim(new String(Request.Form("captainsnote")));
mOpponents=Trim(new String(Request.Form("opponents")));
mVenue=Trim(new String(Request.Form("venue")));
mPair1=Trim(new String(Request.Form("pair1")));
mPair2=Trim(new String(Request.Form("pair2")));
if (mNote=="" || mNote=="undefined" || mNote=="null")
	mNote=" ";
mFixtureDate = new String(Request.Form("fixturedate")).toString();
// Do DB update
ConnObj=Server.CreateObject("ADODB.Connection");
RS=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbConnect);
// get other data back about this fixture
SQL2 = new String("SELECT * from tennisfixtures where fixtureid="+mUnique).toString();
RS = ConnObj.Execute(SQL2);
if (! RS.EOF)
{
	theyear = new String(RS("fixtureyear")).toString();
	theteam = new String(RS("teamname")).toString();
}
SQL1=new String("UPDATE tennisfixtures set opponents='"+mOpponents+"',hamptonresult="+mOurScore+",opponentresult="+mTheirScore+",fixturenote='"+mNote+"', fixturedate='"+mFixtureDate+"', homeoraway='"+mVenue+"', pair1='"+mPair1+"', pair2='"+mPair2+"' where fixtureid="+mUnique);
// RS = ConnObj.Execute(SQL1);
var debugging = false;
var updating = true;
%>
<!--#include file="sectionhead.asp" -->
	<div id="content">
		<div id="mainContent">
<%
if (debugging)
	Response.Write("<br><p align=center>"+SQL1+"<br>"+SQL2+"</p><hr>");
if (updating)
{
	RS = ConnObj.Execute(SQL1);
}
%>
			<h3>
			Fixtures updated for <%= theteam %><br><br>
			</h3>
			<div id="morefixtureupdates" class="borderboth" align="center">
				<form name="MoreResults" action="lstfixtures.asp" method="GET">
					<input type="hidden" name="season" value="<%= theyear %>" size="4">
					<input type="hidden" name="team" value="<%= theteam %>" size="30">
					<input type="submit" value="More results for <%= theteam %> in the <%= theyear %> season ..." name="gofetch">
				</form>
				<br />
				<a href="new_fixture.asp?teamname=<%= theteam %>&season=<%= theyear %>">Another fixture for <%= theteam %> in <%= theyear %></a>
			</div>
	</div>
		<div id="rightcolumn"><!--#include file="addresspanel.asp" -->
<!--#include file="newspanel.asp" --><!--#include file="emailpanel.asp" -->		</div>	</div>	<div id="leftcolumn"><!--#include file="fixturepanel.asp" -->
<!--#include file="memb_nav.asp" -->		</div>	<div id="footer"><!--#include file="textnav.asp" -->
	</div></div></body></html><%%>
