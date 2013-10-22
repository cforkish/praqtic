class LessonsController < ApplicationController
  load_and_authorize_resource

  def show
  end

  def new
    @quiz = Quiz.find(params[:quiz_id])
    @lesson = @quiz.lessons.build
    @lesson.creator = current_user
  end

  def create
    @quiz = Quiz.find(params[:quiz_id])
    @lesson = @quiz.lessons.build(params[:lesson])
    @lesson.creator = current_user

    if @lesson.save
      flash[:success] = "Reference created!"
      redirect_to quiz_path(@quiz)
    else
      render 'new'
    end
  end

  private

    def lesson_params
      params.require(:lesson).permit(:name, :link)
    end
end
