class StructureNodesController < ApplicationController
  load_and_authorize_resource

  def index
    @root_node = StructureNode.first
  end
end
