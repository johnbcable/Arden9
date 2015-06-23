<%@language="JScript"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("The Arden 9-Mile Run - Home Page");
// Now apply redirect to new home page
Response.Redirect("index.html");
%>
