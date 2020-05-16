<%@language="JScript"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("<<pagetitle >>");
// Now for any variables local to this page
var debugging=false;
var ConnObj, RS, SQL1, SQL2, SQL3;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
%>
<!--#include file="pagehead.asp" -->
<table  width=650 border="0" cellspacing="0" cellpadding="0" cols="100,*,120">
  <tr>
    <td>
<p class=MsoNormal align=center style='text-align:center'><b style='mso-bidi-font-weight:
normal'><span style='font-size:20.0pt;font-family:Verdana'>The </span></b>
<st1:City><st1:place><b
  style='mso-bidi-font-weight:normal'><span style='font-size:20.0pt;font-family:
  Verdana'>ASICS Arden</span></b></st1:place></st1:City><b style='mso-bidi-font-weight:
normal'><span style='font-size:20.0pt;font-family:Verdana'> 9 Mile Road Race<o:p></o:p></span></b></p>

<p class=MsoNormal align=center style='text-align:center'><b style='mso-bidi-font-weight:
normal'><span style='font-size:12.0pt;mso-bidi-font-size:20.0pt;font-family:
Verdana'>www.arden9.org.uk<o:p></o:p></span></b></p>

<p class=MsoNormal align=center style='text-align:center'><st1:date Year="2004"
Day="13" Month="6"><b style='mso-bidi-font-weight:normal'><span
 style='font-size:20.0pt;font-family:Verdana'>Sunday June 17<sup>th</sup> 2007</span></b></st1:date><b
style='mso-bidi-font-weight:normal'><span style='font-size:20.0pt;font-family:
Verdana'> – </span></b><st1:time Minute="30" Hour="10"><b style='mso-bidi-font-weight:
 normal'><span style='font-size:20.0pt;font-family:Verdana'>10.30am</span></b></st1:time><b
style='mso-bidi-font-weight:normal'><span style='font-size:20.0pt;font-family:
Verdana'> start<o:p></o:p></span></b></p>

<p class=MsoNormal style='margin-top:6.0pt;margin-right:0cm;margin-bottom:0cm;
margin-left:-27.0pt;margin-bottom:.0001pt;text-align:justify'><span
style='font-size:9.0pt;font-family:Verdana;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='margin-top:6.0pt;margin-right:0cm;margin-bottom:0cm;
margin-left:-27.0pt;margin-bottom:.0001pt;text-align:justify'><span
style='font-size:9.0pt;font-family:Verdana;mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><b><span
style='font-size:9.0pt;font-family:Verdana'>Acceptance<o:p></o:p></span></b></p>

<p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
style='font-size:9.0pt;font-family:Verdana;mso-bidi-font-weight:bold'>Thank you
for entering the </span><st1:City><st1:place><span style='font-size:9.0pt;
  font-family:Verdana;mso-bidi-font-weight:bold'>ASICS Arden</span></st1:place></st1:City><span
style='font-size:9.0pt;font-family:Verdana;mso-bidi-font-weight:bold'> 9 mile
road race.<span style='mso-spacerun:yes'>  </span>Your entry has been accepted and
you will find enclosed with this letter your race number.
We hope that you will have a great day out and will achieve your personal goals.<o:p></o:p></span></p>

<p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><b
style='mso-bidi-font-weight:normal'><span style='font-size:9.0pt;font-family:
Verdana'><o:p>&nbsp;</o:p>Road race permit code – MC/07/009</span></b></p>

<p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
style='font-size:9.0pt;font-family:Verdana;mso-bidi-font-weight:bold'>The race
is intended for both regular runners and novices and has been approved by the
Midland Counties Athletic Association as a race that will be held under the
current laws of competition of the Amateur Athletic Association of England and
in accordance with the bye-laws of the Midland Counties Athletic Association.<o:p></o:p></span></p>

<p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><b
style='mso-bidi-font-weight:normal'><span style='font-size:9.0pt;font-family:
Verdana'><o:p>&nbsp;</o:p>UK Athletics Course Measurement Scheme</span></b><span style='font-size:
9.0pt;font-family:Verdana;mso-bidi-font-weight:bold'><o:p></o:p></span></p>

<p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
style='font-size:9.0pt;font-family:Verdana;mso-bidi-font-weight:bold'>The course
has been measured as nine miles by the UK Athletics Course Measurement Scheme using
a calibrated cycle (or Jones Counter) in the hands of a fully trained and accredited 
course measurer.<o:p></o:p></span></p>

<p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><b><span
style='font-size:9.0pt;font-family:Verdana'><o:p>&nbsp;</o:p>Directions to </span></b>
<st1:City><st1:place><b><span
  style='font-size:9.0pt;font-family:Verdana'>Hampton-In-Arden</span></b></st1:place></st1:City><b><span
style='font-size:9.0pt;font-family:Verdana'><o:p></o:p></span></b></p>

<p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><st1:City><st1:place><span
  style='font-size:9.0pt;font-family:Verdana;mso-bidi-font-weight:bold'>Hampton-In-Arden</span></st1:place></st1:City><span
style='font-size:9.0pt;font-family:Verdana;mso-bidi-font-weight:bold'> is
situated on the B4102 between </span><st1:place><span style='font-size:9.0pt;
 font-family:Verdana;mso-bidi-font-weight:bold'>Solihull</span></st1:place><span
style='font-size:9.0pt;font-family:Verdana;mso-bidi-font-weight:bold'> and </span>
<st1:City><st1:place><span
  style='font-size:9.0pt;font-family:Verdana;mso-bidi-font-weight:bold'>Meriden</span></st1:place></st1:City><span
style='font-size:9.0pt;font-family:Verdana;mso-bidi-font-weight:bold'>.<span
style='mso-spacerun:yes'>  </span>This is close to the National Exhibition
Centre between </span><st1:City><st1:place><span style='font-size:9.0pt;
  font-family:Verdana;mso-bidi-font-weight:bold'>Birmingham</span></st1:place></st1:City><span
style='font-size:9.0pt;font-family:Verdana;mso-bidi-font-weight:bold'> and </span>
<st1:City><st1:place><span
  style='font-size:9.0pt;font-family:Verdana;mso-bidi-font-weight:bold'>Coventry</span></st1:place></st1:City><span
style='font-size:9.0pt;font-family:Verdana;mso-bidi-font-weight:bold'>.<span
style='mso-spacerun:yes'>  </span>The nearest motorway exit is Junction 5 of
the M42 at Knowle.<span style='mso-spacerun:yes'>  </span>On reaching </span>
<st1:City><st1:place><span
  style='font-size:9.0pt;font-family:Verdana;mso-bidi-font-weight:bold'>Hampton-In-Arden</span></st1:place></st1:City><span
style='font-size:9.0pt;font-family:Verdana;mso-bidi-font-weight:bold'> find the
village green which is situated near to the railway bridge and turn into </span>
<st1:Street><st1:address><span
  style='font-size:9.0pt;font-family:Verdana;mso-bidi-font-weight:bold'>Shadowbrook
  Lane</span></st1:address></st1:Street><span style='font-size:9.0pt;
font-family:Verdana;mso-bidi-font-weight:bold'> by the war memorial.<span style='mso-spacerun:yes'>  </span>The Sports Club entrance is 100
yards on the right.<span style='mso-spacerun:yes'>  </span>If
you need any further detail you can generate a map to suit yourself by going to:<br>
<br>
&nbsp;<a href="http://www.ordnancesurvey.co.uk/oswebsite/getamap/">http://www.ordnancesurvey.co.uk/oswebsite/getamap/</a>
<br>
<br>
Click on the large button to the right to accept the terms and then type in the
postcode B92 0DQ.<o:p></o:p></span></p>

<p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><b><span
style='font-size:9.0pt;font-family:Verdana'><o:p>&nbsp;</o:p>Changing facilities<o:p></o:p></span></b></p>

<p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
style='font-size:9.0pt;font-family:Verdana;mso-bidi-font-weight:bold'>Changing
facilities, including showers, are available at Hampton-In-Arden Sports Club,
located about 100 yards from the start and finish points.<span
style='mso-spacerun:yes'>  </span>However, we suggest that you come fully
changed and aware that demand for changing facilities may exceed the
supply.<span style='mso-spacerun:yes'>  </span>An area will be marked for you
to leave kit if you wish.<span style='mso-spacerun:yes'>  </span>Please remember
that you remain responsible for the security of your belongings as the race
organisers will accept no responsibility for any loss or damage.<o:p></o:p></span></p>

<p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><b><span
style='font-size:9.0pt;font-family:Verdana'><o:p>&nbsp;</o:p>Starting instructions and Course
Information<o:p></o:p></span></b></p>

<p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
style='font-size:9.0pt;font-family:Verdana;mso-bidi-font-weight:bold'>On the
day of the race, please ensure that you are at the start at least 10 minutes
prior to the start, with your race number securely attached to the front of your
running vest so that it is easily visible.<span style='mso-spacerun:yes'> 
</span>At the start of the race
please congregate at the gate leading out of the playing field into </span>
<st1:Street><st1:address><span
  style='font-size:9.0pt;font-family:Verdana;mso-bidi-font-weight:bold'>Shadowbrook
  Lane</span></st1:address></st1:Street><span style='font-size:9.0pt;
font-family:Verdana;mso-bidi-font-weight:bold'>.<span
style='mso-spacerun:yes'>  </span>At the appointed start time </span>
<st1:Street><st1:address><span
  style='font-size:9.0pt;font-family:Verdana;mso-bidi-font-weight:bold'>Shadowbrook
  Lane</span></st1:address></st1:Street><span style='font-size:9.0pt;
font-family:Verdana;mso-bidi-font-weight:bold'> will be shut off to cars until
such time as the runners have spread out sufficiently to allow cars to
pass.<span style='mso-spacerun:yes'>  </span>After that point runners will be
using roads that are open to the public and you are asked to keep to the left
side of the road unless marshals otherwise direct you.<span
style='mso-spacerun:yes'>  </span>Marshals will be stationed at all junctions
and will indicate crossing points.<span style='mso-spacerun:yes'>  </span>YOU
MUST OBEY THEIR INSTRUCTIONS.<o:p></o:p></span></p>

<p class=MsoNormal style='margin-top:6.0pt;text-align:justify'>
<span style="font-family: Verdana; font-size: 9pt">The location of d</span><span
style='font-size:9.0pt;font-family:Verdana;mso-bidi-font-weight:bold'>rinks 
stations will be notified on the day of the race. <o:p></o:p></span></p>

<p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
style='font-size:9.0pt;font-family:Verdana;mso-bidi-font-weight:bold'>Mile
markers will be displayed throughout the course.<o:p></o:p></span></p>

<p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
style='font-size:9.0pt;font-family:Verdana;mso-bidi-font-weight:bold'>Marshals
will be in telephone contact with the race headquarters and cars can be
arranged to pick up runners who are unable to complete the course.<o:p></o:p></span></p>

<p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><b><span
style='font-size:9.0pt;font-family:Verdana'><o:p>&nbsp;</o:p>Medical<o:p></o:p></span></b></p>

<p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
style='font-size:9.0pt;font-family:Verdana;mso-bidi-font-weight:bold'>YOU MUST
ENSURE THAT YOU ARE MEDICALLY FIT TO PARTICIPATE AND THAT YOU ARE ADEQUATELY
COVERED BY YOUR OWN INSURANCE.<span style='mso-spacerun:yes'>  IF YOU HAVE NOT 
TRAINED OR YOU HAVE A HEAVY COLD, PLEASE DO NOT RUN IN THIS EVENT. IF YOU ARE IN ANY DOUBT YOU SHOULD NOT START.<o:p></o:p></span></p>

<p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
style='font-size:9.0pt;font-family:Verdana;mso-bidi-font-weight:bold'>A doctor
will be present at the Sports Club to help anyone suffering from
injury/illness/dehydration.<o:p> Please ensure that you <b>drink sufficient 
water</b> on the morning of the race to avoid suffering from dehydration during 
the race. This is particularly important if the weather conditions are hot.</o:p></span></p>

<p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
style='font-size:9.0pt;font-family:Verdana;mso-bidi-font-weight:bold'>Pre and
post race massage facilities will be available if required.<o:p></o:p></span></p>

<p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><b><span
style='font-size:9.0pt;font-family:Verdana'><o:p>&nbsp;</o:p>Food and drink at the end of the
race<o:p></o:p></span></b></p>

<p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
style='font-size:9.0pt;font-family:Verdana;mso-bidi-font-weight:bold'>Food can
be purchased from the barbecue at the end of the race.<span
style='mso-spacerun:yes'>  </span>The Sports Club bar will serve drinks.<o:p></o:p></span></p>

<p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><b><span
style='font-size:9.0pt;font-family:Verdana'><o:p>&nbsp;</o:p>Results<o:p></o:p></span></b></p>

<p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
style='font-size:9.0pt;font-family:Verdana;mso-bidi-font-weight:bold'>The
results will be posted onto the web site <a href="http://www.arden9.org.uk/">www.arden9.org.uk</a> 
during the week following the race.<span
style='mso-spacerun:yes'>  </span>If you wish to have a results sheet posted to
you please leave your name and address and pay £2 to the registration desk on
the day of the race.<o:p></o:p></span></p>

<p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><b><span
style='font-size:9.0pt;font-family:Verdana'><o:p>&nbsp;</o:p>Prizes<o:p></o:p></span></b></p>

<p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
style='font-size:9.0pt;font-family:Verdana;mso-bidi-font-weight:bold'>Cups will
be awarded to the winners of the following categories:</span></p>
<ul>
	<li>
	<p class=MsoNormal style='margin-top:6.0pt;text-align:justify'>
	<span style="font-family: Verdana; font-size: 9pt">Men</span><span
style='font-size:9.0pt;font-family:Verdana;mso-bidi-font-weight:bold'> 16-39, 
	Men 40-49, Men 50+, Hampton Sports Club Men</span></p></li>
	<li>
	<p class=MsoNormal style='margin-top:6.0pt;text-align:justify'>
	<span style="font-family: Verdana; font-size: 9pt">Women</span><span
style='font-size:9.0pt;font-family:Verdana;mso-bidi-font-weight:bold'> 16-34, 
	Women 35-44, Women 45+, Hampton Sports Club Women</span></p></li>
</ul>
<p class=MsoNormal style='margin-top:6.0pt;text-align:justify'>
<span
style='font-size:9.0pt;font-family:Verdana;mso-bidi-font-weight:bold'>&nbsp;The presentation ceremony will start about </span><st1:time
Minute="0" Hour="12"><span style='font-size:9.0pt;font-family:Verdana;
 mso-bidi-font-weight:bold'>12 noon</span></st1:time><span style='font-size:
9.0pt;font-family:Verdana;mso-bidi-font-weight:bold'>.<o:p></o:p></span></p>

<p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
style='font-size:9.0pt;font-family:Verdana;mso-bidi-font-weight:bold'>Every
runner finishing the race will be given a medal.<o:p> Spot prizes will be 
available.</o:p></span></p>

<p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><b><span
style='font-size:9.0pt;font-family:Verdana'>Participation is at your own risk<o:p></o:p></span></b></p>

<p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
style='font-size:9.0pt;font-family:Verdana;mso-bidi-font-weight:bold'>Remember
that YOUR SAFETY IS YOUR RESPONSIBILITY AND THAT PARTICIPATION IS AT YOUR RISK.<o:p></o:p></span></p>

<p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><b><span
style='font-size:9.0pt;font-family:Verdana'>Comments<o:p></o:p></span></b></p>

<p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
style='font-size:9.0pt;font-family:Verdana;mso-bidi-font-weight:bold'>We have
tried to make this a well organised and enjoyable day but we are always happy
to listen to any of your advice or views.<span style='mso-spacerun:yes'> 
</span>If you would like to make any comment about any aspect of the race then
please send an email to the Chris Barnes at the following email address - <a
href="mailto:secretary@hamptontennis.org.uk">secretary@hamptontennis.org.uk</a>.<span
style='mso-spacerun:yes'>  </span><o:p></o:p></span></p>

<p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><b><span
style='font-size:9.0pt;font-family:Verdana'>Thank you<o:p></o:p></span></b></p>

<p class=MsoNormal style='margin-top:6.0pt;text-align:justify'><span
style='font-size:9.0pt;font-family:Verdana;mso-bidi-font-weight:bold'>Hampton-In-Arden
Sports Club would like to thank you for taking part and all the volunteers who
have helped to organise this race without charge for their time.<span
style='mso-spacerun:yes'>   </span>The profits made from the race will be
donated to the tennis club court refurbishment and development fund. </span></p>


    </td>
  </tr>
</table>
&nbsp;
<br>
<!--#include file="ardennav.asp" -->
</body>
</html>
<%
%>
