document.addEventListener("DOMContentLoaded", function() {
    // Doughnut chart data
    var data = {
       
        datasets: [{
            data: [10, 20, 30],
            backgroundColor: ["#FF6384", "#36A2EB", "#FFCE56"],
            hoverBackgroundColor: ["#FF6384", "#36A2EB", "#FFCE56"],
            innerWidth:'100px'
        }]
    };

    // Get the canvas element
    var canvas = document.getElementById("circle");

    // Create the doughnut chart
    var myDoughnutChart = new Chart(canvas, {
        type: 'doughnut',
        data: data,
        options: {
            cutoutPercentage: 50 // Adjust the size of the center hole (0-100)
        }
    });
});
