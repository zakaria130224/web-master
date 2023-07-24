$(document).ready(function () {
  $("#toggle-navbar").click("click", function () {
    $("#left-navbar").toggleClass("open");
  });
});

var map = L.map("map").setView([23.81, 90.43], 13);
L.tileLayer("https://tile.openstreetmap.org/{z}/{x}/{y}.png", {
  attribution:
    '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors',
}).addTo(map);

var markerGroup = L.layerGroup().addTo(map);

var markerData = [
  [23.812, 90.435],
  [23.811, 90.434],
  [23.810, 90.433],
  [23.809, 90.432],
  [13.808, 90.331],
];

markerData.forEach(function (coords) {
  var marker = L.marker(coords).addTo(markerGroup);
  marker.bindPopup("A pretty CSS popup.<br> Easily customizable.");
});

markerGroup.addTo(map);
