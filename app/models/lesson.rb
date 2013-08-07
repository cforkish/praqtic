class Lesson < ActiveRecord::Base
	belongs_to :content_node

  validates :name,  presence: true, length: { maximum: 50 }
  validates_presence_of :content_node
end
