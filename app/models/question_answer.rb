class QuestionAnswer < ActiveRecord::Base
  belongs_to :question, :inverse_of => :question_answers, :inverse_of => :answers
  has_and_belongs_to_many :lessons

  validates_presence_of :question
end
