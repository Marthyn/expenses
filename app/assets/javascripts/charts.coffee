jQuery ->
BAR_CHART_CONFIG = {
  scaleShowGridLines: false,
  scaleGridLineColor: 'transparent',
  scaleFontFamily: "'OpenSans'",
  scaleFontColor: '#ccc',
  fillColor: '#bbbbbb',
  responsive: true
}

LINE_CHART_CONFIG = {
  datasetStrokeWidth : 0.1,
  pointDotRadius : 1
  scaleShowGridLines: false,
  scaleGridLineColor: 'transparent',
  scaleFontFamily: "'OpenSans'",
  scaleFontColor: '#ccc',
  fillColor: '#bbbbbb',
  responsive: true,
  label: "Expenses",
  tooltips: {
    enabled: false
  },
}

DOUGHNUT_CHART_CONFIG = {
  tooltipFontSize: 10
  tooltipFontStyle: "light",
  animationSteps: 50,
  animationEasing: 'easeOutQuart',
  segmentStrokeWidth: 2
}

PIE_CHART_CONFIG = {
  segmentStrokeWidth: 2,
  responsive: false,
  animationSteps: 50,
  tooltips: {
    enabled: true
  },
  legend: {
    display: false
  },
  animationEasing: 'easeOutQuart'
}

$(".pie-chart").each (index, chart) =>
  data = $(chart).data("data")
  new Chart($(chart).get(0).getContext("2d"), {
    data: data,
    options: PIE_CHART_CONFIG,
    type: 'pie'
  })

if $('#bar-chart').length > 0
  $canvas = $('#bar-chart');
  data = $canvas.data('data');
  context = $canvas[0].getContext('2d');
  new Chart(context, {
    data: data,
    options: BAR_CHART_CONFIG,
    type: 'bar'
  })

if $('#line-chart').length > 0
  $canvas = $('#line-chart');
  data = $canvas.data('data');
  context = $canvas[0].getContext('2d');
  new Chart(context, {
    data: data,
    options: LINE_CHART_CONFIG,
    type: 'line'
  })

# Category spent charts
$('.spent-chart').each (i, el) ->
  $el = $(el)
  spent = $el.data('spent')
  color = $(el).data('color')
  setTimeout (->
    new Chart(el.getContext('2d'), {
        data: {
          labels: [],
          datasets: [
            {
              data: [spent, 100-spent],
              backgroundColor: [color, '#E2EAE9']
            }
          ]
        },
        options: {
          cutoutPercentage: 80,
          tooltips: {
            enabled: false
          },
          animationSteps: 50,
          animationEasing: 'easeOutQuart'
        },
        type: 'doughnut'
      })
    ), 50 * i
