<%@language="JScript"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("The Arden 9-Mile Run - Home Page");
// Now for any variables local to this page
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<head>
<title>K&amp;D ASICS Arden 9 Road Race - Home Page</title>
<meta http-equiv="Content-type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="Content-Language" content="en-us" />
	<link rel=STYLESHEET type="text/css" href="arden9.css">
	<script type="text/javascript" src="minmax.js"></script>
</head>
<body>
<!--#include file="pagehead.asp" -->
	<div id="content">
		<h2>
			Sunday June 22<sup>nd</sup> 2014
		</h2>
<!--
		<p style="margin-bottom: 20px; padding: 0 20px; color: blue; font-weight: bold;">
			 Response for the 2013 race has been tremendous so we will have very limited places available to allow some on-the-day entrants up to our race limit (up to 20). On the day sign-ups will be 
			 limited to Warwickshire Road Race League racers only.
		</p>
-->
		<img id="startinglineup" border="0" src="images/theyreoff2013.jpg" width="100%" alt="And they&apos;re off at the start of the 10th Arden 9 Road Race. Photo kindly provided by Lou Satterthwaite" title="And they&apos;re off at the start of the 10th Arden 9 Road Race. Photo kindly provided by Lou Satterthwaite" />
		<p>
			Come and join in for our 11th race and see if we can make 2014 bigger and better than 2013!<br /><br />
			<strong>Starting at 10:30 a.m.</strong> from the Hampton-In-Arden Sports 
			Club grounds, the race is properly measured and timed and is designed to attract serious runners from outside the sports club and the village. There is an advance entry fee of <b>&pound;13 </b>per entrant, or <b>&pound;11</b> if you are attached to an affiliated club. Anyone is welcome to enter on a first come first served basis. Details of the route are available <a href="9milemap.asp">here</a> on our web site.
		</p>
		<p>
			All entrants are free to raise their own sponsorship money after paying their entrance fee. 
			Sample sponsorship forms for some charities can be downloaded from this web site
			<a href="9milesponsorforms.asp">here</a>
		</p>
		<p>
			Entry to the race will be via the on-line Runners World web site only. At the Runners World web site, you can also pay your race fee by credit card. 
		</p>

		<div id="overlaywrapper">
<!--
				<div id="overlayboxquote" class="boxright" style="text-align: center;">
					<h2 class="boxheader">Registering</h2>
					<a href="http://www.runnersworld.co.uk/kdasicsarden9">
						 <img src="images/RWLogo_stacked.jpg" alt="Runners World site" width="163" height="75" />
					</a>
					<p>
						 You must enter the race by completing the entry form on the <a href="http://www.runnersworld.co.uk/kdasicsarden9">Runners World web site</a>
						 (click logo to go there). The Runners World web site also allows you to 'rate the race' and post some comments about it for everyone to see.
				 </p>
				 </div>
-->
				 <p>
					From 2008 up to and including 2010, the winners summary table on the <a href="9mileraceresults.asp">Results</a> page shows Male Open, Male 40-49 and 
					Male 50+ winners and Female Open, Female 35-44, Female 45+ winners. The Male 16-39 and Female 16-34 runners are now included in the 
					Open titles.
				 </p>
				 <p>
			 		From 2011, the Arden 9 additionally provides team awards (one for Males, one for Females) and these are also noted in the winners table.
				 </p>
				 <p>
				 	Starting with 2013, the categories for runners and teams have changed and are much more consistent between men and women. so, from 2013 onwards, the categories used are: Mens Open, Mens Masters (35-44, 45-54 and 55+); similarly for the ladies: Womens Open, Womens Masters (35-44, 45-54 and 55+). Team trophies (one each for Men and for Women) are also still available. 
				 </p>
				 <p>
				 We always welcome ideas for presentation and content on this web site. If you
				 would like to see something here that isn't or if you would
				 like to comment on this layout, please feel free to contact us at 
				 <a href="mailto:support@hamptontennis.org.uk">
				 support@hamptontennis.org.uk
				 </a>&nbsp;and we will do our best to reply and take your suggestions into account
				 </p>
		</div>   <!-- end of overlaywrapper -->
		<!--#include file="sponsors.asp" -->
	</div>   <!--   content   -->
<br />
<!--#include file="ardennav.asp" -->
</body>
</html>
<%
%>
