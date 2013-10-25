class CategoriesController < ApplicationController
  load_and_authorize_resource

  include GraphHelper

  def index
    @root_node = Category.first
  end

  def show
  end

  def new
    @parent = Category.friendly.find(params[:parent])
  end

  def create
    @parent = Category.friendly.find(params[:parent])
    if @parent.nil?
      @parent = Category.first
    end

    @relation = CategoryRelation.new(:parent => @parent, :child => @category)

    # puts 'Cat: ' + @category.name + ' Parent: ' + @parent.name

    if @relation.save && @category.save
      flash[:success] = "Category created!"
      redirect_to category_path(@category)
    else
      render 'new'
    end
  end


  private

    def category_params
      params.require(:category).permit(:name)
    end
end
