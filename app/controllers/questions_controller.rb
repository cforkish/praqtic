class QuestionsController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def show
    @quiz = Quiz.find(params[:quiz_id])
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

    @question.lessons.each do |l|
      l.quiz = @quiz
      l.creator = current_user
      render 'new' unless l.save!
    end

    answers = params[:question][:answers_attributes]
    puts 'DEBUG'
    puts answers
    # params[:answers_attributes].each do |a|
    #   lessonIDs = a[:lesson_ids]
    #   lessonIDs.each { |id|
    #     lesson = Lesson.find(id)
    #     @question.lessons << lesson
    #   }
    # end

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
    @question = Question.find(params[:id])
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
