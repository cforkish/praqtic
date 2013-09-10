class GraphController < ApplicationController
  skip_authorization_check
  def index
    # p1 = { :name => "Damien", :id => "a" }
    # p2 = { :name => "Bob", :id => "b" }
    # nodes = [p1, p2]

    # l1 = { :source => 0, :target => 1, :value => 1 }
    # links = [l1]

    # data = { :nodes => nodes, :links =>links }
    # @mydata = data.to_json

    nodes = Array.new
    links = Array.new
    root = StructureNode.first
    nodes << { :name => root.name, :id => root.id }
    createNodes(nodes, links, root, 0)
    data = { :nodes => nodes, :links => links }
    @mydata = data.to_json



  end

  def createNodes(nodes, links, snode, parentIndex)
    curIndex = nodes.size
    nodes << { :name => snode.name, :id => snode.id }

    if curIndex > 0 
      links << { :source => parentIndex, :target => curIndex, :value => 1 }
    end

    snode.children.each do |child|
      createNodes(nodes, links, child, curIndex)
    end
    
  end

  def tree
    @mydata = StructureNode.first.to_node.to_json
  end


  def browse
  end

  def add
  end

  def edit
  end
end