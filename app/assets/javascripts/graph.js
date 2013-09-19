// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

function CategoryGraph() {

  var svg,
      root;

  var conceptNode,
      conceptLink;

  var nodeRadius = 35,
      duration = 750;

  var margin = {top: 80, right: 120, bottom: 80, left: 120},
      width = 960 - margin.right - margin.left,
      height = 800 - margin.top - margin.bottom;

  var tree = d3.layout.tree()
      .size([width, height]);

  var force = d3.layout.force()
    .on("tick", tick)
    .size([width, height]);

  var diagonal = d3.svg.diagonal()
      .projection(function(d) { return [d.x, height - d.y]; });

  function graph(selection, data) {

    root = data;

    svg = d3.select(selection).append("svg")
        .attr("width", width + margin.right + margin.left)
        .attr("height", height + margin.top + margin.bottom)
      .append("g")
        .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

    d3.select(self.frameElement).style("height", height + "px");

    graph.update();

  };

  graph.update = function() {

    var nodes = tree.nodes(root),
        links = tree.links(nodes);

    // var friendLinks = setupFriendLinks(nodes);

    // var friendLink = svg.selectAll("path.link")
    //     .data(friendLinks)
    //   .enter().append("path")
    //     .attr("class", "friendlink")
    //     .attr("d", diagonal);

    var node = svg.selectAll("g.node")
        .data(nodes);

    var nodeEnter = node.enter().append("g")
        .attr("class", function (d) {return "concept_id" in d ? "concept-node" : "node"})
        .attr("transform", function(d) { return "translate(" + d.x + "," + (height - d.y) + ")"; });

    nodeEnter.append("circle")
        .attr("r", nodeRadius);

    nodeEnter.append("foreignObject")
        .attr("x", -nodeRadius/2.0)
        .attr("y", -nodeRadius/2.0)
        .attr("width", nodeRadius)
        .attr("height", nodeRadius)
        .append("xhtml") // use HTML to get word wrapping
          .html(function(d) { return "<p class=\"node-label\">" + d.name + "</p>"; });

    // Transition nodes to their new position.
    var nodeUpdate = node.transition()
        .duration(duration)
          .attr("transform", function(d) { return "translate(" + d.x + "," + (height - d.y) + ")"; });


    var link = svg.selectAll("path.link")
        .data(links);

    link.enter().insert("path", "g")
        .attr("class", "link")
        .attr("d", diagonal);

    // Transition links to their new position.
    link.transition()
        .duration(duration)
        .attr("d", diagonal);

  }

  graph.showConcepts = function (node) {
    // var nodes = flatten(root);
    // nodes.concat(node.concepts);
        // links = d3.layout.tree().links(nodes);

    // var conceptNode = svg.selectAll("g.concept-node")
    //     .data(node.concepts);

    // var conceptNodeEnter = conceptNode.enter.append("g")
    //     .attr("class", "concept-node")
    //     .attr("transform", function(d) { return "translate(" + d.x + "," + (height - d.y) + ")"; });


    // conceptNodeEnter.append("circle")
    //     .attr("r", nodeRadius/2.0);

    // conceptNodeEnter.append("foreignObject")
    //     .attr("x", -nodeRadius/4.0)
    //     .attr("y", -nodeRadius/4.0)
    //     .attr("width", nodeRadius)
    //     .attr("height", nodeRadius)
    //     .append("xhtml") // use HTML to get word wrapping
    //       .html(function(d) { return "<p class=\"node-label\">" + d.name + "</p>"; });

    var nodes = node.concepts;
    nodes.push(node);
    var links = conceptLinks(node);

    // Restart the force layout.
    force
        .nodes(nodes)
        .links(links)
        .start();

    // Update the links…
    conceptLink = svg.selectAll("line.link")
        .data(links, function(d) { return d.target.id; });

    // Enter any new links.
    conceptLink.enter().insert("svg:line", ".node")
        .attr("class", "concept-link")
        .attr("x1", function(d) { return d.source.x; })
        .attr("y1", function(d) { return d.source.y; })
        .attr("x2", function(d) { return d.target.x; })
        .attr("y2", function(d) { return d.target.y; });

    // Exit any old links.
    conceptLink.exit().remove();

    // Update the nodes…
    conceptNode = svg.selectAll("circle.node")
        .data(nodes, function(d) { return d.id; })
        .style("fill", "#ccc");

    // Enter any new nodes.
    conceptNode.enter().append("svg:circle")
        .attr("class", "node")
        .attr("cx", function(d) { return d.x; })
        .attr("cy", function(d) { return d.y; })
        .attr("r", function(d) { return Math.sqrt(d.size) / 10 || 4.5; })
        .style("fill", "#ccc");
        // .on("click", click)
        // .call(force.drag);

    // Exit any old nodes.
    conceptNode.exit().remove();

    graph.update();
  }

  function tick() {
    conceptLink.attr("x1", function(d) { return d.source.x; })
        .attr("y1", function(d) { return d.source.y; })
        .attr("x2", function(d) { return d.target.x; })
        .attr("y2", function(d) { return d.target.y; });

    conceptNode.attr("cx", function(d) { return d.x; })
        .attr("cy", function(d) { return d.y; });
  }

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

      if("friends" in nodes[i]) {
        var friends = nodes[i].friends;

        for(var j = 0; j < friends.length; j++) {
          var friend = friends[j];
          friendLinks.push( {"source" : nodeMap.get(friend.source), "target" : nodeMap.get(friend.target)} );
        }
      }
    }

    return friendLinks;
  }

  function conceptLinks(node) {
    var links = [];

    node.concepts.forEach(function(concept) {
      links.push( {"source" : node, "target" : concept} );
    });

    return links;
  }

  // Returns a list of all nodes under the root.
  function flatten(root) {
    var nodes = [], i = 0;

    function recurse(node) {
      if (node.children) node.children.forEach(recurse);
      if (!node.id) node.id = ++i;
      nodes.push(node);
    }

    recurse(root);
    return nodes;
  }

  graph.nodeOnClick = function(clickFunction) {
    // function onClick(d) {
    //   clickFunction(d);

    // }
    svg.selectAll("g.node")
      .on("click", clickFunction);
  };

  return graph;
}