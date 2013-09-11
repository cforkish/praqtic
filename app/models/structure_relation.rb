# A structure relation object represents the parent-child relationship between two structure nodes.
# See category.rb for an explanation of that relationship.

class StructureRelation < ActiveRecord::Base
  belongs_to :parent, class_name: "Category"
  belongs_to :child, class_name: "Category"

  validates_presence_of :parent
  validates_presence_of :child
end
