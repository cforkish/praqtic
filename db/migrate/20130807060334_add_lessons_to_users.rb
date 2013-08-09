class AddLessonsToUsers < ActiveRecord::Migration
  def change
    add_column :lessons, :creator_id, :uuid
    add_index :lessons, :creator_id
  end
end
