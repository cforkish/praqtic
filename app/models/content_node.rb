# A content node represents a single unit of knowledge, the smallest element that can be taught and
# evaluated atomically. Breaking an area of study down to its component content nodes enables a
# subject to be taught in incremental steps.
#
# A content node belongs to at least one structure node, which denotes the topic or category of the
# content. If content is relevant to multiple disciplines, it may belong to multiple categories.
#    - (harmonics) are an element of (physics)
#    - (harmonics) are an element of (music)
#
# Each content node may have one or more lessons and evaluators, to teach and evaluate the student
# on the relevant material.
#
# A content node may depend on one or more other content nodes, and may have one or more other
# content nodes which depend on it. This dependency graph creates a systems of prerequisites for
# content nodes.

class ContentNode < ActiveRecord::Base
	# structure node association
  has_and_belongs_to_many :structure_nodes, join_table: "content_classifications"

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
