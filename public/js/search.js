var searchTemples = function(inputVal) {
  var allTemples = $('.item')

  for (var i = 0; i<allTemples.length; i++) {
    if (allTemples[i].innerText.toLowerCase().indexOf(inputVal.toLowerCase()) == -1) {
      $(allTemples[i]).hide();
    }
    else {
      $(allTemples[i]).show();
    }
  }

}

