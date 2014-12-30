
var loadFlickrPhotos = function(templeItem) {
  var templeName = templeItem.firstChild.innerHTML.split(" ")

  for (var i=0; i<templeName.length; i++){
    templeName[i] += "+"
  }

  var searchTerm = templeName.join("") + "LDS"

  var apiKey = "ae27bc9d3af17e89122b67b7aa6a86cb"

  var searchURL = 'https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=' + apiKey + '&text=' + searchTerm + '&format=json&nojsoncallback=1'

  $.ajax({
    type: "GET",
    url: searchURL,
    dataType: "json",
    success: function(serverResponse){
      $(templeItem).append('<div class="photos">')

      $.each(serverResponse.photos.photo, function(i, item) {

        var photoURL = 'https://farm' + item.farm + '.staticflickr.com/' + item.server + '/' + item.id + '_' + item.secret + '_z.jpg'

        $(templeItem).append('<img src="' + photoURL + '"/>')
      })
      $(templeItem).append('</div>')
    }
  })
}