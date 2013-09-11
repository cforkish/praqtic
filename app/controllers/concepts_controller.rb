class ConceptsController < ApplicationController
  load_and_authorize_resource

  def show
  end

  def new
    @category = Category.find(params[:category])
  end

  def create

    category = Category.find(params[:category])
    if category.nil?
      @concept.categories << Category.first
    else
      @concept.categories << category
    end

    if @concept.save
      flash[:success] = "Topic added!"
      redirect_to topic_path(@concept)
    else
      render 'new'
    end
  end



  private

    def concept_params
      params.require(:concept).permit(:name)
    end
end
