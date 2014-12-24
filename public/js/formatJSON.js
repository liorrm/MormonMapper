

////////////////////////////////////////////////////////////////////////////////
//////////////////// SET UP SKELETON FORMAT FOR geoJSON ARRAY //////////////////
////////////////////////////////////////////////////////////////////////////////


geoJSON = [
  [
    {
      "type": "FeatureCollection",
      "features": []
    }
  ]
          ]


example = {
            address: "Okpu-Umuoba Road • Off Aba-Owerri Road at Union Bank • Aba, Abia State • Nigeria • ",
            created_at: "2014-12-23T21:23:03.470Z",
            id: 1,
            latitude: "7.356719",
            link: "http://www.ldschurchtemples.com/aba/",
            longitude: "5.147644",
            name: "Aba Nigeria Temple",
            snippet: "121st operating temple",
            updated_at: "2014-12-23T21:23:03.470Z"
          }



////////////////////////////////////////////////////////////////////////////////
//////////////////////// COLLECT ALL JSON ELEMENTS ON PAGE /////////////////////
////////////////////////////////////////////////////////////////////////////////


var htmlJSON = document.getElementsByClassName('json')


////////////////////////////////////////////////////////////////////////////////
///////// PARSE EACH JSON STRING INTO TRUE JSON, GATHER THEM INTO ARRAY ////////
////////////////////////////////////////////////////////////////////////////////

primitiveJSON = []


for (var i=0; i<htmlJSON.length; i++) {
  primitiveJSON.push(JSON.parse(htmlJSON[i].innerHTML))
}
