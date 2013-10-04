
function CategoryGraph() {

  var svg,
      root;

  var categoryForceNodes;

  var categoryClickFunction,
      conceptClickFunction;

  var categoryNode,
      categoryLink,
      conceptNode,
      conceptLink;

  var categoryNodes,
      categoryLinks;

  var nodeRadius = 35,
      duration = 750;

  var margin = {top: 80, right: 120, bottom: 80, left: 120},
      width = 960 - margin.right - margin.left,
      height = 800 - margin.top - margin.bottom;

  var tree = d3.layout.tree()
      .size([width, height]);

  var force = d3.layout.force()
    .on("tick", tick)
    .size([width, height])
    .gravity(0)
    .charge(-130)
    .linkDistance(nodeRadius * 2);

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

    graph.setupTree();

  };

  graph.setupTree = function() {

    var nodes = tree.nodes(root),
        links = tree.links(nodes);

    var filteredData = removeDuplicateParents(nodes, links);
    categoryNodes = filteredData.nodes;
    categoryLinks = filteredData.links;

    // categoryNodes[0].fixed = true;
    categoryNodes.forEach(function(o) {
        o.fixed = true;
    });

    force
        .nodes(categoryNodes)
        .links(categoryLinks)
        .start();

    // force.nodes(nodes);
    // categoryForceNodes = force.nodes();
    // categoryForceNodes.forEach(function(o) {
    //     o.fixed = true;
    // });

    categoryNode = svg.selectAll("g.node.category")
        .data(categoryNodes);

    var nodeEnter = categoryNode.enter().append("g")
        .attr("class", "node category")
        .attr("transform", function(d) { return "translate(" + d.x + "," + (height - d.y) + ")"; })
        .on("click", categoryClickFunction);

    nodeEnter.append("circle")
        .attr("r", nodeRadius);

    nodeEnter.append("foreignObject")
        .attr("x", -nodeRadius/2.0)
        .attr("y", -nodeRadius/2.0)
        .attr("width", nodeRadius)
        .attr("height", nodeRadius)
        .append("xhtml") // use HTML to get word wrapping
          .html(function(d) { return "<p class=\"node-label category\">" + d.name + "</p>"; });


    categoryLink = svg.selectAll("path.link.category")
        .data(categoryLinks);

    categoryLink.enter().insert("path", "g")
        .attr("class", "link category")
        .attr("d", diagonal);


    // var friendLinks = setupFriendLinks(nodes);

    // var friendLink = svg.selectAll("path.link.friend")
    //     .data(friendLinks);

    // friendLink.enter().insert("path", "g")
    //     .attr("class", "link friend")
    //     .attr("d", diagonal);

  }

  graph.showConcepts = function (node) {
    // var nodes = flatten(root);

    var conceptNodes = node.concepts;
    var allNodes = conceptNodes.concat(categoryNodes);
    var links = conceptLinks(node);

    // Restart the force layout.
    force
        .nodes(allNodes)
        .links(links)
        .start();

    // Update the links…
    conceptLink = svg.selectAll("line.link.concept")
        .data(links, function(d) { return d.target.id; });

    // Enter any new links.
    conceptLink.enter().insert("line", "g")
        .attr("class", "link concept")
        .attr("x1", function(d) { return d.source.x; })
        .attr("y1", function(d) { return height - d.source.y; })
        .attr("x2", function(d) { return d.target.x; })
        .attr("y2", function(d) { return height - d.target.y; });

    // Exit any old links.
    conceptLink.exit().remove();

    // Update the nodes…
    conceptNode = svg.selectAll("g.node.concept")
        .data(conceptNodes, function(d) { return d.id; });

    // Enter any new nodes.
    var conceptNodeEnter = conceptNode.enter().append("g")
        .attr("class", "node concept")
        .attr("transform", function(d) { return "translate(" + d.x + "," + (height - d.y) + ")"; })
        .on("click", conceptClickFunction);

    conceptNodeEnter.append("circle")
        .attr("r", nodeRadius/2.0);

    conceptNodeEnter.append("foreignObject")
        .attr("x", -nodeRadius/4.0)
        .attr("y", -nodeRadius/4.0)
        .attr("width", nodeRadius/2.0)
        .attr("height", nodeRadius/2.0)
        .append("xhtml") // use HTML to get word wrapping
          .html(function(d) { return "<p class=\"node-label concept\">" + d.name + "</p>"; });

    // Exit any old nodes.
    conceptNode.exit().remove();
  }

  // Helper function to map node id's to node objects.
  // Returns d3.map of ids -> nodes
  function mapNodes(nodes) {
    var nodesMap = d3.map();
    for(var i = 0; i < nodes.length; i++) {
      nodesMap.set(nodes[i].id, nodes[i]);
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

  function removeDuplicateParents(nodes, links) {
    var targetMap = d3.map();
    var duplicateNodes = [];
    var duplicateLinks = [];

    links.forEach(function(link) {
      if (targetMap.has(link.target.id)) {
        var prevTarget = targetMap.get(link.target.id);
        if (link.target.depth > prevTarget.depth) {
          prevTarget.depth = link.target.depth;
          prevTarget.y = link.target.y;
        }
        duplicateNodes.push(link.target);
        link.target = prevTarget;
      }
      else {
        targetMap.set(link.target.id, link.target);
      }
    });

    uniqueLinks = links.filter(function(link) {
      return duplicateNodes.indexOf(link.source) === -1;
    });
    // todo: am i leaving duplicates of the duplicate children?
    uniqueNodes = nodes.filter(function(node) {
      return duplicateNodes.indexOf(node) === -1;
    });

    return {
      nodes: uniqueNodes,
      links: uniqueLinks
    };
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

  graph.categoryNodeOnClick = function(clickFunction) {
    categoryClickFunction = clickFunction;
    svg.selectAll("g.node.category")
      .on("click", clickFunction);
  };

  graph.conceptNodeOnClick = function(clickFunction) {
    conceptClickFunction = clickFunction;
    svg.selectAll("g.node.concept")
      .on("click", clickFunction);
  };


  function tick(e) {

    // // Push sources up and targets down to form a weak tree.
    // var k = 6 * e.alpha;
    // categoryLinks.forEach(function(d, i) {
    //   d.source.y -= k;
    //   d.target.y += k;
    // });

    // categoryNode.attr("transform", function(d) { return "translate(" + d.x + "," + (height - d.y) + ")"; });
    // categoryLink.attr("d", diagonal);

    if (conceptLink) {
      conceptLink.attr("x1", function(d) { return d.source.x; })
          .attr("y1", function(d) { return height - d.source.y; })
          .attr("x2", function(d) { return d.target.x; })
          .attr("y2", function(d) { return height - d.target.y; });
    }

    if (conceptNode) {
      conceptNode.attr("transform", function(d) { return "translate(" + d.x + "," + (height - d.y) + ")"; });
    }

  }

  return graph;
}