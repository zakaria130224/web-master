document.addEventListener("DOMContentLoaded", function () {
  var ctx = document.getElementById("halfDoughnutChart").getContext("2d");
  var myChart = new Chart(ctx, {
    type: "doughnut",
    data: {
      labels: ["white", "Blue"],
      datasets: [
        {
          label: "# of Votes",
          data: [12, 19],
          backgroundColor: [
            "white",
            "rgba(54, 162, 235, 0.8)",
          ],
          borderColor: ["rgba(255, 99, 132, 1)", "rgba(54, 162, 235, 1)"],
          borderWidth: 1,
        },
      ],
    },
    options: {
      responsive: true,
      plugins: {
        legend: {
          display: false,
        },
      },
      cutout: "50%", // Adjust this value to change the size of the half-doughnut
    },
  });
});
