class Lesson < ActiveRecord::Base
	belongs_to :content_node
  belongs_to :creator, :class_name => "User"

  has_many :interactions, :class_name => "LessonInteraction"
  has_many :users, :through => :interactions

  validates :name,  presence: true, length: { maximum: 50 }
  validates_presence_of :content_node
  validates_presence_of :creator
end
