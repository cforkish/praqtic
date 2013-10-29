class QuizzesController < ApplicationController
  load_resource :find_by => :slug
  authorize_resource

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

  def do
    if params.has_key?(:question)
      @question = @quiz.questions.friendly.find(params[:question])
    else
      @question = @quiz.questions.first
    end
  end

  def submit_question
    @question = @quiz.questions.friendly.find(params[:question])
    @answer = @question.answers.find(params[:answer_id])

    score = 1
    if @answer.is_correct
      flash[:success] = "Correct!"
    else
      flash[:danger] = "Incorrect"
      score = 0
    end

    interaction = @question.interactions.build(:user => current_user, :score => score)
    interaction.save!

    @question = @question.next
    redirect_to do_quiz_path(@quiz, :question => @question.friendly_id)
  end



  private

    def quiz_params
      params.require(:quiz).permit(:name)
    end
end
