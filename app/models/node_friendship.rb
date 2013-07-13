class NodeFriendship < ActiveRecord::Base
  belongs_to :structureNode
  belongs_to :friend_node, :class_name => "structureNode"
end