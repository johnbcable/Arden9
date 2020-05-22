//
//  Variables
//
var jsonstring = new String("");
var baseurl = new String("https://www.arden9.net/fetchJSON.asp");

var curyear;   	// get the current value from the year
var curcategory;   // current value for category

// Now create the URL's for the race details, the winners and then the runners
var raceurl;		// holds string for URL for race details query
var winnersurl;	// holds string for URL for race winners query
var runnersurl;	// holds string for URL for race runners query

//
// Define utility functions first
//
function paramSetup() {

	curyear = $('#year').val();   // get the current value from the year
	curcategory = $('#category').val();   // current value for category

	// Now craete the URL's for the race details, the winners and then the runners
	winnersurl = new String(baseurl + "?id=3&p1="+encodeURIComponent(curyear));
	runnersurl;

	// Decide which query to use for the runners list
	if (curcategory == 'All') {
		runnersurl = new String(baseurl + "?id=10&p1="+encodeURIComponent(curyear));
	} else {
		runnersurl = new String(baseurl + "?id=11&p1="+encodeURIComponent(curyear));
		// Now modify curcategory to work with SQL 
		if (curcategory == 'Females') {
			curcategory = 'F%';
		}
		if (curcategory == 'Males') {
			curcategory = 'M%';
		}
		runnersurl += "&p2="+encodeURIComponent(curcategory);
	}

/*	
	alert('At end of paramSetup, raceurl is now ['+raceurl+']');
	alert('At end of paramSetup, winnersurl is now ['+winnersurl+']');
	alert('At end of paramSetup, runnersurl is now ['+runnersurl+']');
*/
}

// Function to get the winners details for the currently chosen year
// 
function getWinners(url) {

/*
	alert("Inside getWinners using URL "+url);
*/
	$.getJSON(url,function(data){

		var jsonstring = JSON.stringify(data);

		jsonstring = new String("{allWinners:"+jsonstring+"}");

		// var eventdata = $.parseJSON(jsonstring);
		var winnersdata = eval("(" + jsonstring + ")");

		// Set the boolean if we have data
		// if (eventdata.length > 1)
		//	eventsfound = true;

		//Get the HTML from the template   in the script tag
	    var theTemplateScript = $("#winners-template").html(); 

	   //Compile the template
	    var theTemplate = Handlebars.compile (theTemplateScript); 
		// Handlebars.registerPartial("description", $("#shoe-description").html()); 
		$("#winnerstable").empty();   
		$("#winnerstable").append(theTemplate(winnersdata)); 
		// jsonstring = JSON.stringify(data);
		// $("#receivedjson").html('JSON received back from '+url+' is <br /><br />'+jsonstring+'<br /><hr />');
	});  // end of function(data)

}

//
//  Now get the full runners list for this year and any category filter

function getRunners(url) {

/*
	alert("Inside getWinners using URL "+url);
*/
	$.getJSON(url,function(data){

		var jsonstring = JSON.stringify(data);

		jsonstring = new String("{allRunners:"+jsonstring+"}");

		// var eventdata = $.parseJSON(jsonstring);
		var runnersdata = eval("(" + jsonstring + ")");

		// Set the boolean if we have data
		// if (eventdata.length > 1)
		//	eventsfound = true;

		//Get the HTML from the template   in the script tag
	    var theTemplateScript = $("#runners-template").html(); 

	   //Compile the template
	    var theTemplate = Handlebars.compile (theTemplateScript); 
		// Handlebars.registerPartial("description", $("#shoe-description").html());    
		$("#runnerstable").empty();   
		$("#runnerstable").append(theTemplate(runnersdata)); 
		// jsonstring = JSON.stringify(data);
		// $("#runnerjson").html('JSON received back from '+url+' is <br /><br />'+jsonstring+'<br /><hr />');
	});  // end of function(data)

}

// Now do the document.ready stuff

$(document).ready(function() {
	
	paramSetup();		// Setup parameters on first entry so can display default results

	getWinners(winnersurl);  // Get winners on initial load

	getRunners(runnersurl);  // get runners list on  initial load

	// Refresh all results if the Fetch button is pressed
	$('#mysubmit').click( function (event) {

		//  Prevent the default form submission
		event.preventDefault();

		// Now pick up values from displayed form
		paramSetup();

		// Now action these JSON retrievals in turn.
		// race details first

/*	alert('At end of paramSetup, raceurl is now ['+raceurl+']');
	alert('At end of paramSetup, winnersurl is now ['+winnersurl+']');
	alert('At end of paramSetup, runnersurl is now ['+runnersurl+']');
*/

		// Now get the winners results and populate the winners table
		getWinners(winnersurl);

		// Now get the runners results and populate the runners table
		getRunners(runnersurl);

	});    // end of mysubmit.click


})  // end of document.ready

