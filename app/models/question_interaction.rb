class QuestionInteraction < ActiveRecord::Base
  belongs_to :question
  belongs_to :user

  validates_presence_of :question
  validates_presence_of :user
end
