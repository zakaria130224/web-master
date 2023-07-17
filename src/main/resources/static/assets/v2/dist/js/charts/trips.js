$(document).ready(function () {
  $("#toggle-navbar").click("click", function () {
    $("#left-navbar").toggleClass("open");
  });
});

var map = L.map("map").setView([51.505, -0.09], 13);
L.tileLayer("https://tile.openstreetmap.org/{z}/{x}/{y}.png", {
  attribution:
    '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors',
}).addTo(map);

var markerGroup = L.layerGroup().addTo(map);

var markerData = [
  [51.5, -0.09],
  [51.51, -0.1],
  [51.49, -0.08],
  [51.52, -0.07],
  [51.48, -0.06],
];

markerData.forEach(function (coords) {
  var marker = L.marker(coords).addTo(markerGroup);
  marker.bindPopup("A pretty CSS popup.<br> Easily customizable.");
});

markerGroup.addTo(map);
