<%@language="JScript"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("The K&amp;D Arden 9 Road Race 2014: Instructions for Competitors");
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
			<div id="overlayboxquote" class="boxright" style="width: 90%; text-align: center; margin-bottom: 20px;">
				<h2 class="boxheader">Thank you</h2>
				<p>
					Once again, Hampton-In-Arden Sports Club and Knowle &amp; Dorridge Running Club would like to say a big thank you to you for taking part, to our sponsors (Birmingham Runner, Hunters Estate Agents, Xempo Running Clothing and the Beeches Bar &amp; Grill) and to all the volunteers who help to organise and marshal this race without charge for their time. The profits made from the race will be donated to the Hampton-in-Arden Tennis Club tennis club and to Knowle &amp; Dorridge Running Club. <br /><br />
					Want to find out more about our sponsors? Just click on their logo in the left-hand column.
				</p>
				<p>
					For the latest updates, follow us on Twitter and Facebook :-&nbsp;&nbsp;&nbsp;
		 			<a href="http://www.facebook.com/pages/KD-Arden-9-Mile-Road-Race/317896864993980?fref=ts">
						 <img src="http://hamptontennis.org.uk/images/facebook_icon.gif" width="32" title="Arden 9 on FaceBook" />
					</a>
					&nbsp;
		 			<a href="https://twitter.com/@Arden9RoadRace">
						 <img src="http://hamptontennis.org.uk/images/twitter.gif" width="32" title="Arden 9 on Twitter" />
		 			</a>
				</p>
				<p class="boxsignature">The K&amp;D Arden9 race team</p>
			</div>

		<div id="instructions">
			<p class="question">Organiser&#39;s Notes</p>
			<p class="answer">
				This is our 11th year of running this annual event which will once again be organised by Knowle &amp; Dorridge Running Club and hosted by Hampton-in-Arden Tennis Club. As in 2012 and 2013, the race will be part of the Warwickshire Road Race League  (WRRL - <a href="http://www.warwickshirecountyaa.co.uk">www.warwickshirecountyaa.co.uk</a>).
			</p>
			<p class="question">Acceptance</p>
			<p class="answer">
				Acceptance of your race entry will be confirmed by email from Runners World. You must then collect your race number from the race reception on the day of the race; please allow sufficient time to do this and to fix it safely to your race vest. We hope that you will have a great day out and will achieve your personal goals. Please note
				that we expect you to enter the race only if you can complete the nine-mile course within two hours (average pace per mile of 13 minutes) and that you should not enter the race if you intend to walk.
			</p>
			<p class="question">Road race permit code 2014-11137</p>
			<p class="answer">
				The race is intended for both regular runners and novices and has been approved by the Midland Counties Athletic Association as a race that will be held under the current laws of competition of the Amateur Athletic Association of England and in accordance with the bye-laws of the Midland Counties Athletic 
				Association.
			</p>
			<p class="question">UK Athletics Course Measurement Scheme Code [to be confirmed when re-measured]</p>
			<p class="answer">
				The course has been measured as nine miles by the UK Athletics Course Measurement Scheme using a calibrated cycle (or Jones Counter) in the hands of a fully trained and accredited course measurer.
			</p>			
			<p class="question">Directions to Hampton-In-Arden</p>
			<p class="answer">
				Hampton-in-Arden is situated on the B4102 between Solihull and Meriden close to the 
				National Exhibition Centre between Birmingham and Coventry.  The nearest motorway exit is Junction 5 of the M42 at Knowle.  On reaching Hampton-in-Arden find the village green situated near to the railway station and turn into Shadowbrook Lane by the war memorial.  The Sports Club entrance is 100 yards on the right.  If you need any further detail you can generate a map to suit yourself by using an on-line mapping web site or a satnav device using the postcode B92 0DQ.
			</p>	
			<p class="question">Venue facilities</p>
			<p class="answer">
				Parking and changing facilities, including showers and toilets, are available at Hampton-in-Arden Sports Club, located close to the start and finish points.  However, we suggest that you come fully changed and aware that demand for changing facilities may exceed the supply.  A supervised area will be marked for you to leave kit in the clubhouse if you wish. Please remember that you remain responsible for the security of your belongings as the race organisers accept no responsibility for any loss or damage whether this occurs in the supervised area or not.
			</p>			
			<p class="question">Starting instructions</p>
			<div class="answer">
				<p>
				On the day of the race, please ensure that you are at the start at least 10 minutes prior to the start, with your race number securely attached to the front of your running vest so that it is easily visible.  
				</p>
			</div>			
			<p class="question">Safety Instructions</p>
			<div class="answer">
				<p>
				Safety is your responsibility so please be <strong>VERY</strong> careful crossing <strong>ALL roads</strong>. Marshals will be stationed at all junctions and will indicate crossing points. <strong>YOU MUST OBEY THEIR INSTRUCTIONS</strong>. 
				For the first two miles to Catherine-de-Barnes the roads will be closed for the race, but this does <strong>NOT MEAN THERE WILL BE NO CARS AT ALL</strong>, so please be very careful.  You should use the cycle path on the <strong>RIGHT</strong> side of Catherine-de-Barnes Lane between the one and two mile markers even though the road is closed.  Otherwise, you will be using public roads so please respect the Highway Code and keep to the <strong>LEFT</strong> side of the road even if the racing line is to the right.<br />
				<span style="text-decoration:underline; font-weight:bold;">If you listen to an iPod or other portable music player when running you may not be able to hear traffic noise or instructions from the marshals so please DO NOT USE these devices UNDER ANY CIRCUMSTANCES whilst you are taking part in the race.</SPAN> 
				</p>
			</div>			
			<p class="question">Administration</p>
			<div class="answer">
				<p>
				You are expected to finish the 9 miles in less than two hours, so please run.  It is not a walk, so if you are slower than this please get into the trail car. The race marshals will only remain at their marshaling posts to guide runners who run the course in under two hours.  
				</p>
			</div>			
			<p class="question">Course Information</p>
			<div class="answer">
				<p>
				The course is on public roads for all but about half a mile on a public footpath around the lake between the 7 and 8 mile markers.  Mile markers will be displayed throughout the course.  There are 4 water stations at Catherine-de-Barnes (2 miles), Barston (5 miles), at the far end of Hampton Lakes (8 miles) and at the finish (9 miles).
				</p>
			</div>			
			<p class="question">Medical</p>
			<div class="answer">
				<p>
				YOU MUST ENSURE THAT YOU ARE MEDICALLY FIT TO PARTICIPATE AND THAT YOU ARE ADEQUATELY COVERED BY YOUR OWN INSURANCE.  IF YOU HAVE NOT TRAINED OR YOU HAVE A HEAVY COLD OR IF YOU ARE IN ANY DOUBT YOU SHOULD NOT START.
				</p>
				<p>
				Medical help facilities will be available at the start and finish of the race to help anyone suffering from injury, illness or dehydration. If you are injured during the race, please stay with a marshal if possible so that we can arrange for you to be picked up by the trail car at the back of the race.
				</p>
				<p>
				<span style="text-decoration:underline;">Drinks</span>: There are 4 water stations. Please make <strong>CERTAIN</strong> that you <b><u>drink sufficient water</u></b> 
				on the morning of the race and also during the race to avoid suffering from dehydration during the race. This is particularly important if the weather conditions are hot.
				</p>
				<p>
				<span style="text-decoration:underline;">Asthma sufferers</span>: If you have asthma please carry a ventilator with you.
				</p>
			</div>	
			<p class="question">Participation is at your own risk</p>
			<p class="answer">
				Remember that YOUR SAFETY IS YOUR RESPONSIBILITY AND THAT PARTICIPATION IS AT YOUR OWN RISK.
			</p>			 
			<p class="question">Food and drink at the end of the race</p>
			<p class="answer">
				Food can be purchased from the barbecue at the end of the race and the Sports Club bar will be open to serve teas, coffees and bar drinks.
			</p>			 
			<p class="question">Results and Photographs</p>
			<p class="answer">
				The results and photographs (where available) will be posted onto this web site (www.arden9.org.uk) on the day of the race and photographs by the Wednesday following the race.
			</p>			 
			<p class="question">Prizes</p>
			<div class="answer">
				<p>Prizes will be awarded to the winners of the following categories :</p>
				<ul type="disc">
					<li>Mens Open</li>
					<li>Mens Masters</li>
					<ul>
						<li>Men 35-44</li>
						<li>Men 45-54</li>
						<li>Men 55+</li>
					</ul>
					<li>Mens Team Trophy (for pre-registered teams of 4)</li>
					<li>Ladies Open (first 3)</li>
					<li>Ladies Masters</li>
					<ul>
						<li>Women 35-44</li>
						<li>Women 45-54</li>
						<li>Women 55+</li>
					</ul>
					<li>Womens Team Trophy (for pre-registered teams of 3)</li>
				</ul>
				<p>The presentation ceremony will start about 12 noon.</p>
				<p>
					Every runner finishing the race will be given a commemorative momento. 
				</p>
				<p>
					There are a number of other prizes which will be distributed between our winners and given as spot prizes. These include:-
				</p>
				<ul type="disc">
					<li>Birmingham Runner Vouchers</li>
<!--
					<li>Xempo Technical T-Shirts</li>
					<li>Sunday Dinner for 4 at The beeches Bar &amp; Grill, Marsh Lane, Hampton-in-Arden
-->
				</ul>
				<p>
					Other prizes to be confirmed in due course.
				</p>
				<p>
					Details of how these will be distributed will be made available in due course via the race 
					<a href="https://twitter.com/@Arden9RoadRace">Twitter</a> and 
					<a href="http://www.facebook.com/pages/KD-Arden-9-Mile-Road-Race/317896864993980?fref=ts">Facebook</a> 
					pages (and possibly here on the website)
				</p>
			</div>			 
			<p class="question">Participation is at your own risk</p>
			<p class="answer">
				Remember that YOUR SAFETY IS YOUR RESPONSIBILITY AND THAT PARTICIPATION IS AT YOUR RISK.
			</p>			 
			<p class="question">Comments</p>
			<p class="answer" style="border-bottom: none;">
				We try to make this a well organised and enjoyable day but we are always happy to listen to any of your advice or views. If you would like to make any comment about any aspect of the race then please send an email to the Race Director, Tim Price of Knowle &amp; Dorridge Running Club at <a href="mailto:arden9race@gmail.com">arden9race@gmail.com</a> or phone 07855 288717
				<br /><br />
				The K&amp;D Arden 9-Mile Road Race is organised by Knowle &amp; Dorridge Running Club and hosted by Hampton-in-Arden Tennis Club. The race is part of the Warwickshire Road Race League.
			</p>			 
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
