# A quiz represents a single unit of knowledge, the smallest element that can be taught and
# evaluated atomically. Breaking an area of study down to its component quizzes enables a
# subject to be taught in incremental steps.
#
# A quiz belongs to at least one category object, which denotes the topic or category of the
# content. If content is relevant to multiple disciplines, it may belong to multiple categories.
#    - (harmonics) are an element of (physics)
#    - (harmonics) are an element of (music)
#
# Each quiz may have one or more lessons and questions, to teach and evaluate the student
# on the relevant material.
#
# A quiz may depend on one or more other quizzes, and may have one or more other
# quizzes which depend on it. This dependency graph creates a system of prerequisites for
# quizzes.

class Quiz < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, :use => :slugged

	# category association
  has_many :classifications, :inverse_of => :quiz, dependent: :destroy
  has_many :categories, through: :classifications

  # content associations
  has_many :lessons
  has_many :questions
  has_many :interactions, class_name: "QuizInteraction"

  # dependency associations
  has_many :dependencies, foreign_key: "postreq_id"
  has_many :prereqs, through: :dependencies, class_name: "Quiz"

  has_many :post_dependencies, class_name: "Dependency", foreign_key: "prereq_id"
  has_many :postreqs, through: :post_dependencies, class_name: "Quiz"

  belongs_to :creator, :class_name => "User"


  accepts_nested_attributes_for :categories, allow_destroy: false

  # validations
  validates :name,  presence: true, length: { maximum: 50 }
  validates_presence_of :slug, :description, :caption, :creator
  validate :validate_has_category

private
  def validate_has_category
    if categories.size < 1
      errors.add(:categories, "must belong to at least one category")
      return false
    end
  end

end
