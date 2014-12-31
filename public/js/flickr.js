
var loadFlickrPhotos = function(templeItem) {
  var templeName = templeItem.firstChild.innerHTML.split(" ")

  for (var i=0; i<templeName.length; i++){
    templeName[i] += "+"
  }

  var searchTerm = templeName.join("") + "LDS"
  console.log(searchTerm)

  var apiKey = "ae27bc9d3af17e89122b67b7aa6a86cb"

  var searchURL = 'https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=' + apiKey + '&text=' + searchTerm + '&format=json&nojsoncallback=1'

  console.log(searchURL)

  $.ajax({
    type: "GET",
    url: searchURL,
    dataType: "json",
    success: function(serverResponse){
      console.log(serverResponse)

      $.each(serverResponse.photos.photo, function(i, item) {
        console.log(item.title)
        var photoURL = 'https://farm' + item.farm + '.staticflickr.com/' + item.server + '/' + item.id + '_' + item.secret + '_b.jpg'

        $(templeItem).append('<a class="photo" href="' + photoURL + '" data-lightbox="' + templeItem.firstChild.innerHTML + '" data-title="' + item.title + '">' + item.title + '</a>')
      })
    }
  })
}