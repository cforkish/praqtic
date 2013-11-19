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
    @quiz.creator = current_user

    @quiz.classifications.each do |c|
      if c.category.name && c.category.name.length > 0
        c.creator = current_user
        c.category.creator = current_user if c.category.new_record?
      else
        @quiz.categories.delete(c.category)
        @quiz.classifications.delete(c)
      end
    end

    if @quiz.save
      flash[:success] = "Quiz created!"
      redirect_to quiz_path(@quiz)
    else
      render 'new'
    end

  end

  # Do quiz
  def do
    if params.has_key?(:question)
      @question = @quiz.questions.friendly.find(params[:question])
      @quizInteraction = @quiz.interactions.find(params[:quiz_interaction])
    else
      @quizInteraction = @quiz.interactions.build(user: current_user)
      @quizInteraction.save!
      @question = @quiz.questions.first
    end
  end

  def submit_question
    @question = @quiz.questions.friendly.find(params[:question])
    @answer = @question.answers.find(params[:answer_id])
    @quizInteraction = @quiz.interactions.find(params[:quiz_interaction])

    score = 1
    if @answer.is_correct
      flash[:success] = "Correct!"
    else
      flash[:danger] = "Incorrect"
      score = 0
    end

    interaction = @question.interactions.build(:user => current_user,
                    :quiz_interaction => @quizInteraction, :score => score)
    interaction.save!
    @quizInteraction.save!

    trackedQuestion = @question.user_tracked_questions.find_by(:user => current_user)
    if (trackedQuestion)
      trackedQuestion.touch
    else
      @question.tracking_users << current_user
    end

    @question = @question.next
    if @question == Question.first
      redirect_to report_quiz_path(@quiz, :quiz_interaction => @quizInteraction.id)
    else
      redirect_to do_quiz_path(@quiz, :question => @question.friendly_id, :quiz_interaction => @quizInteraction.id)
    end
  end

  def report
    @quizInteraction = @quiz.interactions.find(params[:quiz_interaction])
  end



  private

    def quiz_params
      params.require(:quiz).permit(:name, :caption, :description, :is_private,
                categories_attributes: [ :name ],
                category_ids: [] )
    end

end
