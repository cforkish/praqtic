# A CategoryRelation represents the parent-child relationship between two categories.
# See category.rb for an explanation of that relationship.

class CategoryRelation < ActiveRecord::Base
  belongs_to :parent, class_name: "Category"
  belongs_to :child, class_name: "Category"

  validates_presence_of :parent
  validates_presence_of :child
end
