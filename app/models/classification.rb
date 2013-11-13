# A content classification object represents a categorization of a piece of content, forming the
# relationship between a quiz and a category object.
# See quiz.rb for an explanation of that relationship.

class Classification < ActiveRecord::Base
  belongs_to :quiz, :inverse_of => :classifications
  belongs_to :category, :inverse_of => :classifications

  accepts_nested_attributes_for :category, allow_destroy: false
  accepts_nested_attributes_for :quiz, allow_destroy: false

  validates_presence_of :quiz
  validates_presence_of :category
end
