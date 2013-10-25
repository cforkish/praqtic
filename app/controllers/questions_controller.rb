class QuestionsController < ApplicationController
  load_resource :find_by => :slug
  authorize_resource

  def index
  end

  def show
    @quiz = Quiz.friendly.find(params[:quiz_id])
  end

  def new
    @quiz = Quiz.friendly.find(params[:quiz_id])
    @question = @quiz.questions.build
    @question.answers.build
    @question.answers.build
    @question.creator = current_user
  end

  def create
    @quiz = Quiz.friendly.find(params[:quiz_id])
    @question = @quiz.questions.build(params[:question])
    @question.creator = current_user

    @question.lessons.each do |l|
      l.quiz = @quiz
      l.creator = current_user
      render 'new' unless l.save!
    end

    if @question.save
      flash[:success] = "Question created!"
      redirect_to quiz_path(@quiz)
    else
      render 'new'
    end
  end

  def update
  end

  def destroy
    @question.destroy
    flash[:success] = "Question removed."
    redirect_to quiz_path(params[:quiz_id])
  end

  private

    def question_params
      params.require(:question).permit(:question,
                                        answers_attributes: [ :answer, :is_correct ],
                                        lessons_attributes: [ :name, :link ],
                                        :lesson_ids => [])
    end
end
