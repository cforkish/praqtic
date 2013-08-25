class StructureNodesController < ApplicationController
  load_and_authorize_resource

  def index
    @root_node = StructureNode.first
  end

  def show
  end

  def new
    @parent = StructureNode.find(params[:parent])
  end

  def create
    parent = StructureNode.find(params[:parent])
    if parent.nil?
      @structure_node.parents << StructureNode.first
    else
      @structure_node.parents << parent
    end
    
    if @structure_node.save
      flash[:success] = "Category created!"
      redirect_to category_path(@structure_node)
    else
      render 'new'
    end
  end



  private

    def structure_node_params
      params.require(:structure_node).permit(:name)
    end
end
