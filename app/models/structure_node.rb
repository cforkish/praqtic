class StructureNode < ActiveRecord::Base
  # parent-child association
  has_and_belongs_to_many :parents, class_name: "StructureNode", foreign_key: "child_id", join_table: "structure_parent_child", association_foreign_key: "parent_id"
  has_and_belongs_to_many :children, class_name: "StructureNode", foreign_key: "parent_id", join_table: "structure_parent_child", association_foreign_key: "child_id"

  # friend associaton
  has_many :node_friendships
  has_many :friends, :through => :node_friendships
  has_many :inverse_node_friendships, :class_name => "NodeFriendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_node_friendships, :source => :structure_node

  # content association
  has_and_belongs_to_many :content_nodes, class_name: "ContentNode", foreign_key: "parent_structure_node_id",
    join_table: "structure_content", association_foreign_key: "child_content_node_id"

  validates :name,  presence: true, length: { maximum: 50 }

  # sorting
  default_scope { order(created_at: :asc) }

  def to_node
    { "name" => self.name,
      "url" => "/categories/" + self.id, #todo: how do i use category_path(self.id) here?
      "children"   => self.children.map { |c| c.to_node } + self.content_nodes.map { |c| c.to_node }
    }
  end

end
