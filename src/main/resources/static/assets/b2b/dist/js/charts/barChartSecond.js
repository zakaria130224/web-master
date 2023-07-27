const labels = [
    "Apr 22",
    "Apr 23",
    "Apr 24",
    "Apr 25",
    "Apr 26",
    "Apr 27",
    "Apr 28",
  ];
  const data = {
    labels,
    datasets: [
      {
        label: "Dataset 1",
        data: [4.5, 5.2, 3.3, 4.7, 6, 5.4, 4.2],
        backgroundColor: "#19AAF8",
        barThickness: 10,
        borderRadius: 6,
        barPercentage: 0.9,
        categoryPercentage: 1.0,
      },
      {
        label: "Dataset 2",
        data: [4.5, 5.2, 3.3, 4.7, 6, 5.4, 4.2],
        backgroundColor: "#DDF2FE",
        barThickness: 10,
        borderRadius: 6,
        barPercentage: 0.9,
        categoryPercentage: 1.0,
      },
    ],
  };

  // Chart options
  const options = {
    responsive: true,
    plugins: {
      legend: {
        display: false,
        position: "top",
      },
      title: {
        display: false,
        text: "Chart.js Bar Chart",
      },
      categorySpacing: 0.9,
    },
  };

  // Render the chart
  const ctx = document.getElementById('barChart').getContext('2d');
  new Chart(ctx, {
    type: 'bar',
    data: data,
    options: options
  });