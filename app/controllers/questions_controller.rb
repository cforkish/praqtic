class QuestionsController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def show
  end

  def new
    @quiz = Quiz.find(params[:quiz_id])
    @question = @quiz.questions.build
    @question.answers.build
    @question.answers.build
    @question.creator = current_user
  end

  def create
    @quiz = Quiz.find(params[:quiz_id])
    @question = @quiz.questions.build(params[:question])
    @question.creator = current_user

    if @question.save
      flash[:success] = "Question created!"
      redirect_to quiz_path(@quiz)
    else
      render 'new'
    end
  end

  private

    def question_params
      params.require(:question).permit(:question, :answer, :alt1, :alt2, :alt3, :alt4)
    end
end
