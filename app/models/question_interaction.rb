class QuestionInteraction < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  belongs_to :quiz_interaction

  validates_presence_of :question
  validates_presence_of :user
  # validates_presence_of :quiz_interaction
end
