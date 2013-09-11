# A content classification object represents a categorization of a piece of content, forming the
# relationship between a concept and a category object.
# See concept.rb for an explanation of that relationship.

class ContentClassification < ActiveRecord::Base
  belongs_to :concept
  belongs_to :category

  validates_presence_of :concept
  validates_presence_of :category
end
