  auras = gon.auras
  parseDate = d3.time.format("%Y-%m-%d").parse
  auras.forEach(function(aura) {
    aura.start = parseDate(aura.start)
    aura.end   = parseDate(aura.end)
  })

  minDate = d3.min(auras, function (d) { return d.start })
  maxDate = d3.max(auras, function (d) { return d.end })
  margin = {top: 10, right: 10, bottom: 100, left: 40}
  margin2 = {top: 430, right: 10, bottom: 20, left: 40}
  width = 960 - margin.left - margin.right
  height = 500 - margin.top - margin.bottom
  height2 = 500 - margin2.top - margin2.bottom

  x  = d3.time.scale()
    .range([0, width])
    .domain([minDate, maxDate])
  x2 = d3.time.scale()
    .range([0, width])
    .domain(x.domain())
  y = d3.scale.linear().range([height, 0])
  y2 = d3.scale.linear().range([height2, 0])

  xAxis  = d3.svg.axis().scale(x).orient("bottom")
  xAxis2 = d3.svg.axis().scale(x2).orient("bottom")
  yAxis  = d3.svg.axis().scale(y).orient("left")

  brush = d3.svg.brush()
    .x(x2)
    .on("brush", brushed)

  svg = d3.select("#timeline")
    .append("svg")
    .attr("id", "timeline-d3")
    .attr("width", width + margin.left + margin.right)
    .attr("height", height + margin.top + margin.bottom)

  svg.append("defs").append("clipPath")
    .attr("id", "clip")
    .append("rect")
      .attr("width", width)
      .attr("height", height)

  focus = svg.append("g")
    .attr("class", "focus")
    .attr("transform", "translate(" + margin.left + "," + margin.top + ")")

  focus.append("g")
    .attr("class", "auras")

  focus.select(".auras").selectAll(".aura")
    .data(auras)
    .enter().append("rect")
    .attr("class", "aura")
    .attr("x", function (d) { return x(d.start) })
    .attr("y", function (d, i) { return i * 25 })
    .attr("width", function (d) { return x(d.end) - x(d.start) })
    .attr("height", 15)

  focus.append("g")
    .attr("class", "x axis")
    .attr("transform", "translate(0," + height + ")")
    .call(xAxis)

  focus.append("g")
    .attr("class", "y axis")
    .attr("transform", "translate(0," + height + ")")
    .call(yAxis)

  context = svg.append("g")
    .attr("class", "context")
    .attr("transform", "translate(" + margin2.left + "," + margin2.top + ")")

  context.append("g")
    .attr("class", "auras")

  context.select(".auras").selectAll(".aura")
    .data(auras)
    .enter().append("rect")
    .attr("class", "aura")
    .attr("x", function (d) { return x2(d.start) })
    .attr("y", function (d, i) { return i * 7 })
    .attr("width", function (d) { return x2(d.end) - x(d.start) })
    .attr("height", 5)

  context.append("g")
    .attr("class", "x axis")
    .attr("transform", "translate(0," + height2 + ")")
    .call(xAxis2)

  context.append("g")
    .attr("class", "x brush")
    .call(brush)
    .selectAll("rect")
    .attr("y", -6)
    .attr("height", height2 + 7)


  function brushed() {
    x.domain(brush.empty() ? x2.domain() : brush.extent())
    focus.selectAll(".aura")
      .attr("x", function (d) { return x(d.start) })
      .attr("y", function (d, i) { return i * 25 })
      .attr("width", function (d) { return x(d.end) - x(d.start) })
      .attr("height", 15)
    focus.select(".x.axis").call(xAxis)
  }
