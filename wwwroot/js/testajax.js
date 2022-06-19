

function checkUPRN() {
    var actualuprn = $.("#uprntocheck").val().toString();
    var baseURL =
      "https://api.os.uk/search/places/v1/uprn?uprn={{UPRN}}&output_srs=EPSG:4326&key=F8d6br94wigXsBf5bqEEZQCGcA6BkpSd".toString();
    var actualURL = baseURL.replace("{{UPRN}}", actualuprn);
     
    var settings = {
      url: actualURL,
      method: "GET",
      timeout: 0,
    };
     
    $.get(settings).done(function (response) {
      console.log(response);
      $("#ajaxtestresults").val(JSON.stringify(response));
    
}
 