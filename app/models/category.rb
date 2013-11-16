# A category object represents a named collection of related quizzes. Through categories, we can
# represent hierarchical fields of knowledge, and allow the user to browse the tree of knowledge.
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
# Each category may contain one or more quizzes. While most quizzes will be contained by
# category "leaves," it is possible for a category to have subcategories and to also have its own
# content which fits in the category but not in any of its subcategories.

class Category < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, :use => :slugged

  # parent-child association
  has_many :parent_relations, class_name: "CategoryRelation", foreign_key: "child_id"
  has_many :parents, through: :parent_relations, class_name: "Category"

  has_many :child_relations, class_name: "CategoryRelation", foreign_key: "parent_id"
  has_many :children, through: :child_relations, class_name: "Category"

  # friend associaton
  has_many :friendships, class_name: "CategoryFriendship"
  has_many :friends, through: :friendships
  has_many :inverse_friendships, class_name: "CategoryFriendship", foreign_key: "friend_id"
  has_many :inverse_friends, through: :inverse_friendships, source: :category

  # content association
  has_many :classifications, :inverse_of => :category, dependent: :destroy
  has_many :quizzes, through: :classifications
  has_many :lessons, :through => :quizzes

  belongs_to :creator, :class_name => "User"

  # validations
  validates :name,  presence: true, length: { maximum: 50 }
  validates_presence_of :slug, :creator

  # sorting
  default_scope { order(created_at: :asc) }

  # before_validation :logBV
  # after_validation :logAV
  # before_save :logBS
  # after_save :logAS
  # before_create :logBC
  # after_create :logAC
  # after_commit :logACommit
  # after_rollback :logAR
  # after_touch :logAT


  def logBV
    logger.error "cat BEFORE VALIDATION"
  end
  def logAV
    logger.error "cat AFTER VALIDATION"
  end
  def logBS
    logger.error "cat BEFORE SAVE"
  end
  def logAS
    logger.error "cat AFTER SAVE"
  end
  def logBC
    logger.error "cat BEFORE CREATE"
  end
  def logAC
    logger.error "cat AFTER CREATE"
  end
  def logACommit
    logger.error "cat AFTER COMMIT"
  end
  def logAR
    logger.error "cat AFTER ROLLBACK"
  end
  def logAT
    logger.error "cat AFTER TOUCH"
  end

end
