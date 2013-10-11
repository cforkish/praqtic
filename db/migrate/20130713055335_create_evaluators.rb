class CreateQuestions < ActiveRecord::Migration
  def change
    enable_extension "uuid-ossp"

    create_table :questions, id: :uuid do |t|
      t.uuid :content_node_id

      t.timestamps
    end
  end
end
