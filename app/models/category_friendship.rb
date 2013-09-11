# A structure friendship object represents the friendship relationship between two structure nodes.
# See category.rb for an explanation of that relationship.

class CategoryFriendship < ActiveRecord::Base
  belongs_to :category
  belongs_to :friend, :class_name => "Category"

  validates_presence_of :category
  validates_presence_of :friend
end
