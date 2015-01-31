$ ->

  # Canvas setup
  margin      = {top: 20, right: 15, bottom: 15, left: 120}
  outerWidth  = 960
  outerHeight = 500
  width = outerWidth - margin.left - margin.right
  height = outerHeight - margin.top - margin.bottom

  # Helpers
  parseDate = (dateString) ->
    format = d3.time.format("%Y-%m-%d")
    date = format.parse(dateString)
    date

  # Timeline setup
  today = new Date()
  auras  = gon.auras
  auras.forEach (aura) ->
    aura.start = parseDate(aura.start)
    aura.end   = parseDate(aura.end)
    aura.instant = false

  timeline = {}
  timeline.length  = auras.length
  timeline.minDate = d3.min(auras, (d) -> d.start)
  timeline.maxDate = d3.max(auras, (d) -> d.end)
  timeline.auraLength = d3.time.scale()
    .domain([timeline.minDate, timeline.maxDate])
    .range([0, width])

  timeline.miniHeight = auras.length * 12 + 50
  timeline.mainHeight = height - timeline.miniHeight - 50


  # Chart setup
  chart = d3.select("#timeline")
    .append("svg")
    .attr("class", "svg")
    .attr("width", outerWidth)
    .attr("height", outerHeight)

  main = chart.append("g")
    .attr("transform", "translate(" + margin.left + "," + margin.top + ")")
    .attr("width", width)
    .attr("class", "main")
    .attr("height", timeline.mainHeight)

  mini = chart.append("g")
    .attr("transform", "translate(" + margin.left + "," + margin.top + ")")
    .attr("width", width)
    .attr("class", "mini")
    .attr("height", timeline.miniHeight)

  main.append("g").selectAll(".auras")
    .data(auras)
    .enter().append("rect")
    .attr("x", (d) -> timeline.auraLength(d.start))
    .attr("y", (d, i) -> i * 25)
    .attr("width", (d) -> timeline.auraLength(d.end) - timeline.auraLength(d.start))
    .attr("height", 15)
    .attr("fill", "red")

  mini.append("g").selectAll(".auras")
    .data(auras)
    .enter().append("rect")
    .attr("x", (d) -> timeline.auraLength(d.start))
    .attr("y", (d, i) -> i * 25)
    .attr("width", (d) -> timeline.auraLength(d.end) - timeline.auraLength(d.start))
    .attr("height", 15)
    .attr("fill", "red")
