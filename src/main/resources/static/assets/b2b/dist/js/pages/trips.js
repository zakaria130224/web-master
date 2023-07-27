$(document).ready(function () {
  $("#toggle-navbar").click("click", function () {
    $("#left-navbar").toggleClass("open");
  });
});

function initMap() {
  const myLatLng = { lat: 23.8103, lng: 90.4125 };
  const map = new google.maps.Map(document.getElementById("map"), {
    zoom: 4,
    center: myLatLng,
  });

  new google.maps.Marker({
    position: myLatLng,
    map,
    title: "Hello World!",
  });
}

window.initMap = initMap;
