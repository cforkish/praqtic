class Lesson < ActiveRecord::Base
	belongs_to :concept
  belongs_to :creator, :class_name => "User"

  has_many :interactions, :class_name => "LessonInteraction"
  has_many :users, :through => :interactions

  validates :name,  presence: true, length: { maximum: 50 }
  validates_presence_of :concept
  validates_presence_of :creator
  validates_presence_of :link
end
