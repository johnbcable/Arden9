<%@language="JScript"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("The Arden 9: Results Section - Photos");
// Now for any variables local to this page
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<head>
<title>K&amp;D ASICS Arden 9 Road Race - Photos</title>
<meta http-equiv="Content-type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="Content-Language" content="en-us" />
	<link rel=STYLESHEET type="text/css" href="arden9.css">
	<script type="text/javascript" src="minmax.js"></script>
</head>
<body>
<!--#include file="pagehead.asp" -->
	<div id="content">
		<h2>
			Photo galleries
		</h2>
		<p>
			The K&amp;D Arden 9-Mile Road Race has been running once a year since 2004 .... and more people are now making 
			their visual records of this day available for us to see, in addition to the few photos we ourselves take.
		</p>
			<p>
				The following links have set up photo and video galleries of material from various races. As always, Hampton in Arden Sports Club cannot be held liable for any content displayed on these sites nor indeed if their link changes. Most recent races first.
			</p>
		<div id="gallerylist" class="bordertop">
		<h3>2014</h3>
		<ol>
			<li>Photos from the 2014 race will be accessible from here after the race</li>
		</ol>
		<h3>2013</h3>
		<ol>
<!--
			<li>
				<p>
					We've taken quite a few photos on the day and we're sorting them out. They should be available
					here shortly.<br /><br />
				</p>
			</li>
-->			
			<li>
				<a href="http://www.flickr.com/photos/bluelou/sets/72157634279754469/">Louis Satterthwaite's photos</a><br /><br />
				<p>
					Here you can see a comprehensive set of photos once again kindly taken and set up by Louis Satterthwaite <br /><br />
				</p>
			</li>
			<li>
				<a href="http://www.youtube.com/watch?v=b75Xfd04zL8&feature=youtu.be">Louis Satterthwaite's slideshow</a><br /><br />
				<p>
					Here you can see Louis' photos represented as a slideshow <br /><br />
				</p>
			</li>
		</ol>
		<h3>2012</h3>
		<ol>
<!--
			<li>
				<p>
					We've taken quite a few photos on the day and we're sorting them out. They should be available
					here shortly.<br /><br />
				</p>
			</li>
-->			
			<li>
				<a href="https://plus.google.com/photos/115820135440202230482/albums/5757552136409601137?banner=pwa">Louis Satterthwaite's photos - part 1</a><br /><br />
				<p>
					Here you can see the first set of photos kindly taken and set up by Louis Satterthwaite <br /><br />
				</p>
			</li>
			<li>
				<a href="https://plus.google.com/photos/115820135440202230482/albums/5757559926156272513?banner=pwa">Louis Satterthwaite's photos - part 2</a><br /><br />
				<p>
					Here are the second set of photos kindly taken and set up by Louis Satterthwaite <br /><br />
				</p>
			</li>
			<li>
				<a href="https://plus.google.com/photos/115820135440202230482/albums/5757564065570587105?banner=pwa">Louis Satterthwaite's photos - part 3</a><br /><br />
				<p>
					... and here are the final (third) set of photos kindly taken and set up by Louis Satterthwaite <br /><br />
				</p>
			</li>
			<li>
				<a href="http://www.youtube.com/watch?v=1QbNKw54e8U&list=UUD5CSD6GqL3Ls7Z14j4mEIA&index=1&feature=plcp">Paul Cornock's videos - part 1 of 2</a><br /><br />
				<p>
					The first instalment of video footage of the preparation and first part of the race (up to approx. 11:45am)<br /><br />
				</p>
			</li>
			<li>
				<a href="http://www.youtube.com/watch?v=JHnkf286cec&feature=autoplay&list=UUD5CSD6GqL3Ls7Z14j4mEIA&playnext=1">Paul Cornock's videos - part 2 of 2</a><br /><br />
				<p>
					The final (second) instalment of video footage of the latter parts of the race (from approx. 11:45am onwards)<br /><br />
				</p>
			</li>
		</ol>
		<h3>2011</h3>
		<ol>
			<li>
				<a href="https://picasaweb.google.com/kevbaldry/Arden92011">Kevin Baldry's photos</a><br /><br />
				<p>
					Here you can view a large gallery of photos from Kevin taken on the day.<br /><br />
				</p>
			</li>
		</ol>
		<h3>2010</h3>
		<ol>
			<li>
				<a href="http://hamptontennis.org.uk/thumbnails.asp?gallery=7">Some of our own photos from the day</a><br /><br />
				<p>
					Here you can see some photos taken by club members on the day.<br /><br />
				</p>
			</li>
			<li>
				<a href="http://www.flickr.com/photos/bluelou/sets/72157624190929321/">Louis Satterthwaite's photos - part 1</a><br /><br />
				<p>
					Here you can see the first set of photos kindly taken and set up by Louis Satterthwaite <br /><br />
				</p>
			</li>
			<li><a href="http://www.flickr.com/photos/bluelou/sets/72157624191519891/">Louis Satterthwaite's photos - part 1</a><br /><br />
				<p>
					Here you can see the second set of photos kindly taken and set up by Louis Satterthwaite.<br /><br />
				</p>
			</li>
		</ol>
		<h3>2009</h3>
		<ol>
			<li>
				<a href="http://picasaweb.google.co.uk/bolivianex/Arden9?feat=email#slideshow/5347259822343958978">External slideshow</a><br /><br />
				<p>
					Here you can see a slideshow of stills from various ponts in the race kindly taken and set up by Lou Satt <br /><br />
				</p>
			</li>
			<li><a href="http://www.youtube.com/watch?v=iHtLaViUdQ4">External You-Tube video footage</a><br /><br />
				<p>
					Here you can see a You-Tube video from the race kindly taken and set up by Lou Satt (to a Chuck Berry soundtrack?!).<br /><br />
				</p>
			</li>
		</ol>
		<h3>2007</h3>
		<ol>
			<li>
				<a href="http://www.flickr.com/photos/baldeagle/sets/72157600380882226/">Some of our own photos from the day</a><br /><br />
				<p>
					Here you can see some photos taken by club members on the day.<br /><br />
				</p>
			</li>
		</ol>
		</div>
		<!--#include file="sponsors.asp" -->
	</div>   <!--   content   -->
<br />
<!--#include file="ardennav.asp" -->
</body>
</html>
<%
%>
