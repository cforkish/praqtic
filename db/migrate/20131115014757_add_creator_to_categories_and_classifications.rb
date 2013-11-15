class AddCreatorToCategoriesAndClassifications < ActiveRecord::Migration
  def change
    add_column :categories, :creator_id, :uuid
    add_index :categories, :creator_id

    add_column :classifications, :creator_id, :uuid
    add_index :classifications, :creator_id
  end
end
