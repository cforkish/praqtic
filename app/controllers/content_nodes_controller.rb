class ContentNodesController < ApplicationController
  load_and_authorize_resource

  def show
  end

  def new
    @category = StructureNode.find(params[:category])
  end

  def create

    category = StructureNode.find(params[:category])
    if category.nil?
      @content_node.structure_nodes << StructureNode.first
    else
      @content_node.structure_nodes << category
    end

    if @content_node.save
      flash[:success] = "Topic added!"
      redirect_to topic_path(@content_node)
    else
      render 'new'
    end
  end



  private

    def content_node_params
      params.require(:content_node).permit(:name)
    end
end
