class Evaluator < ActiveRecord::Base
	belongs_to :content_node
  belongs_to :creator, :class_name => "User"

  validates_presence_of :content_node
  validates_presence_of :creator
end
