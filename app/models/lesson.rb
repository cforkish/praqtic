class Lesson < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, :use => :slugged

	belongs_to :quiz
  belongs_to :creator, :class_name => "User"

  has_many :interactions, :class_name => "LessonInteraction"
  has_many :users, :through => :interactions
  has_and_belongs_to_many :questions
  has_many :quizzes, :through => :questions

  validates :name,  presence: true, length: { maximum: 50 }
  validates_presence_of :quiz
  validates_presence_of :creator
  validates_presence_of :link
  validates_presence_of :slug
end
