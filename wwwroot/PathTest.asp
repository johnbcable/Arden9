<%@language="JScript" CODEPAGE="65001"%>
<%
Response.AddHeader("Access-Control-Allow-Origin", "*");
Response.AddHeader("Cache-Control", "no-cache,no-store,must-revalidate");
Response.AddHeader("Pragma", "no-cache");
Response.AddHeader("Expires", 0);
%>
<%


var dbpath = "../data/sports.mdb";
var serverpath = Server.MapPath(dbpath);

Response.Write("Server path to database is: "+serverpath);

Response.End();


%>


