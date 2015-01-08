
var loadFlickrPhotos = function(templeItem) {
  var templeName = templeItem.firstChild.innerHTML.split(" ")

  for (var i=0; i<templeName.length; i++){
    templeName[i] += "+"
  }

  var searchTerm = templeName.join("") + "LDS"

  var apiKey = "ae27bc9d3af17e89122b67b7aa6a86cb"

  var searchURL = 'https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=' + apiKey + '&text=' + searchTerm + '&format=json&nojsoncallback=1'

  console.log(searchURL)

  $.ajax({
    type: "GET",
    url: searchURL,
    dataType: "json"
  }).done(function(serverResponse){

    $.each(serverResponse.photos.photo, function(i, item) {
      console.log(item.title)

      var photoURL = 'https://farm' + item.farm + '.staticflickr.com/' + item.server + '/' + item.id + '_' + item.secret + '_b.jpg'

      $(templeItem).append('<a class="photo" href="' + photoURL + '" data-lightbox="' + templeItem.firstChild.innerHTML + '" data-title="' + item.title + '">' + item.title + '</a>')
    })
  })
}

var deleteIrrelevantPhotos = function(templeItem) { /////////////// FIX THIS BUG BUG
  var templeName = templeItem.firstChild.innerHTML.split(" ")
  photos = templeItem.getElementsByClassName('photo')
  for (var i=0; i<photos.length; i++) {
    if (photos[i].innerHTML.indexOf(templeName[0]) == -1) {
      if (photos[i].innerHTML.indexOf(templeName[1]) == -1) {
        if (photos[i].innerHTML.indexOf(templeName[2]) == -1) {
          photos[i].parentNode.removeChild(photos[i])
        }
      }
    }
  }
}
