d3.json("http://localhost:9292/stats", function(data){

var width = 500;
var height = 500;

  var canvas = d3.select("#visualisation").append("svg")
              .attr("width", width)
              .attr("height", height);

  var circles = canvas.selectAll("circle")
                .data(data)
                .enter()
                  .append("circle")
                  .attr("r", function(d) {return d.year;});




})
