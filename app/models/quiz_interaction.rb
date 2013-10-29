class QuizInteraction < ActiveRecord::Base
  belongs_to :user
  belongs_to :quiz
  belongs_to :quiz_interaction
  has_many :question_interactions

  validates_presence_of :user, :quiz

  def num_correct
    correct = question_interactions.select {|i| i.score == 1 }
    return correct.size
  end
end
