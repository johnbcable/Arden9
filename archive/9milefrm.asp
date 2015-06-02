<%@language="JScript"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("The K&amp;D ASICS Arden 9: Application Forms");
// Now for any variables local to this page
var debugging=false;
var ConnObj, RS, SQL1, SQL2, SQL3;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
%>
<!--#include file="pagehead.asp" -->
	<div id="content">
		<h3>The K&amp;D ASICS Arden 9-Mile Run: Sunday 24th, June 2012<br />Race Application Forms</h3>
		<div id="applicationblurb">
			<p>
				From 2010, you may only enter the ASICS Arden 9	online at the Runners World web site.		
			</p>
		</div>
		<br />
		<div id="runnersworlddetails">
			<h5>Registering</h5>
			<a href="http://www.runnersworld.co.uk/events/registrationinfo.asp?sp=&v=2&EN=57760">
				<img src="images/runnersworld.gif" alt="Runners World site" width="225" height="60" />
			</a>
			<p>
				You must enter the race by completing the entry form on the <a href="http://www.runnersworld.co.uk/events/registrationinfo.asp?sp=&v=2&EN=57760">Runners World web site</a>
				(click logo go go there). The Runners World web site also allows you to 'rate the race' and post some comments about it for everyone to see.
			</p>
		</div>
<!--		
		<div id="formstable" class="centered">
			<table style="width:70%; text-align:center;" >
				<th>Format</th>
				<th>Link</th>
				<tr>
					<td>
						Microsoft Excel format
					</td>
					<td>
						<a href="9milefrm2011.xls" target="_appform">Click</a>
					</td>
				</tr>
				<tr>
					<td>
						Adobe Acrobat format
					</td>
					<td>
						<a href="9milefrm2011.pdf" target="_appform">Click</a>
					</td>
				</tr>
				<tr>
					<td>
						Web page format
					</td>
					<td>
						<a href="9milefrm2011.asp" target="_appform">Click</a>
					</td>
				</tr>
			</table>
		</div>
		<br />
		<div id="finalblurb">
			<p>
				For best quality printing results, choose Excel or Acrobat formats.<br />
				To print directly from the web, choose the web page format
			</p>
			<p>
				When you click on any of the Click links above, a new browser window starts up
				containing your Excel, Acrobat or web page application form. You may then 
				print directly from this window.
			</p>
			<p>
				Alternatively, for the Excel and Acrobat links ONLY, you may right-click the Click
				link and choose "Save Target As .. " to save a copy of the Excel spreadsheet or 
				Acrobat document on your own computer.
			</p>
		</div>
-->		
		<!--#include file="sponsors.asp" -->		
	</div>       <!-- content -->
<br />
<!--#include file="ardennav.asp" -->
</body>
</html>
<%
%>
