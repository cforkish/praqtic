# A content classification object represents a categorization of a piece of content, forming the
# relationship between a quiz and a category object.
# See quiz.rb for an explanation of that relationship.

class Classification < ActiveRecord::Base
  belongs_to :quiz, :inverse_of => :classifications
  belongs_to :category, :inverse_of => :classifications
  belongs_to :creator, :class_name => "User"

  validates_presence_of :quiz, :category, :creator


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
    logger.error "class BEFORE VALIDATION"
  end
  def logAV
    logger.error "class AFTER VALIDATION"
  end
  def logBS
    logger.error "class BEFORE SAVE"
  end
  def logAS
    logger.error "class AFTER SAVE"
  end
  def logBC
    logger.error "class BEFORE CREATE"
  end
  def logAC
    logger.error "class AFTER CREATE"
  end
  def logACommit
    logger.error "class AFTER COMMIT"
  end
  def logAR
    logger.error "class AFTER ROLLBACK"
  end
  def logAT
    logger.error "class AFTER TOUCH"
  end
end
