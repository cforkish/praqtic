class NodeFriendship < ActiveRecord::Base
  belongs_to :structure_node
  belongs_to :friend, :class_name => "StructureNode"

  validates_presence_of :structure_node
  validates_presence_of :friend
end