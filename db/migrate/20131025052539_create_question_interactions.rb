class CreateQuestionInteractions < ActiveRecord::Migration
  def change
    create_table :question_interactions, id: :uuid do |t|
      t.uuid :question_id
      t.uuid :user_id

      t.timestamps
    end
  end
end
