d3.json("http://localhost:9292/stats", function(data){

var width = 1000;
var height = 1000;

var widthScale = d3.scale.linear()
                  .domain([1949, 2015])
                  .range([0, width]);

  var axis = d3.svg.axis()
            .scale(widthScale)
            .ticks(10)

  var heightScale = d3.scale.linear()
                    .domain([1949, 2015])
                    .range([0, height]);

  var colorScale = d3.scale.linear()
                    .domain([1949, 2015])
                    .range(["red", "black"]);

  var canvas = d3.select("#visualisation").append("svg")
              .attr("width", width)
              .attr("height", height)
              .append("g");

  canvas.append("g")
        .attr("transform", "translate(0,height)")
        .call(axis)

  var circle = canvas.selectAll("rect")
                .data(data)
                .enter()
                  .append("rect")
                  .attr("width", function(d){return widthScale(d.year);})
                  .attr("height", 5)
                  .attr("y", function(d,i) {return i*10;})
                  .attr("fill", function(d){return colorScale(d.year);})





})
