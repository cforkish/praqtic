class Lesson < ActiveRecord::Base
	belongs_to :contentNode
  
  validates :name,  presence: true, length: { maximum: 50 }
end
