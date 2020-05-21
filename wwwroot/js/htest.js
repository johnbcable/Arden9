$(document).ready(function() {
	
/*	The following code works with the original in htest.html

	var jsonstring = new String("");
	var url = "https://hamptontennis.org.uk/juniors/fetchJSON.asp?id=2";
	// var eventsfound = false;
	$.getJSON(url,function(data){

		var jsonstring = JSON.stringify(data);

		jsonstring = new String("{allEvents:"+jsonstring+"}");

		// var eventdata = $.parseJSON(jsonstring);
		var eventdata = eval("(" + jsonstring + ")");

		// Set the boolean if we have data
		// if (eventdata.length > 1)
		//	eventsfound = true;

		//Get the HTML from the template   in the script tag
	    var theTemplateScript = $("#eventlist-template").html(); 

	   //Compile the template
	    var theTemplate = Handlebars.compile (theTemplateScript); 
		// Handlebars.registerPartial("description", $("#shoe-description").html());    
		$("#events").append (theTemplate(eventdata)); 
		// jsonstring = JSON.stringify(data);
		$("#receivedjson").html('JSON received back from fetchJSON.asp?id=2 is <br /><br />'+jsonstring+'<br /><hr />');
	});  // end of function(data)
*/

	var jsonstring = new String("");
	var url = "https://arden9.net/fetchJSON.asp?id=3&p1=2013";
	// var eventsfound = false;
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
		$("#winnerstable").append (theTemplate(winnersdata)); 
		// jsonstring = JSON.stringify(data);
		$("#receivedjson").html('JSON received back from fetchJSON.asp?id=3&amp;p1=2013 is <br /><br />'+jsonstring+'<br /><hr />');
	});  // end of function(data)


})  // end of document.ready

