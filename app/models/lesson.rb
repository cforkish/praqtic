class Lesson < ActiveRecord::Base
	belongs_to :quiz
  belongs_to :creator, :class_name => "User"

  has_many :interactions, :class_name => "LessonInteraction"
  has_many :users, :through => :interactions
  has_and_belongs_to_many :questions

  validates :name,  presence: true, length: { maximum: 50 }
  validates_presence_of :quiz
  validates_presence_of :creator
  validates_presence_of :link
end
