# A concept represents a single unit of knowledge, the smallest element that can be taught and
# evaluated atomically. Breaking an area of study down to its component concepts enables a
# subject to be taught in incremental steps.
#
# A concept belongs to at least one category object, which denotes the topic or category of the
# content. If content is relevant to multiple disciplines, it may belong to multiple categories.
#    - (harmonics) are an element of (physics)
#    - (harmonics) are an element of (music)
#
# Each concept may have one or more lessons and evaluators, to teach and evaluate the student
# on the relevant material.
#
# A concept may depend on one or more other concepts, and may have one or more other
# concepts which depend on it. This dependency graph creates a system of prerequisites for
# concepts.

class Concept < ActiveRecord::Base
	# category association
  has_many :classifications
  has_many :categories, through: :classifications

  # content associations
  has_many :lessons
  has_many :evaluators

  # dependency associations
  has_many :dependencies, foreign_key: "postreq_id"
  has_many :prereqs, through: :dependencies, class_name: "Concept"

  has_many :post_dependencies, class_name: "Dependency", foreign_key: "prereq_id"
  has_many :postreqs, through: :post_dependencies, class_name: "Concept"

  # validations
  validates :name,  presence: true, length: { maximum: 50 }

  after_save :validate_has_category

  def to_node
  { "name" => self.name,
    "size"   => self.lessons.size + self.evaluators.size
  }
  end

private
  def validate_has_category
    if categories.count < 1
      errors.add(:categories, "must belong to at least one category")
      return false
    end
  end

end
