class CreateQuizInteractions < ActiveRecord::Migration
  def change
    create_table :quiz_interactions, id: :uuid  do |t|
      t.uuid :question_id
      t.uuid :user_id

      t.timestamps
    end
  end
end
