<script language=JScript runat=Server>
//
//  getRaceResult(year,pos,raceno)                     	returns raceresult object
//  setRaceResult(raceresultobj)			returns boolean
//
// ================================================================
function getRaceResult(year,pos,raceno)
{
	// Establish local variables
	var theraceresult = new Object();
	var m_year = new String(year).toString();
	var m_pos = new String(pos).toString();
	var m_raceno = new String(raceno).toString();
	var RS, RS2, Conn, SQL1, SQL2, dbconnect, uniqref;
	var mDateObj, dummy1;
	//
	theraceresult.raceyear = new String(m_year).toString();
	theraceresult.pos = new String(m_pos).toString();
	theraceresult.raceno = new String(m_raceno).toString();
	theraceresult.surname = new String("").toString();
	theraceresult.forename = new String("").toString();
	theraceresult.age = new String("").toString();
	theraceresult.sex = new String("").toString();
	theraceresult.time = new String("").toString();
	theraceresult.category = new String("").toString();
	theraceresult.club = new String("").toString();
	theraceresult.email = new String("").toString();
	theraceresult.hampton = new String("").toString();
	//
	dbconnect = new String("DSN=hamptonsports").toString();
	Conn = Server.CreateObject("ADODB.Connection");
	RS = Server.CreateObject("ADODB.RecordSet");
	Conn.Open(dbconnect);
	// Retrieve result info on basis of supplied keys
	SQL1 = new String("SELECT * from arden9runners where RaceYear="+m_year+" AND Pos="+m_pos+" AND RaceNo="+m_raceno).toString();
	RS = Conn.Execute(SQL1);
	if (! RS.EOF)
	{
		theraceresult.surname = new String(RS("surname")).toString();
		theraceresult.forename = new String(RS("forename")).toString();
		theraceresult.age = new String(RS("age")).toString();
		theraceresult.sex = new String(RS("sex")).toString();
		theraceresult.time = new String(RS("time")).toString();
		theraceresult.category = new String(RS("category")).toString();
		theraceresult.club = new String(RS("club")).toString();
		theraceresult.email = new String(RS("email")).toString();
		theraceresult.hampton = new String(RS("hampton")).toString();
	}
	return(theraceresult);
}
// ================================================================
function setRaceResult(raceresultobj)
{
	// Establish local variables
	var sFixture = new String(raceresultobj.fixtureid);
	var RS, RS2, Conn, SQL1, SQL2, dbconnect, uniqref;
	var mDateObj, dummy1;
	//
	dbconnect = new String("DSN=hamptonsports").toString();
	Conn = Server.CreateObject("ADODB.Connection");
	RS = Server.CreateObject("ADODB.RecordSet");
	Conn.Open(dbconnect);
	SQLstart = new String("UPDATE arden9runners ")
	SQLend = new String(" WHERE RaceYear="+raceresultobj.raceyear+" AND Pos="+raceresultobj.pos+" AND RaceNo="+raceresultobj.raceno+).toString();
	SQLmiddle = new String("SET ").toString();
	SQLmiddle += "surname='"+raceresultobj.surname+"',";
	SQLmiddle += "forename = '"+raceresultobj.forename+"',";
	SQLmiddle += "age = "+raceresultobj.age+",";
	SQLmiddle += "sex = '"+raceresultobj.sex+"',";
	SQLmiddle += "time = '"+raceresultobj.time+"',";
	SQLmiddle += "category = '"+raceresultobj.category+"',";
	SQLmiddle += "club = '"+raceresultobj.club+"',";
	SQLmiddle += "email = "+raceresultobj.email+"',";
	SQLmiddle += "hampton = "+raceresultobj.theirscore+"',";
	SQLmiddle += "fixtureyear = '"+raceresultobj.hampton"'";
	SQL1 = new String(SQLstart+SQLmiddle+SQLend).toString();
	RS = Conn.Execute(SQl1);
	return(SQL1);
}
// ================================================================</script>