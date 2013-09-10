# A structure relation object represents the parent-child relationship between two structure nodes.
# See structure_node.rb for an explanation of that relationship.

class StructureRelation < ActiveRecord::Base
  belongs_to :parent, class_name: "StructureNode"
  belongs_to :child, class_name: "StructureNode"

  validates_presence_of :parent
  validates_presence_of :child
end
