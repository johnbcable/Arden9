//
//  Variables
//
var jsonstring = new String("");
var baseurl = new String("https://www.arden9.net/fetchJSON.asp");

var categories = new Array();	//	list of year, caetgory objects
var filteredCategories = new Array();  // list use for filling in drop down list
var curyear;   	// get the current value from the year (text)
var curcategory;   // current value for category
var intYear = 0;
var categorydata;

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
	raceurl = new String(baseurl + "?id=2&p1="+encodeURIComponent(curyear));
	winnersurl = new String(baseurl + "?id=3&p1="+encodeURIComponent(curyear));
	runnersurl;

	// Decide which query to use for the runners list
	if (curcategory == 'All') {
		runnersurl = new String(baseurl + "?id=6&p1="+encodeURIComponent(curyear));
	} else {
		runnersurl = new String(baseurl + "?id=1&p1="+encodeURIComponent(curyear));
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

//
// getCategoryList 
// 
function getCategoryList(url) {

/*
	alert("Inside getWinners using URL "+url);
*/

	var categoryURL = new String("https://arden9.net/fetchJSON.asp?id=13");

	$.getJSON(categoryURL,function(data){

		var jsonstring = JSON.stringify(data);

		// jsonstring = new String("{allCategories:"+jsonstring+"}");

		// var eventdata = $.parseJSON(jsonstring);
		categories = eval("(" + jsonstring + ")");

		// $.each(categorydata, function () {
		// 	categories.push(this);
		// });

		// Set the boolean if we have data
		// if (eventdata.length > 1)
		//	eventsfound = true;

	});  // end of function(data)

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
	
	var jsonstring;

	getCategoryList();	// Pull in all the categories agains the year they were used
	
	// Restrict filtered categories to those used in intYear
	intYear = 2019;
	filteredCategories = categories.filter((obj) => obj.RaceYear === intYear);
	
	jsonstring = JSON.stringify(filteredCategories);

	jsonstring = new String("{categorylist:"+jsonstring+"}");

	// var eventdata = $.parseJSON(jsonstring);
	categorydata = eval("(" + jsonstring + ")");

	paramSetup();		// Setup parameters on first entry so can display default results

	getWinners(winnersurl);  // Get winners on initial load

	getRunners(runnersurl);  // get runners list on  initial load

	// Refresh categories list if user changes year
	$('#year').change( function (event) {
		curyear = $('#year').val();
//		alert('Year changed to '+ curyear);   // get the current value from the year
		intYear = new Number(curyear).valueOf();
//		alert('Type of intYear is ' + typeof intYear);   // get the current value from the year
		// Update filtered categories so they only contain categories used in #year
		filteredCategories = categories.filter((obj) => obj.RaceYear === intYear);

		jsonstring = JSON.stringify(filteredCategories);

		jsonstring = new String("{categorylist:"+jsonstring+"}");

		// var eventdata = $.parseJSON(jsonstring);
		categorydata = eval("(" + jsonstring + ")");

		//Get the HTML from the category list template
	    var theTemplateScript = $("#categorylist-template").html(); 

	   //Compile the template
	    var theTemplate = Handlebars.compile (theTemplateScript); 
		// Handlebars.registerPartial("description", $("#shoe-description").html()); 
		$("#categorylist").empty();   
		$("#categorylist").append(theTemplate(categorydata)); 

	} );

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

