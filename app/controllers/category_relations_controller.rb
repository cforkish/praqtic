class CategoryRelationsController < ApplicationController
  skip_authorization_check #todo: i have no idea how authorization works, we need to chat. -cf

  include GraphHelper

  def new
    @jsonNodes = category_to_node(Category.first).to_json

    category = Category.find(params[:category_id])
    @relation = category.parent_relations.build
  end

  def create
    category = Category.find(params[:category_id])
    parent = Category.find(params[:category_relation][:parent])
    @relation = CategoryRelation.new(:child => category, :parent => parent)

    if (@relation.save)
      flash[:success] = "Relation created!"
      redirect_to category
    else
      render 'new'
    end
  end


  private

    def category_relation_params
      params.require(:category_relation).permit(:parent, :child)
    end
end
