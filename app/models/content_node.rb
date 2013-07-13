class ContentNode < ActiveRecord::Base
	# structure node association
  has_and_belongs_to_many :structureNodes, class_name: "StructureNode", foreign_key: "child_content_node_id", 
  	join_table: "structure_content", association_foreign_key: "parent_structure_node_id"

  # content associations
  has_many :lessons
  has_many :evaluators

  # dependency associations
  has_and_belongs_to_many :needs, class_name: "ContentNode", foreign_key: "enable_id", join_table: "dependency", association_foreign_key: "need_id"
  has_and_belongs_to_many :enables, class_name: "ContentNode", foreign_key: "need_id", join_table: "dependency", association_foreign_key: "enable_id"
  
  validates :name,  presence: true, length: { maximum: 50 }
end