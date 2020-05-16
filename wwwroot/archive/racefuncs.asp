<script language=JScript runat=Server>
//
//  newRace(raceDate)    		      returns race object
//  getRace(year)    		          returns race object
//  setRace(raceobj)                  returns result object
//  printRace(raceobj)                returns string
//
// ================================================================
function getRace(year)
{
	// Establish local variables
	var RS, RS2, Conn, SQL1, SQL2, dbconnect, uniqref;
	var debugging = false;
	var dummy;
	var therace = new Object();
	// Set up database connections
	dbconnect = new String("DSN=hamptonsports").toString();
	Conn = Server.CreateObject("ADODB.Connection");
	RS = Server.CreateObject("ADODB.RecordSet");
	Conn.Open(dbconnect);
	// Initialise receiving object
	therace.race_year = new String("-1").toString();
	therace.race_date = new String("").toString();
	therace.photo_link = new String("").toString();
	therace.childrens1 = new String("").toString();
	therace.childrens2 = new String("").toString();
	therace.adult1 = new String("").toString();
	therace.results = new String("").toString();
	therace.hampton_link = new String("").toString();
	therace.childrens_results = new String("").toString();
	therace.race_date_text = new String("").toString();
	therace.race_comment = new String("").toString();
	therace.photo_provider = new String("").toString();

	SQL1 = new String("SELECT * from arden9races where race_year = "+year).toString();
	RS = Conn.Execute(SQL1);
	while (! RS.EOF)
	{
		therace.race_year = new String(RS("race_year")).toString();
		if (therace.race_year == "null")
			therace.race_year = new String("").toString();
		therace.race_date = new String(RS("race_date")).toString();
		if (therace.race_date == "null")
			therace.race_date = new String("").toString();
		therace.photo_link = new String(RS("photo_link")).toString();
		if (therace.photo_link == "null")
			therace.photo_link = new String("").toString();
		therace.childrens1 = new String(RS("childrens1")).toString();
		if (therace.childrens1 == "null")
			therace.childrens1 = new String("").toString();
		therace.childrens2 = new String(RS("childrens2")).toString();
		if (therace.childrens2 == "null")
			therace.childrens2 = new String("").toString();
		therace.adult1 = new String(RS("adult1")).toString();
		if (therace.adult1 == "null")
			therace.adult1 = new String("").toString();
		therace.results = new String(RS("results")).toString();
		if (therace.results == "null")
			therace.results = new String("").toString();
		therace.hampton_link = new String(RS("hampton_link")).toString();
		if (therace.hampton_link == "null")
			therace.hampton_link = new String("").toString();
		therace.childrens_results = new String(RS("childrens_results")).toString();
		if (therace.childrens_results == "null")
			therace.childrens_results = new String("").toString();
		therace.race_date_text = new String(RS("race_date_text")).toString();
		if (therace.race_date_text == "null")
			therace.race_date_text = new String("").toString();
		therace.race_comment = new String(RS("race_comment")).toString();
		if (therace.race_comment == "null")
			therace.race_comment = new String("").toString();
		therace.photo_provider = new String(RS("photo_provider")).toString();
		if (therace.photo_provider == "null")
			therace.photo_provider = new String("").toString();
		RS.MoveNext();
	}
	RS.Close();

	return (therace);
}
// ================================================================
function setRace(raceobj)
{
	// Establish local variables
	var sRace = new String(raceobj.race_year);
	var RS, RS2, Conn, SQL1, SQL2, dbconnect, uniqref;
	var mDateObj, dummy1;
	//
	dbconnect = new String("DSN=hamptonsports").toString();
	Conn = Server.CreateObject("ADODB.Connection");
	RS = Server.CreateObject("ADODB.RecordSet");
	Conn.Open(dbconnect);
	SQLstart = new String("UPDATE arden9races ")
	SQLend = new String(" WHERE race_year="+sRace).toString();
	SQLmiddle = new String("SET ").toString();
	SQLmiddle += "race_date='"+raceobj.race_date+"',";
	SQLmiddle += "photo_link = '"+raceobj.photo_link+"',";
	SQLmiddle += "childrens1 = '"+raceobj.childrens1+"',";
	SQLmiddle += "childrens2 = '"+raceobj.childrens2+"',";
	SQLmiddle += "adult1 = '"+raceobj.adult1+"',";
	SQLmiddle += "results = '"+raceobj.results+"',";
	SQLmiddle += "hampton_link = '"+raceobj.hampton_link+"',";
	SQLmiddle += "childrens_results = "+raceobj.childrens_results+",";
	SQLmiddle += "race_date_text = "+raceobj.race_date_text+",";
	SQLmiddle += "race_comment = "+raceobj.race_comment+",";
	SQLmiddle += "photo_provider = '"+raceobj.photo_provider+"'";
	SQL1 = new String(SQLstart+SQLmiddle+SQLend).toString();;
	RS = Conn.Execute(SQL1);
	return(true);
}

// ================================================================
function printRace(raceobj)
{
	// Establish local variables
	var sReport = new String("").toString();
		sReport += raceobj.race_year +"<br />";
		sReport += raceobj.race_date +"<br />";
   		sReport += raceobj.photo_link +"<br />";
		sReport += raceobj.childrens1 +"<br />";
		sReport += raceobj.childrens2 +"<br />";
		sReport += raceobj.adult1 +"<br />";
		sReport += raceobj.results +"<br />";
		sReport += raceobj.hampton_link +"<br />";
		sReport += raceobj.childrens_results +"<br />";
		sReport += raceobj.race_date_text +"<br />";
		sReport += raceobj.race_comment +"<br />";
		sReport += raceobj.photo_provider +"<br />";
	return(sReport);
}
// ================================================================
function newRace(raceDate)
{
	// Establish local variables
	var RS, RS2, Conn, SQL1, SQL2, dbconnect, uniqref;
	var debugging = false;
	var result;
	var therace = new Object();
	var raceYear;
	// Set up database connections
	dbconnect = new String("DSN=hamptonsports").toString();
	Conn = Server.CreateObject("ADODB.Connection");
	RS = Server.CreateObject("ADODB.RecordSet");
	Conn.Open(dbconnect);
	// Get race year from race date
	raceYear = raceDate.getFullYear();
	// Attempt to get this race back from database if already there
	therace = getRace(raceYear);
	// Now, if not found on database, populate with defaults
	if (therace.race_year === "-1") {
		therace.race_year = new String(raceYear).toString();
		therace.childrens1 = new String("N").toString();
		therace.childrens2 = new String("N").toString();
		therace.adult1 = new String("Y").toString();
		therace.results = new String("9mileresults.asp?year="+raceYear).toString();
		therace.hampton_link = new String("9milehina.asp?year="+raceYear).toString();
		therace.race_date_text = fulltextdate(raceDate);
		// Insert new marker record into arden9races with correct race year
		var SQL1 = new String("INSERT INTO arden9races(race_year) VALUES ("+raceYear+")").toString();
		RS=Conn.Execute(SQL1);
		RS.Close();
	}
	// Propagate update to arden9races now we know there is a destination record there
	result = setRace(therace);
	return (therace);
}
// ================================================================

</script>
