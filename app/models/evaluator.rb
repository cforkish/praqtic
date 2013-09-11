class Evaluator < ActiveRecord::Base
	belongs_to :concept
  belongs_to :creator, :class_name => "User"

  validates_presence_of :concept
  validates_presence_of :creator
  validates_presence_of :question
  validates_presence_of :answer
end
