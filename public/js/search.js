var hiddenMarkers = []

var searchTemples = function(inputVal) {
  var allTemples = $('.item')
  var safeOffset = 50 // MAGIC NUMBER BUGBUG //

  for (var i = 0; i<allTemples.length; i++) { // if the input text does not match the div text
    if ($(allTemples[i]).text().toLowerCase().indexOf(inputVal.toLowerCase()) == -1) {
      $(allTemples[i]).hide(); // hide the div

      for (var v=0; v < allTemples.length + safeOffset; v++) { // then iterate through the markers
      // then iterate through the markers
        if (locations["_layers"][v] && locations["_layers"][v]["_popup"]["_content"].indexOf(allTemples[i].firstChild.innerHTML) != -1 ) { // if the marker text matches the div text

          hiddenMarkers.push(locations["_layers"][v]) // mark that marker as hidden
          locations.removeLayer(locations["_layers"][v]) // hide the marker
        }
      }
    }
    else { // else if the input text DOES match the div text
      $(allTemples[i]).show(); // show the div
      for (var x=0; x<hiddenMarkers.length; x++) { // then iterate through the hidden markers

        if (hiddenMarkers[x]["_popup"]["_content"].indexOf(allTemples[i].firstChild.innerHTML) != -1) { // if the marker text matches the div text
            locations.addLayer(hiddenMarkers[x]) // show the marker
            hiddenMarkers.splice(x, 1) // mark that marker as shown
        }
      }
    }
  }
}
