# A structure friendship object represents the friendship relationship between two structure nodes.
# See structure_node.rb for an explanation of that relationship.

class StructureFriendship < ActiveRecord::Base
  belongs_to :structure_node
  belongs_to :friend, :class_name => "StructureNode"

  validates_presence_of :structure_node
  validates_presence_of :friend
end
