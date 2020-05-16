<script language="JScript" CODEPAGE="65001" runat=Server>
//
//  getFutureEvents( limit)             returns string
//  getEventByID(eventid)               returns Event object
//
function getFutureEvents(howmanylimit)
{
	// Establish local variables
	var RS, RS2, Conn, SQL1, SQL2, dbconnect, uniqref;
	var debugging = false;
	var editline, Eventsubject;
	var Eventlist = new String("").toString();
	var Eventknt = 0;
	var eventclass, evreport;
	var totaltoget = new Number(howmanylimit);
	totaltoget = totaltoget.valueOf();
	// Set up database connections
	var dbconnect=Application("hamptonsportsdb"); 
	Conn = Server.CreateObject("ADODB.Connection");
	RS = Server.CreateObject("ADODB.RecordSet");
	Conn.Open(dbconnect);
	// Need to query last 5 Events sent and return as string
	// title<hr><br>event1<br>event2<br> .... eventN<hr>
	// Ring fence displayed events to exclude COACHING, HOLIDAYCLBS
	SQL1 = new String("SELECT * from futureevents WHERE eventtype in ('EVENT','SOCIAL','MATCH','JUNIOR','TOURNAMENT')").toString();
	Eventlist += '<div id="futureevents"><ol>';
	RS = Conn.Execute(SQL1);
	Eventknt = 0;
	while (! RS.EOF && Eventknt < totaltoget)
	{
		evreport = new String(RS("eventreport")).toString();
		if (evreport == "" || evreport == "null" || evreport == "undefined")
			evreport = new String("NONE").toString();
		eventclass = new String(RS("eventtype")).toString();
		eventclass = eventclass.toLowerCase();
		if (evreport == "NONE")
		{
			Eventlist += '<li class="'+eventclass+'">'+RS("dateofevent")+' - '+RS("eventnote")+'</li>';
		}
		else
		{
			Eventlist += '<li class="'+eventclass+'"><a href="'+evreport+'">'+RS("dateofevent")+' - '+RS("eventnote")+'</a></li>';
		}

		Eventknt++;
		RS.MoveNext();
	}
	Eventlist += '</ol><p><a href="eventlist.asp">more events</a></p>';
	Eventlist += '</div>';
	RS.Close();
	return (Eventlist);
}
//=====================================================================
function todayAtTheClub()
{
	// Establish local variables
	var Eventobj = new Object();
	var RS, RS2, Conn, SQL1, SQL2, dbconnect, uniqref;
	// Set up database connections
	var dbconnect=Application("hamptonsportsdb"); 
	Conn = Server.CreateObject("ADODB.Connection");
	RS = Server.CreateObject("ADODB.RecordSet");
	Conn.Open(dbconnect);
	// Need to query particular Event database entry from fileref
	SQL1 = new String("SELECT * from events where eventdate=Date()").toString();
	RS = Conn.Execute(SQL1);
	while (! RS.EOF)
	{
		RS.MoveNext();
	}
	RS.Close();
	return (Eventobj);
}
</script>
