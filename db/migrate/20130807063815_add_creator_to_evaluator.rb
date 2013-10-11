class AddCreatorToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :creator_id, :uuid
    add_index :questions, :creator_id
  end
end
