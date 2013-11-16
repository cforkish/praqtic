# A dependency object represents the prerequisite relationship between two quizzes.
# See quiz.rb for an explanation of that relationship.

class Dependency < ActiveRecord::Base
  belongs_to :prereq, class_name: "Quiz"
  belongs_to :postreq, class_name: "Quiz"

  validates_presence_of :prereq
  validates_presence_of :postreq
end
