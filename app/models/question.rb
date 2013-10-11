class Question < ActiveRecord::Base
	belongs_to :quiz
  belongs_to :creator, :class_name => "User"

  validates_presence_of :quiz
  validates_presence_of :creator
  validates_presence_of :question
  validates_presence_of :answer
end
