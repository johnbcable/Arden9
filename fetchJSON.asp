<%@language="VBScript"%>
<!--#include file="JSON_2.0.4.asp" -->
<!--#include file="JSON_UTIL_0.1.1.asp" -->
<%
' This page sends back JSON data to a requesting agent 
' From and identified DB query
'Dimension variables
Dim adoCon         'Holds the Database Connection Object
Dim rsDB		   'Holds the recordset for the records in the database
Dim strSQL         'Holds the SQL query to query the database	
Dim dataSource	   'Holds the name of the data source from the Application object
Dim dataResults    'Holds results from the JSON query
Dim querylist(20)  'Array of queries
Dim queryref       'Reference to query in querylist (default to 1)
Dim p1, p2, p3     'Parameters (text)
Dim paramknt       'Count of the number of parameters
Dim debugging      'Are we running in debug mode
Dim debug          'Placeholder for if we are to display debug info
Dim origSQL

p1 = ""
p2 = ""
p3 = ""
paramknt = 0

debugging = False  'Default production provision

'Now retrieve query details from submitting form or querystring
'and initialise the strSQL variable with an SQL statement to query the database
queryref = Request.Form("id")
If queryref = "" Then
	queryref = Request.QueryString("id")
	If queryref = "" Then
		queryref = -1
	End If
End If

' Optionally consider dealing with fill-in fields for the identified query
If queryref > -1 Then	

	p1 = Request.Form("p1")
	If p1 = "" Then
		p1 = Request.QueryString("p1")
		If p1 <> "" Then
			paramknt = paramknt + 1
		End If
	End If

	p2 = Request.Form("p2")
	If p2 = "" Then
		p2 = Request.QueryString("p2")
		If p2 <> "" Then 
			paramknt = paramknt + 2
		End If
	End If

	p3 = Request.Form("p3")
	If p3 = "" Then
		p3 = Request.QueryString("p3")
		If p3 <> "" Then
			paramknt = paramknt + 4
		End If
	End If

Else

 	'No query Id so use the supplied query
	thequery = Request.Form("thequery")
	If thequery = "" Then
		thequery = Request.QueryString("thequery")
		If thequery = "" Then
			thequery = "SELECT ""There are no results"" FROM coaches"
		End If
	End If

End If

debug = Request.Form("debug")
If debug = "" Then
	debug = Request.QueryString("debug")
	If debug = "Y" Then
		debugging = True
	End If
Else
	If debug = "Y" Then
		debugging = True
	End If
End If

'Retrieve the datSource name from the Application object
dataSource = Application("hamptonsportsdb")
'Create an ADO connection object
Set adoCon = Server.CreateObject("ADODB.Connection")	
'Set an active connection to the Connection object using DSN connection
adoCon.Open dataSource
'Create an ADO recordset object
Set rsDB = Server.CreateObject("ADODB.Recordset")	

If queryref > -1 Then

	'Initialise querylist with queries
	querylist(0) = "SELECT * FROM arden9runners"
	querylist(1) = "SELECT * FROM arden9runners WHERE [RaceYear] = {{p1}} AND [Category] LIKE '{{p2}}' ORDER BY Pos ASC"
	querylist(2) = "SELECT * FROM arden9races WHERE [race_year] = {{p1}}"
	querylist(3) = "SELECT * FROM arden9winners WHERE [race_year] = {{p1}} ORDER BY [category_sequence]"
	querylist(4) = "SELECT * FROM arden9runners WHERE [surname] = '{{p1}}' ORDER BY Surname, Forename, RaceYear DESC"
	querylist(5) = "SELECT * FROM arden9runners WHERE club = '{{p1}}' ORDER BY Club, RaceYear DESC, Surname, Forename DESC"
	querylist(6) = "SELECT * FROM arden9runners WHERE [RaceYear] = {{p1}} AND Pos > 0 ORDER BY Pos ASC"
	querylist(7) = "SELECT * FROM arden9winners WHERE [category] = '{{p1}}' ORDER BY [category] asc, [race_year] desc "
	querylist(8) = "SELECT * FROM arden9winners WHERE [category_code] LIKE '{{p1}}' ORDER BY [category] asc, [race_year] desc "
	querylist(9) = "SELECT * FROM arden9winners ORDER BY [category] asc, [race_year] desc "
	querylist(10) = "SELECT * FROM arden9runners WHERE [Hampton] = 'Y' AND [RaceYear] = {{p1}} ORDER BY Pos ASC"
	querylist(11) = "SELECT * FROM arden9runners WHERE [Hampton] = 'Y' AND [RaceYear] = {{p1}} AND [Category] LIKE '{{p2}}' ORDER BY Pos ASC"
	querylist(12) = "SELECT DISTINCT(category) FROM arden9runners WHERE [RaceYear] = {{p1}} "

	strSQL = querylist(queryref)
	origSQL = strSQL

	'Now, replace any fill-in fields with their params

	If (paramknt > 0)  Then
		strSQL = replace(strSQL, "{{p1}}", p1)
	End If

	If (paramknt > 1)  Then
		strSQL = replace(strSQL, "{{p2}}", p2)
	End If

	If (paramknt > 2)  Then
		strSQL = replace(strSQL, "{{p3}}", p3)
	End If

	'Now for any predecided substitutions
	
Else

	strSQL = thequery
	origSQL = strSQL

End If

If debugging Then
	Response.Write("p1 = [" & p1 & "]<br />")
	Response.Write("p2 = [" & p2 & "]<br />")
	Response.Write("p3 = [" & p3 & "]<br />")
	Response.Write("origSQL = [" & origSQL & "]<br />")
	Response.Write("strSQL = [" & strSQL & "]<br />")
	Response.End
End If

dataResults = QueryToJSON(adoCon, strSQL).Flush

Response.ContentType = "application/json"
Response.Write(dataResults)
Response.End
%>
