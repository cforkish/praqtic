class AdminController < ApplicationController
  skip_authorization_check

  def index
    @categories = Category.all
    @quizzes = Quiz.all
    @lessons = Lesson.all
  end

  def quizzes
  end

  def lessons
  end

  def categories
  end

  def quiz
    @quiz = Quiz.friendly.find(params[:id])
  end

  def lesson
    @lesson = Lesson.friendly.find(params[:id])
  end

  def category
    @category = Category.friendly.find(params[:id])
  end

  def destroy
    @klass = params[:klass]
    case @klass
    when "quiz"
      @object = Quiz.friendly.find(params[:id])
      @object.destroy
    when "tag"
      @object = Category.friendly.find(params[:id])
      @object.destroy
    when "source"
      @object = Lesson.friendly.find(params[:id])
      @object.destroy
    end

    flash[:success] = @klass.capitalize + ' deleted.'

    respond_to do |format|
      format.html { redirect_to admin_path }
      format.js
    end
  end

end
