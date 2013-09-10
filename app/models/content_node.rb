class ContentNode < ActiveRecord::Base
	# structure node association
  has_and_belongs_to_many :structure_nodes, class_name: "StructureNode", foreign_key: "child_content_node_id",
    join_table: "structure_content", association_foreign_key: "parent_structure_node_id"

  # content associations
  has_many :lessons
  has_many :evaluators

  # dependency associations
  has_and_belongs_to_many :needs, class_name: "ContentNode", foreign_key: "enable_id", join_table: "dependencies", association_foreign_key: "need_id"
  has_and_belongs_to_many :enables, class_name: "ContentNode", foreign_key: "need_id", join_table: "dependencies", association_foreign_key: "enable_id"

  validates :name,  presence: true, length: { maximum: 50 }

  after_save :validate_has_structure_node

  def to_node
  { "name" => self.name,
    "size"   => self.lessons.size + self.evaluators.size
  }
  end

private
  def validate_has_structure_node
    if structure_nodes.count < 1
      errors.add(:structure_nodes, "must belong to at least one structure node")
      return false
    end
  end

end
