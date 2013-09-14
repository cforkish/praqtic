// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

function CategoryGraph() {

  var svg;

  function graph(selection, data) {

    var margin = {top: 80, right: 120, bottom: 80, left: 120},
        width = 960 - margin.right - margin.left,
        height = 800 - margin.top - margin.bottom;

    var tree = d3.layout.tree()
        .size([width, height]);

    var diagonal = d3.svg.diagonal()
        .projection(function(d) { return [d.x, height - d.y]; });

    svg = d3.select(selection).append("svg")
        .attr("display", "block")
        .attr("margin", "auto")
        .attr("preserveAspectRatio", "xMidYMin")
        .attr("width", width + margin.right + margin.left)
        .attr("height", height + margin.top + margin.bottom)
      .append("g")
        .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

    var nodes = tree.nodes(data),
        links = tree.links(nodes);

    var link = svg.selectAll("path.link")
        .data(links)
      .enter().append("path")
        .attr("class", "link")
        .attr("d", diagonal);

    var node = svg.selectAll("g.node")
        .data(nodes)
      .enter().append("g")
        .attr("class", "node")
        .attr("transform", function(d) { return "translate(" + d.x + "," + (height - d.y) + ")"; });
        // .on("click", myFunction);

    node.append("circle")
        .attr("r", 35);

    node.append("foreignObject")
        .attr("x", -20)
        .attr("y", -20)
        .attr("width", 40)
        .attr("height", 40)
        .append("xhtml") // use HTML to get word wrapping
          .html(function(d) { return "<p class=\"node-label\">" + d.name + "</p>"; });


    d3.select(self.frameElement).style("height", height + "px");
  };

  graph.nodeOnClick = function(clickFunction) {
    svg.selectAll("g.node")
      .on("click", clickFunction);
  };

  return graph;
}