

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
            id: 1,
            name: "Aba Nigeria Temple",
            snippet: "121st operating temple",
            address: "Okpu-Umuoba Road • Off Aba-Owerri Road at Union Bank • Aba, Abia State • Nigeria • ",
            link: "http://www.ldschurchtemples.com/aba/",
            latitude: "7.356719",
            longitude: "5.147644",
            created_at: "2014-12-23T21:23:03.470Z",
            updated_at: "2014-12-23T21:23:03.470Z",
            announcement: "2000-04-02",
            groundbreaking: "2002-02-23",
            site_dedicator: "H. Bruce Stucki",
            dedication: "2005-08-07",
            dedicator: "name",
            site: "6.3 acres",
            exterior_finish: "Namibian pearl granite",
            total_floor_area: "11,500 square feet"
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
        0,
        0
      ]
    },
    "properties":{
      "name": "name",
      "snippet": "snippet",
      "link": "<link>",
      "address": "<address>",
      "announcement": "date",
      "groundbreaking": "date",
      "site_dedicator": "name",
      "dedication": "date",
      "site": "acreage",
      "exterior_finish": "description",
      "total_floor_area": "number"
    }
  }

  geojsonTemplate["geometry"]["coordinates"] = [parseFloat(object["latitude"]), parseFloat(object["longitude"])] // keep going like this!
  geojsonTemplate["properties"]["name"] = object["name"]
  geojsonTemplate["properties"]["snippet"] = object["snippet"]
  geojsonTemplate["properties"]["link"] = object["link"]
  geojsonTemplate["properties"]["address"] = object["address"]
  geojsonTemplate["properties"]["announcement"] = object["announcement"]
  geojsonTemplate["properties"]["groundbreaking"] = object["groundbreaking"]
  geojsonTemplate["properties"]["site_dedicator"] = object["site_dedicator"]
  geojsonTemplate["properties"]["dedication"] = object["dedication"]
  geojsonTemplate["properties"]["dedicator"] = object["dedicator"]
  geojsonTemplate["properties"]["site"] = object["site"]
  geojsonTemplate["properties"]["exterior_finish"] = object["exterior_finish"]
  geojsonTemplate["properties"]["total_floor_area"] = object["total_floor_area"]

  return geojsonTemplate

}

////////////////////////////////////////////////////////////////////////////////
//////////////////// PUSH ALL GEOJSON OBJECTS INTO READABLE ARRAY //////////////
////////////////////////////////////////////////////////////////////////////////

for (var i=0; i<primitiveJSON.length; i++) {
  geojson[0]["features"].push(reformatToGeoJSON(primitiveJSON[i]))
}
