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
        .attr("width", width + margin.right + margin.left)
        .attr("height", height + margin.top + margin.bottom)
      .append("g")
        .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

    var nodes = tree.nodes(data),
        links = tree.links(nodes);

    var friendLinks = setupFriendLinks(nodes);

    var friendLink = svg.selectAll("path.link")
        .data(friendLinks)
      .enter().append("path")
        .attr("class", "friendlink")
        .attr("d", diagonal);

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

  // Helper function to map node id's to node objects.
  // Returns d3.map of ids -> nodes
  function mapNodes(nodes) {
    var nodesMap = d3.map();
    for(var i = 0; i < nodes.length; i++) {
      nodesMap.set(nodes[i].category_id, nodes[i]);
    }
    return nodesMap;
  }

  function setupFriendLinks(nodes) {
    var nodeMap = mapNodes(nodes);
    var friendLinks = [];

    for(var i = 0; i < nodes.length; i++) {
      var friends = nodes[i].friends;

      for(var j = 0; j < friends.length; j++) {
        var friend = friends[j];
        friendLinks.push( {"source" : nodeMap.get(friend.source), "target" : nodeMap.get(friend.target)} );
      }
    }

    return friendLinks;
  }

  graph.nodeOnClick = function(clickFunction) {
    svg.selectAll("g.node")
      .on("click", clickFunction);
  };

  return graph;
}