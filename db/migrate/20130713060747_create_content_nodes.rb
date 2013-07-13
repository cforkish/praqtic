class CreateContentNodes < ActiveRecord::Migration
  def change
    create_table :content_nodes do |t|
      t.string :name

      t.timestamps
    end
  end
end
