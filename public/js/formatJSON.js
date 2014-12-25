

////////////////////////////////////////////////////////////////////////////////
//////////////////// SET UP SKELETON FORMAT FOR geojson ARRAY //////////////////
////////////////////////////////////////////////////////////////////////////////


var geojson =
  [
    {
      "type": "FeatureCollection",
      "features": []
    }
  ]


var example = {
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
////////////////// DEFINE FUNCTION TO REFORMAT JSON TO GEOJSON /////////////////
////////////////////////////////////////////////////////////////////////////////

var reformatToGeoJSON = function(object){

  var geojsonTemplate =
  {
    "type":"Feature",
    "geometry":{
      "type":"Point",
      "coordinates":[
        7.356719,
        5.147644
      ]
    },
    "properties":{
      "name": "Aba Nigeria Temple",
      "snippet": "121st operating temple",
      "link": "<link>",
      "address": "<address>"
    }
  }

  geojsonTemplate["geometry"]["coordinates"] = [parseFloat(object["latitude"]), parseFloat(object["longitude"])] // keep going like this!
  geojsonTemplate["properties"]["name"] = object["name"]
  geojsonTemplate["properties"]["snippet"] = object["snippet"]
  geojsonTemplate["properties"]["link"] = object["link"]
  geojsonTemplate["properties"]["address"] = object["address"]

  return geojsonTemplate

}

////////////////////////////////////////////////////////////////////////////////
//////////////////// PUSH ALL GEOJSON OBJECTS INTO READABLE ARRAY //////////////
////////////////////////////////////////////////////////////////////////////////

for (var i=0; i<primitiveJSON.length; i++) {
  geojson[0]["features"].push(reformatToGeoJSON(primitiveJSON[i]))
}

console.log("better be right", geojson)
