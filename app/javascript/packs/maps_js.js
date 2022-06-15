function myMap() {
var mapProp= {
    center:new google.maps.LatLng(31.5199436, 74.3281075),
    zoom:5,
};
var map = new google.maps.Map(document.getElementById("googleMap"),mapProp);
}