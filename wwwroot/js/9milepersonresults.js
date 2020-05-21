//
//  Variables
//
var jsonstring = new String("");
var baseurl = new String("https://arden9.net/fetchJSON.asp");

var cursurname;   // current value for category

// Now create the URL's for the race details, the winners and then the runners
var runnersurl;	// holds string for URL for race runners query

//
// Define utility functions first
//
function paramSetup() {

	var id = 7;
	cursurname = $('#surname').val();   // current value for category

	// Now create the URL for the runners query
	// Decide which query to use for the runners list
		
	runnersurl = new String(baseurl + "?id=4&p1="+encodeURIComponent(cursurname));
/*	
	alert('At end of paramSetup, raceurl is now ['+raceurl+']');
	alert('At end of paramSetup, winnersurl is now ['+winnersurl+']');
	alert('At end of paramSetup, runnersurl is now ['+runnersurl+']');
*/
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
	
	$('#surname').focus();   // focus on the surname field

	paramSetup();		// Setup parameters on first entry so can display default results

	getRunners(runnersurl);  // get runners list on  initial load

	// Refresh all results if the Fetch button is pressed
	$('#mysubmit').click( function (event) {

		//  Prevent the default form submission
		event.preventDefault();

		// Now pick up values from displayed form
		paramSetup();

		// Now action these JSON retrievals in turn.
		// race details first

/*	alert('At end of paramSetup, runnersurl is now ['+runnersurl+']');
	alert('At end of paramSetup, curcategory is now ['+curcategory+']');
*/
		// Now get the runners results and populate the runners table
		getRunners(runnersurl);

	});    // end of mysubmit.click


})  // end of document.ready

