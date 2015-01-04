/// Map-related attributes and behaviors
var MormonMap = function() {
  this.map = L.mapbox.map('map', 'liorrm.khomnofd', {         zoomControl: false,
             maxBounds: bounds,
             maxZoom: 19,
             minZoom: 2,
             worldCopyJump: true
           });
  this.accessToken = L.mapbox.accessToken
  this.zoomLevel   = this.map.zoom;
  this.layer       = L.mapbox.featureLayer();
  this.southWest   = L.latLng(-90, -420);
  this.northEast   = L.latLng(90, 235);
  this.bounds      = L.latLngBounds(southWest, northEast);
}

MormonMap.prototype = {
  setView: function() {
    this.map.setView
  },

  fitBounds: function(bounds) { //pass in this.bounds
    this.map.fitBounds(bounds)
  },

  addLayerContent: function(templeGeoJson) {
    // pass in geojson created in other file
    this.locations.setGeoJSON(templeGeoJson);
  }
}


// Sidebar-related attributes and behaviors
var SideBar = function(){
  this.listings = document.getElementById('listings');
}

SideBar.prototype = {

}