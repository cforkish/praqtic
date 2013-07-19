class Evaluator < ActiveRecord::Base
	belongs_to :content_node

  validates_presence_of :content_node
end
