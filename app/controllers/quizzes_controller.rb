class QuizzesController < ApplicationController
  load_and_authorize_resource

  include GraphHelper

  def index
    @quizzes = Quiz.all;
  end

  def show
  end

  def new
  end

  def create
    if @quiz.save
      flash[:success] = "Quiz created!"
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
