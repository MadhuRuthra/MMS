<?
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
header("Access-Control-Allow-Headers: X-Requested-With");
?>
<link rel="stylesheet" href="https://code.highcharts.com/css/highcharts.css" />
<style>
	.highcharts-background {
  fill: #222;
}

.highcharts-title,
.highcharts-axis-title {
  fill: #DDD;
}

.highcharts-credits,
.highcharts-credits:hover {
  fill: #222;
}
body {
  background-color: #222;
  margin 0 !important;
}
#container {
  margin: 0;
  padding: 0;
  border: 0;
  background-color: #222;
  min-height: 400px;
  height:95%;
  width:95%;
  position:absolute;
}
</style>

<div id="container"></div>

<script src="https://code.highcharts.com/highcharts.js"></script>
<script>
const options = {
  chart: {
    type: 'spline'
  },
  title: {
    text: 'Live Bitcoin Price'
  },
  xAxis: {
    type: 'datetime'
  },
  yAxis: {
    title: {
      text: 'Price (USD)'
    }
  },
  legend: {
    enabled: false
  },
  exporting: {
    enabled: false
  },
  series: [{
    name: 'Live Bitcoint Price [USD]',
    data: []
  }]
}
const chart = Highcharts.chart('container', options)

// Data
const getData = () => {
  setInterval(() => {
    // window.fetch('https://api.cryptonator.com/api/ticker/btc-usd').then((response) => {
    window.fetch('https://yjtec.in/mms/api/get_result?process=get_dashboard_linechart_data').then((response) => {
      return response.json()
    }).then((data) => {
			// var aa = (Math.floor(Math.random() * 4) + 1);
			console.log(data.status_code);
      chart.series[0].addPoint({ x: Number(data.hour_time), y: Number(data.visitor_count) })
    })
  }, 3000)
}
getData()
</script>
