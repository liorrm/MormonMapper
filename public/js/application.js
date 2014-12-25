///////////////////////////////////////////////////////////
// geojson variable now populated and available for use ///
//////////////////////////////////////////////////////////

var listings = document.getElementById('listings');

//////////////////////
/// HELPER METHODS ///
//////////////////////

function setActive(el) {
  var siblings = listings.getElementsByTagName('div');
  for (var i = 0; i < siblings.length; i++) {
    siblings[i].className = siblings[i].className
    .replace(/active/, '').replace(/\s\s*$/, '');
  }

  el.className += ' active';
  $('.listings').scrollTo('.active')
}

var setupMarkersInfo = function(temple) {
  // Shorten temple.feature.properties to just `prop` so we're not
  // writing this long form over and over again.
  var prop = temple.feature.properties;

  // Each marker on the map.
  var popup = '<h3>' + prop.name + '</h3><div>';

  var listing = listings.appendChild(document.createElement('div'));
  listing.className = 'item';

  var link = listing.appendChild(document.createElement('a'));
  link.href = listing.link;
  link.className = 'title';

  link.innerHTML = prop.name;
  link.innerHTML += '<br /><small class="quiet">' + prop.address + '</small>'
  // if (prop.crossStreet) {
  //   link.innerHTML += '<br /><small class="quiet">' + prop.crossStreet + '</small>';
  //   popup += '<br /><small class="quiet">' + prop.crossStreet + '</small>';
  // }

  var details = listing.appendChild(document.createElement('div'));
  details.innerHTML = prop.snippet;
  // if (prop.phone) {
  //   details.innerHTML += ' &middot; ' + prop.phoneFormatted;
  // }

  link.onclick = function() {
    setActive(listing);

    // When a menu item is clicked, animate the map to center
    // its associated temple and open its popup.
    // map.setView(temple.getLatLng(), 16);
    temple.openPopup();
    return false;
  };

  // Marker interaction
  temple.on('click', function(e) {
    // 1. center the map on the selected marker.
    map.setView(temple.getLatLng(), zoomLevel, {
      pan: { animate: true },
      // zoom: { animate: true }
    });

    // 2. Set active the markers associated listing.
    setActive(listing);
  });

  popup += '</div>';
  temple.bindPopup(popup);
  temple.setIcon(L.icon({
  iconUrl: '../Angel-Moroni.png',
  iconSize: [35, 35],
  iconAnchor: [17, 31],
  popupAnchor: [0, -34]
}));
}

//////////////////////
/// INITIALIZE MAP ///
//////////////////////

L.mapbox.accessToken = 'pk.eyJ1IjoibGlvcnJtIiwiYSI6InkzM2lOT2sifQ.rKc_Jo2tLLU7vy23ltzAuA';

var southWest = L.latLng(-90, -220),
    northEast = L.latLng(90, 220),
    bounds = L.latLngBounds(southWest, northEast);

var map = L.mapbox.map('map', 'liorrm.khomnofd', {  maxBounds: bounds,
    maxZoom: 19,
    minZoom: 2
});

map.setView

var zoomLevel = map.zoom

// zoom the map to that bounding box
map.fitBounds(bounds);

var locations = L.mapbox.featureLayer().addTo(map);

    locations.setGeoJSON(geojson);
    locations.eachLayer(setupMarkersInfo);
