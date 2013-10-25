class QuestionAnswer < ActiveRecord::Base
  belongs_to :question, :inverse_of => :answers

  validates_presence_of :question
  validates_presence_of :number
end
