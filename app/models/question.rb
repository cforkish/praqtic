class Question < ActiveRecord::Base
  has_many :answers, :class_name => "QuestionAnswer", :inverse_of => :question, dependent: :destroy

	belongs_to :quiz
  belongs_to :creator, :class_name => "User"
  has_and_belongs_to_many :lessons

  accepts_nested_attributes_for :answers, allow_destroy: true

  validates_presence_of :quiz
  validates_presence_of :creator
  validates_presence_of :question
  validate :must_have_correct_answer

private
  def must_have_correct_answer
      if answers.size < 2
        errors.add(:Answer, "You must provide at least one correct and one incorrect answer.")
        return false
      elsif
        correct = answers.select {|a| a.is_correct? }
        errors.add(:Answer, "You must provide at least one correct answer.") unless correct.size > 0
        errors.add(:Answer, "You can only provide one correct answer.") if correct.size > 1
        return false
      else
        return true
      end
  end
end
