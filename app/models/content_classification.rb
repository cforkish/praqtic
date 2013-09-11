# A content classification object represents a categorization of a piece of content, forming the
# relationship between a content node and a category object.
# See content_node.rb for an explanation of that relationship.

class ContentClassification < ActiveRecord::Base
  belongs_to :content_node
  belongs_to :category

  validates_presence_of :content_node
  validates_presence_of :category
end
