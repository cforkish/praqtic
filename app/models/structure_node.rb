# A structure node represents a category of knowledge. Through categories, we can represent the
# hierarchical fields of knowledge, and allow the user to browse the tree of knowledge.
#
# Each category may belong to one or more parent categories, and may have one or more subcategories.
#    - when you are learning (spanish conjugation) you are learning (spanish language)
#    - when you are learning (spanish conjugation) you are learning (conjugation)
#    - when you are learning (conjugation) you are learning (grammar)
#
# Categories that are related but do not fit in a parent-child relationship can be linked as friend
# nodes. This relationship indicates that learning content from one category will enrich your
# knowledge of another.
#    - learning (resonance [physics]) enriches knowledge of (harmonic series [music])
#
# Each category may contain one or more content nodes. While most content nodes will be contained by
# category "leaves," it is possible for a category to have subcategories and to also have its own
# content which fits in the category but not in any of its subcategories.

class StructureNode < ActiveRecord::Base
  # parent-child association
  has_many :parent_relations, class_name: "StructureRelation", foreign_key: "child_id"
  has_many :parents, through: :parent_relations, class_name: "StructureNode"

  has_many :child_relations, class_name: "StructureRelation", foreign_key: "parent_id"
  has_many :children, through: :child_relations, class_name: "StructureNode"

  # friend associaton
  has_many :friendships, class_name: "StructureFriendship"
  has_many :friends, through: :friendships
  has_many :inverse_friendships, class_name: "StructureFriendship", foreign_key: "friend_id"
  has_many :inverse_friends, through: :inverse_friendships, source: :structure_node

  # content association
  has_and_belongs_to_many :content_nodes, join_table: "content_classifications"

  validates :name,  presence: true, length: { maximum: 50 }

  # sorting
  default_scope { order(created_at: :asc) }

  def to_node
    { "name" => self.name,
      "children"   => self.children.map { |c| c.to_node } + self.content_nodes.map { |c| c.to_node }
    }
  end

end
