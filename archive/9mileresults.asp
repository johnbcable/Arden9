<%@language="JScript"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("The Arden 9: Results Section");
// Now for any variables local to this page
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<head>
<title>K&amp;D Arden 9 Road Race - Results Section</title>
<meta http-equiv="Content-type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="Content-Language" content="en-us" />
	<link rel=STYLESHEET type="text/css" href="arden9.css">
	<script type="text/javascript" src="minmax.js"></script>
</head>
<body>
<!--#include file="pagehead.asp" -->
	<div id="content">
		<h2>
			Results
		</h2>
		<p>
			The K&amp;D Arden 9-Mile Road Race has been running once a year since 2004 .... and we have a lot of results on the site to prove it! From 2008, we have introduced more flexibility into displaying current and historical results from the Arden 9. This has coincided with a reorganisation of the way in which we use and display age category result information.
		</p>
		<div id="resultsmenu" class="bordertop">
			<div id="mainresults">
				<div class="actionbutton">
	 				<a href="9mileraceresults.asp">Main Results</a>
				</div>
				<div class="actiontext">
					<p>
						<strong>Main (familiar) race results page</strong><br />
						Here you can display the full result information from any of the Arden 9 races, choosing to filter by year and/or age category if desired.<br /><br />
					</p>
		 		</div>
			</div>
			<div id="winnershistory">
				<div class="actionbutton">
	 				<a href="9milewinnerhistory.asp">Winners History</a>
				</div>
				<div class="actiontext">
					<p>
						<strong>Winners history page</strong><br />
						Here you can display information about past winners of the Arden 9 without having 
						to open up each individual race.<br /><br />
					</p>
		 		</div>
			</div>
			<div id="personhistory">
				<div class="actionbutton">
	 				<a href="9milepersonresults.asp">Personal Results</a>
				</div>
				<div class="actiontext">
					<p>
						<strong>Arden 9 appearance results for a person</strong><br />
						Here you can track how a person has performed in the Arden 9 race over the years.<br /><br />
					</p>
		 		</div>
			</div>
			
			<div id="teamhistory">
				<div class="actionbutton">
	 				<a href="9mileteamresults.asp">Team Results</a>
				</div>
				<div class="actiontext">
					<p>
						<strong>Arden 9 appearance results for a team</strong><br />
						Here you can see how people from a given team/club performed in the Arden 9 race over the years.<br /><br />
					</p>
		 		</div>
			</div>
		
		</div>
		<div class="borderboth" style="clear: both;">
			<h3>Notes on Age Categories</h3>
			<ol>
				<li>The Male: 16-39 category operated between 2004 and 2007. It was absorbed into the new Male: Open category for the 2008 race and for subsequent races.</li><br /><br />
				<li>The Female: 16-34 category operated between 2004 and 2007. It was absorbed into the new Female: Open category for the 2008 race and for subsequent races.</li><br /><br />
				<li>The Male: 40 and Over category operated for 2004 only and was then absorbed into the new Male: 40-49 category for subsequent races.</li><br /><br />
				<li>The Female: 35 and Over category operated for 2004 only and was then absorbed into the new Female: 35-44 category for subsequent races.</li><br /><br />
				<li>The Male: Open and Female: Open categories were introduced in 2008.</li><br /><br />
				<li>The Male and Female Team prize categories were introduced in 2011</li><br /><br />
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
		</div>		
		<p>
			We always welcome ideas for presentation and content on this web site. If you
			would like to see something here that isn't or if you would
			like to comment on this layout, please feel free to contact us at 
			<a href="mailto:support@hamptontennis.org.uk">
			support@hamptontennis.org.uk
			</a>&nbsp;and we will do our best to reply and take your suggestions into account
		</p>
		<!--#include file="sponsors.asp" -->
	</div>   <!--   content   -->
<br />
<!--#include file="ardennav.asp" -->
</body>
</html>
<%
%>
