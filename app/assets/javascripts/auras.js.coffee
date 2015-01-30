$ ->
  auras = gon.auras
  lanes = []
  
  $(auras).each ->
    lanes.push this.name.toString()

  laneLength = auras.length
  timeBegin  = auras[0].start_date
  timeEnd    = Date.now

  m = [20, 15, 15, 120]
  w = 960 - m[1] - m[3]
  h = 500 - m[0] - m[2]
  miniHeight = laneLength * 12 + 50
  mainHeight = h - miniHeight - 50

  x = d3.time.scale()
    .domain([timeBegin, timeEnd])
    .range([0, w])
  x1 = d3.time.scale()
    .range([0, w])
  y1 = d3.time.scale()
    .domain([0, laneLength])
    .range([0, mainHeight])
  y2 = d3.time.scale()
    .domain([0, laneLength])
    .range([0, miniHeight])

  chart = d3.select("#timeline")
    .append("svg")
    .attr("width", w + m[1] + m[3])
    .attr("height", h + m[0] + m[2])
    .attr("class", "chart")

  chart.append("defs").append("clipPath")
    .attr("id", "clip")
    .append("rect")
    .attr("width", w)
    .attr("height", mainHeight)

  main = chart.append("g")
    .attr("transform", "translate(" + m[3] + "," + m[0] + ")")
    .attr("width", w)
    .attr("height", mainHeight)
    .attr("class", "main")

  mini = chart.append("g")
    .attr("transform", "translate(" + m[3] + "," + (mainHeight + m[0]) + ")")
    .attr("width", w)
    .attr("height", miniHeight)
    .attr("class", "mini")

  main.append("g").selectAll(".laneLines")
    .data(auras)
    .enter().append("line")
    .attr("x1", m[1])
    .attr("y1", (d) -> y1(d.id))
    .attr("x2", w)
    .attr("y2", (d) -> y1(d.id))
    .attr("stroke", "lightgray")

  main.append("g").selectAll(".laneText")
    .data(lanes)
    .enter().append("text")
    .text((d) -> d)
    .attr("x", -m[1])
    .attr("y", (d, i) -> y1(i + .5))
    .attr("dy", ".5ex")
    .attr("text-anchor", "end")
    .attr("class", "laneText")

  mini.append("g").selectAll(".laneLines")
    .data(auras)
    .enter().append("line")
    .attr("x1", m[1])
    .attr("y1", (d) -> y2(d.id))
    .attr("x2", w)
    .attr("y2", (d) -> y2(d.id))
    .attr("stroke", "lightgray")

  mini.append("g").selectAll(".laneText")
    .data(lanes)
    .enter().append("text")
    .text((d) -> d)
    .attr("x", -m[1])
    .attr("y", (d, i) -> y2(i + .5))
    .attr("dy", ".5ex")
    .attr("text-anchor", "end")
    .attr("class", "laneText")

  itemRects = main.append("g")
    .attr("clip-path", "url(#clip)")

  mini.append("g").selectAll("miniItems")
    .data(auras)
    .enter().append("rect")
    .attr("class", (d) -> "miniItem" + d.id)
    .attr("x", (d) -> x(d.start_date))
    .attr("y", (d) -> y2(d.id + .5) - 5)
    .attr("width", (d) -> x(d.end_date - d.start_date))
    .attr("height", 10)
