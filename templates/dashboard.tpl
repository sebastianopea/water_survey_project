<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
    <title>Dashboard</title>
</head>
<body>
<h1>ciao</h1>
<div hidden="hidden">
    <p id = "tap1"><?=$tapWater1?></p>
</div>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-10">
            <div id="chart"></div>
        </div>
    </div>
</div>
    <script>
        var tap1 = document.getElementById("tap1")
        var tap2 = document.getElementById("tap2")
        var tap3 = document.getElementById("tap3")
        var filt1 = document.getElementById("filt1")
        var filt2 = document.getElementById("filt2")



        var options = {
            series: [44, 55, 13, 43, 22],
            chart: {
                width: 380,
                type: 'pie',
            },
            labels: ['Excellent', 'Good', 'Fair', 'Poor'],
            responsive: [{
                breakpoint: 480,
                options: {
                    chart: {
                        width: 200
                    },
                    legend: {
                        position: 'bottom'
                    }
                }
            }]
        };

        var chart = new ApexCharts(document.querySelector("#chart"), options);
        chart.render();
    </script>
</body>
</html>