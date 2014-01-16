class FeedController < ApplicationController
  skip_authorization_check

  def submit_answer
    @question = Question.friendly.find(params[:question])
    @answer = @question.answers.find(params[:answer_id])
    # @quizInteraction = @quiz.interactions.find(params[:quiz_interaction])

    score = 1
    if @answer.is_correct
      flash[:success] = "Correct!"
    else
      flash[:danger] = "Incorrect"
      score = 0
    end

    interaction = @question.interactions.build(:user => current_user, :score => score)
    interaction.save!

    respond_to do |format|
      format.js
    end
  end
end
