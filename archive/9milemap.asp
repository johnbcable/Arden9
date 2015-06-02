<%@language="JScript"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("The K&amp;D Arden 9 Mile Road Race: Course Map");
// Now for any variables local to this page
var debugging=false;
var ConnObj, RS, SQL1, SQL2, SQL3;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
greeting = "Welcome to the Arden 9: 9-Mile Run Course Map"
// End of page start up coding
%>
<!--#include file="pagehead.asp" -->
	<div id="content">
		<h3>The K&amp;D Arden 9 Mile Road Race<br>Sunday 22<sup>nd</sup> June, 2014<br>Course Map</h3>
		<div id="routemap">
			<img src="images/9milemapmyrun.jpg">
		</div>
		<p>
			The course will be run in an anti-clockwise direction starting and finishing at
			Hampton-In-Arden Sports Club, Shadowbrook Lane, Hampton-In-Arden. Car parking 
			and changing facilities are available at the club.
		</p>
		<h3>Directions to Hampton-In-Arden Sports Club</h3>
		<p>
			Hampton-In-Arden is situated in the green-belt area between Birmingham and Coventry. The main
			road to/through Hampton-In-Arden is the B4102 between Solihull and Meriden. On reaching the 
			village green, situated near to the railway bridge, turn into Shadowbrook Lane 
			by the war memorial and the sports club car park entrance is 100 yards on the right.
			The nearest motorway junctions are Junctions 5 and 6 of the M42 - Knowle and the A45 respectively.
		</p>
<!--#include file="sponsors.asp" -->
	</div>   <!--   content   -->
<br />
<!--#include file="ardennav.asp" -->
</body>
</html>
<%
%>
