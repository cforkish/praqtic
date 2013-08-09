class EvaluatorsController < ApplicationController
  load_and_authorize_resource

  def index
    @root_node = StructureNode.first
  end

  def show
  end

  def new
    @structure_node.parents << StructureNode.find(params[:parent])
  end

  def create
    if @structure_node.parents.size == 0
      @structure_node.parents << StructureNode.first
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
