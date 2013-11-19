class PagesController < ApplicationController
  skip_authorization_check

  def home
    if signed_in?
      @user = current_user
      @feedQuestions = @user.tracked_questions
      render 'dash'
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
