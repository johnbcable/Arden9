<%@language="JScript"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("The Arden 9: Application Forms");
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
		<h3><%= pagetitle %></h3>
		<div>
			<p>
			
			</p>
			<p>
			
			</p>
		</div>
		<!--#include file="sponsors.asp" -->		
	</div>       <!-- content -->
<br />
<!--#include file="ardennav.asp" -->
</body>
</html>
<%
%>
