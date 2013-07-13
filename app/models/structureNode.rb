class StructureNode < ActiveRecord::Base
  # parent-child association
  has_and_belongs_to_many :parents, class_name: "StructureNode", foreign_key: "child_id", join_table: "structure_parent_child", association_foreign_key: "parent_id"
  has_and_belongs_to_many :children, class_name: "StructureNode", foreign_key: "parent_id", join_table: "structure_parent_child", association_foreign_key: "child_id"

  # friend associaton
  has_many :node_friendships
  has_many :friend_nodes, :through => :node_friendships
  has_many :inverse_node_friendships, :class_name => "NodeFriendship", :foreign_key => "friend_node_id"
  has_many :inverse_friends_nodes, :through => :inverse_node_friendships, :source => :structureNode

  # content association
  has_and_belongs_to_many :contentNodes, class_name: "ContentNode", foreign_key: "parent_structure_node_id",
    join_table: "structure_content", association_foreign_key: "child_content_node_id"
end