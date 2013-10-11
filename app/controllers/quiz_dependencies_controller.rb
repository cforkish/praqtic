class QuizDependenciesController < ApplicationController
  skip_authorization_check #todo: i have no idea how authorization works, we need to chat. -cf

  include GraphHelper

  def new
    @jsonNodes = category_to_node(Category.first).to_json

    quiz = Quiz.find(params[:quiz_id])

    current_uri = request.fullpath

    if (current_uri.index('prereq'))
      @dependency = quiz.dependencies.build
    else
      @dependency = quiz.post_dependencies.build
    end
  end

  def create
    quiz = Quiz.find(params[:quiz_id])

    current_uri = request.fullpath
    if (current_uri.index('prereq'))
      prereq = Quiz.find(params[:dependency][:prereq])
      postreq = quiz
    else
      prereq = quiz
      postreq = Quiz.find(params[:dependency][:postreq])
    end

    @dependency = Dependency.new(:prereq => prereq, :postreq => postreq)

    if (@dependency.save)
      flash[:success] = "Dependency created!"
      redirect_to quiz
    else
      render 'new'
    end
  end
end
