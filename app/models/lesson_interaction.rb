class LessonInteraction < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :user

  validates_presence_of :lesson
  validates_presence_of :user
end
