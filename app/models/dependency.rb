# A dependency object represents the prerequisite relationship between two concepts.
# See concept.rb for an explanation of that relationship.

class Dependency < ActiveRecord::Base
  belongs_to :prereq, class_name: "Concept"
  belongs_to :postreq, class_name: "Concept"

  validates_presence_of :prereq
  validates_presence_of :postreq
end
