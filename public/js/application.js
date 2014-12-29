///////////////////////////////////////////////////////////
// geojson variable now populated and available for use ///
//////////////////////////////////////////////////////////

var listings = document.getElementById('listings');

//////////////////////
/// HELPER METHODS ///
//////////////////////

function setActive(element) {
  var siblings = listings.getElementsByTagName('div');
  for (var i = 0; i < siblings.length; i++) {
    siblings[i].className = siblings[i].className
    .replace(/active/, '').replace(/\s\s*$/, '');
  }

  element.className += ' active';
  $('.listings').scrollTo('.active')
}

var setupMarkersInfo = function(temple) {
  // Shorten temple.feature.properties to just `prop` so we're not
  // writing this long form over and over again.
  var prop = temple.feature.properties;

  // Each marker on the map.
  var popup = '<h3>' + prop.name + '</h3><div>';
  var popup = popup + '<p id="holy"> <span class="caps">H</span>OLINESS TO THE <span class="caps">L</span>ORD <br> <span class="caps">T</span>HE <span class="caps">H</span>OUSE OF THE <span class="caps">L</span>ORD</p>'
  var popup = popup + '<h4>' + prop.snippet + '</h4>';

  var listing = listings.appendChild(document.createElement('div'));
  listing.className = 'item';

  var link = listing.appendChild(document.createElement('a'));
  link.href = listing.link;
  link.className = 'title';

  link.innerHTML = prop.name;
  link.innerHTML += '<br /><small class="quiet">' + prop.address + '</small>'

  var details = listing.appendChild(document.createElement('div'));
  tableData = "<span class='temple-order'>" + prop.snippet + "</span>"
  tableData += "<table>"
  if (prop.announcement) {           /// moment("2000-04-02").format("LL")
    tableData += "<tr><td>Announcement:</td><td>" + moment(prop.announcement).format("LL") + "</td></tr>"
  }
  if (prop.groundbreaking) {
    tableData += "<tr><td>Groundbreaking:</td><td>" + moment(prop.groundbreaking).format("LL") + "&nbsp;&nbsp;by&nbsp;&nbsp;" + prop.site_dedicator + "</td></tr>"
  }
  if (prop.dedication) {
    tableData += "<tr><td>Dedication:</td><td>" + moment(prop.dedication).format("LL") + "&nbsp;&nbsp;by&nbsp;&nbsp;" + prop.dedicator + "</td></tr>"
  }
  if (prop.exterior_finish) {
    tableData += "<tr><td>Exterior Finish:</td><td>" + prop.exterior_finish + "</td></tr>"
  }
  if (prop.site) {
    tableData += "<tr><td>Site:</td><td>" + prop.site + "</td></tr>"
  }
  if (prop.total_floor_area) {
    tableData += "<tr><td>Total Floor Area:</td><td>" + prop.total_floor_area + "</td></tr>"
  }
  tableData += "</table>"

  details.innerHTML = tableData

  listing.onclick = function() {
    if (listing.className.indexOf("active") != -1) {
      $('.active').removeClass("active");
      temple.closePopup();
    }
    else {
      setActive(listing);

      // When a menu item is clicked, animate the map to center
      // its associated temple and open its popup.
      map.setView(temple.getLatLng(), zoomLevel, { pan: { animate: true, duration: 1.5}});
      temple.openPopup();
    }
    return false;
  };

  // Marker interaction
  temple.on('click', function(e) {
    // 1. center the map on the selected marker.
    map.setView(temple.getLatLng(), zoomLevel, {
      pan: { animate: true, duration: 2.5 }
    // map.panTo(temple.getLatLng())
    });

    // 2. Set active the markers associated listing.
    setActive(listing);
  });

  popup += '</div>';
  temple.bindPopup(popup);

  if (popup.indexOf("operating temple") != -1) {
    temple.setIcon(L.icon({
      iconUrl: '../Angel-Moroni.png',
      iconSize: [35, 35],
      iconAnchor: [17, 31],
      popupAnchor: [0, -34]
    }));
  } else {
    temple.setIcon(L.icon({
      iconUrl: '../moroni-purple.png',
      iconSize: [35, 30],
      iconAnchor: [17, 31],
      popupAnchor: [0, -34]
    }));
  }
}

//////////////////////
/// INITIALIZE MAP ///
//////////////////////

L.mapbox.accessToken = 'pk.eyJ1IjoibGlvcnJtIiwiYSI6InkzM2lOT2sifQ.rKc_Jo2tLLU7vy23ltzAuA';

var southWest = L.latLng(-90, -420),
    northEast = L.latLng(90, 235),
    bounds = L.latLngBounds(southWest, northEast);

var map = L.mapbox.map('map', 'liorrm.khomnofd', { zoomControl: false,
  maxBounds: bounds,
  maxZoom: 19,
  minZoom: 2,
  worldCopyJump: true
});

map.setView

var zoomLevel = map.zoom

// zoom the map to that bounding box
map.fitBounds(bounds);

new L.Control.Zoom({ position: 'topright' }).addTo(map);


var locations = L.mapbox.featureLayer().addTo(map);

    locations.setGeoJSON(geojson);
    locations.eachLayer(setupMarkersInfo);


$('#search').on('keyup', function() {
  searchTemples($(this).val());
});

