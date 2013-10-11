class LessonsController < ApplicationController
  load_and_authorize_resource

  def show
  end

  def new
    @lesson.quiz = Quiz.find(params[:node])
    @lesson.creator = current_user
  end

  def create
    if @lesson.save
      flash[:success] = "Lesson created!"
      redirect_to @lesson
    else
      render 'new'
    end
  end



  private

    def lesson_params
      params.require(:lesson).permit(:name, :link)
    end
end
