
function ConceptGraph() {

  var svg,
      preRoot,
      postRoot,
      conceptID;

  var categoryForceNodes;

  var clickFunction;

  var nodeRadius = 20;

  var margin = {top: 15, right: 120, bottom: 80, left: 120},
      width = 960 - margin.right - margin.left,
      height = 800 - margin.top - margin.bottom;

  var preTree = d3.layout.tree()
      .size([height/2, width]);

  var postTree = d3.layout.tree()
      .size([height/2, width]);

  var preDiagonal = d3.svg.diagonal()
      .projection(function(d) { return [height/2-d.y/2, d.x]; });

  var postDiagonal = d3.svg.diagonal()
      .projection(function(d) { return [height/2+d.y/2, d.x]; });

  function graph(selection, prereqs, postreqs, theConceptID) {

    preRoot = prereqs;
    postRoot = postreqs;
    conceptID = theConceptID;

    svg = d3.select(selection).append("svg")
        .attr("width", width + margin.right + margin.left)
        .attr("height", height + margin.top + margin.bottom)
      .append("g")
        .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

    d3.select(self.frameElement).style("height", height + "px");

    graph.setupTree();

  };

  graph.setupTree = function() {

    var preNodes = preTree.nodes(preRoot),
        preLinks = preTree.links(preNodes);

    var postNodes = postTree.nodes(postRoot),
        postLinks = postTree.links(postNodes);

    var preNode = svg.selectAll("g.node.prereq")
        .data(preNodes);

    var postNode = svg.selectAll("g.node.postreq")
        .data(postNodes);

    var preNodeEnter = preNode.enter().append("g")
        .attr("class", "node concept prereq")
        .attr("id", function(d) { return d.id; })
        .attr("transform", function(d) { return "translate(" + (height/2 - d.y/2) + "," + d.x + ")"; })
        .on("click", clickFunction);

    preNodeEnter.append("circle")
        .attr("r", nodeRadius);


    preNodeEnter.append("foreignObject")
        .attr("x", -nodeRadius/2.0)
        .attr("y", -nodeRadius/2.0)
        .attr("width", nodeRadius)
        .attr("height", nodeRadius)
        .append("xhtml") // use HTML to get word wrapping
          .html(function(d) { return "<p class=\"node-label\">" + d.name + "</p>"; });

    var postNodeEnter = postNode.enter().append("g")
        .attr("class", "node concept postreq")
        .attr("id", function(d) { return d.id; })
        .attr("transform", function(d) { return "translate(" + (height/2 + d.y/2) + "," + d.x + ")"; })
        .on("click", clickFunction);

    postNodeEnter.append("circle")
        .attr("r", nodeRadius);

    postNodeEnter.append("foreignObject")
        .attr("x", -nodeRadius/2.0)
        .attr("y", -nodeRadius/2.0)
        .attr("width", nodeRadius)
        .attr("height", nodeRadius)
        .append("xhtml") // use HTML to get word wrapping
          .html(function(d) { return "<p class=\"node-label\">" + d.name + "</p>"; });

    var preLink = svg.selectAll("path.link.prereq")
        .data(preLinks)
        .enter().insert("path", "g")
          .attr("class", "link prereq")
          .attr("d", preDiagonal);

    var postLink = svg.selectAll("path.link.postreq")
        .data(postLinks)
        .enter().insert("path", "g")
          .attr("class", "link")
          .attr("d", postDiagonal);


    // var thisNode = svg.selectAll("#" + conceptID).classed("active", true);

  }

  graph.nodeOnClick = function(theClickFunction) {
    clickFunction = theClickFunction;
    svg.selectAll("g.node")
      .on("click", clickFunction);
  };

  return graph;
}