# A dependency object represents the prerequisite relationship between two content nodes.
# See content_node.rb for an explanation of that relationship.

class Dependency < ActiveRecord::Base
  belongs_to :prereq, class_name: "ContentNode"
  belongs_to :postreq, class_name: "ContentNode"

  validates_presence_of :prereq
  validates_presence_of :postreq
end
