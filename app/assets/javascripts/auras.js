  auras = gon.auras
  parseDate = d3.time.format("%Y-%m-%d").parse
  auras.forEach(function(aura) {
    aura.start = parseDate(aura.start)
    aura.end   = parseDate(aura.end)
  })

  minDate = d3.min(auras, function (d) { return d.start })
  maxDate = d3.max(auras, function (d) { return d.end })
  height = auras.length * 15 + 10
  height2 = auras.length * 3 + 2
  margin = {top: 10, right: 10, bottom: height2 + 50, left: 10}
  margin2 = {top: height + 50, right: 10, bottom: 20, left: 10}
  width = 960 - margin.left - margin.right

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

  brush = d3.svg.brush()
    .x(x2)
    .on("brush", brushed)

  svg = d3.select("#timeline")
    .append("svg")
    .attr("id", "timeline-d3")
    .attr("width", width + margin.left + margin.right)
    .attr("height", height + height2 + 100)
    .attr("preserveAspectRatio", "xMidYMid")

  svg.append("defs").append("clipPath")
    .attr("id", "clip")
    .append("rect")
      .attr("width", width)
      .attr("height", height)

  focus = svg.append("g")
    .attr("class", "focus")
    .attr("transform", "translate(" + margin.left + "," + margin.top + ")")
  
  tip = d3.select("body").append("div")
    .attr("class", "tooltip")
    .style("opacity", 0)

  focus.append("g")
    .attr("class", "auras")

  focus.select(".auras").selectAll(".aura")
    .data(auras)
    .enter().append("rect")
    .attr("class", "aura")
    .attr("x", function (d) { return x(d.start) })
    .attr("y", function (d, i) { return i * 15 })
    .attr("width", function (d) { return x(d.end) - x(d.start) })
    .attr("height", 10)
    .on("mouseover", function(d) {
      info = '<span class="tooltip__title">'
      if (d.job_number !== "") {
        info += "<strong>Job number: " + d.job_number + "</strong>";
      }
      info += '<span class="tooltip__customer">' + d.customer + '</span>';
      info += '</span>'
      info += '<span class="tooltip__name">Name: ' + d.name + '</span>';
      if (d.description) {
        info += '<span class="tooltip__desc">Description: ' + d.description + '</span>';
      }
      info += '<span class="tooltip__time">';
      info += '<span class="tooltip__time--start">' + moment(d.start).format('MMMM Do YYYY') + '</span>';
      info += '<span class="tooltip__time--end">' + moment(d.end).format('MMMM Do YYYY') + '</span>';
      info += '</span>';
      tip.transition()
        .duration(200)
        .style("opacity", 0.9)
      tip.html(info)
        .style("left", (d3.event.pageX + 20) + "px")
        .style("top", (d3.event.pageY - 5) + "px")
    })
    .on("mouseout", function(d) {
      tip.transition()
        .duration(200)
        .style("opacity", 0)
        .style("left", 0)
        .style("top", 0)
    })

  focus.append("g")
    .attr("class", "x axis")
    .attr("transform", "translate(0," + height + ")")
    .call(xAxis)

  context = svg.append("g")
    .attr("class", "context")
    .attr("transform", "translate(" + margin2.left + "," + margin2.top + ")")

  context.append("g")
    .attr("class", "auras")
    .attr("fill", "#ababab")

  context.select(".auras").selectAll(".aura")
    .data(auras)
    .enter().append("rect")
    .attr("class", "aura")
    .attr("x", function (d) { return x2(d.start) })
    .attr("y", function (d, i) { return i * 3 })
    .attr("width", function (d) { return x2(d.end) - x(d.start) })
    .attr("height", 2)

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
      .attr("y", function (d, i) { return i * 15 })
      .attr("width", function (d) { return x(d.end) - x(d.start) })
      .attr("height", 10)
    focus.select(".x.axis").call(xAxis)
  }
