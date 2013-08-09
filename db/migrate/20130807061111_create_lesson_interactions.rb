class CreateLessonInteractions < ActiveRecord::Migration
  def change
    enable_extension "uuid-ossp"

    create_table :lesson_interactions, id: :uuid do |t|
      t.uuid :lesson_id
      t.uuid :user_id

      t.timestamps
    end
  end
end
