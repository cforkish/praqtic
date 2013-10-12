class Question < ActiveRecord::Base
	belongs_to :quiz
  belongs_to :creator, :class_name => "User"
  belongs_to :lesson

  validates_presence_of :quiz
  validates_presence_of :creator
  validates :question,  presence: true, length: { maximum: 100 }
  validates :answer,  presence: true, length: { maximum: 50 }
  validates :alt1,  presence: true, length: { maximum: 50 }
  validates :alt2,  presence: true, length: { maximum: 50 }
  validates :alt3,  presence: true, length: { maximum: 50 }
  validates :alt4,  presence: true, length: { maximum: 50 }
end
