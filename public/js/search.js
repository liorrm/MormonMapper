var searchTemples = function(inputVal) {
  var allTemples = $('.item')

  for (var i = 0; i<allTemples.length; i++) {
    if (allTemples[i].innerText.indexOf(inputVal) == -1) {
      $(allTemples[i]).hide();
    }
    else {
      $(allTemples[i]).show();
    }
  }

}

