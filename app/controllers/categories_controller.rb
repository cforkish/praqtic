class CategoriesController < ApplicationController
  load_and_authorize_resource

  def index
    @root_node = Category.first
  end

  def show
  end

  def new
    @parent = Category.find(params[:parent])
  end

  def create
    parent = Category.find(params[:parent])
    if parent.nil?
      @category.parents << Category.first
    else
      @category.parents << parent
    end

    if @category.save
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
