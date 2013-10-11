class QuizesController < ApplicationController
  load_and_authorize_resource

  include GraphHelper

  def index
    @jsonNodes = category_to_node(Category.first).to_json
  end

  def show
    @prereqs = quiz_prereq_graph(@quiz).to_json
    @postreqs = quiz_postreq_graph(@quiz).to_json
  end

  def new
    @category = Category.find(params[:category])
  end

  def create

    @category = Category.find(params[:category])
    if @category.nil?
      @category = Category.first
    end

    classification = Classification.new(:quiz => @quiz, :category => @category)

    if classification.save && @quiz.save
      flash[:success] = "Quiz added!"
      redirect_to @quiz
    else
      render 'new'
    end
  end



  private

    def quiz_params
      params.require(:quiz).permit(:name)
    end
end
