class CreateLessons < ActiveRecord::Migration
  def change
    enable_extension "uuid-ossp"

    create_table :lessons, id: :uuid do |t|
      t.string :name
      t.uuid :content_node_id

      t.timestamps
    end
  end
end
