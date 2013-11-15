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

end
