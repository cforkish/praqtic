class CreateQuestionAnswers < ActiveRecord::Migration
  def change
    create_table :question_answers, id: :uuid do |t|
      t.uuid :question_id
      t.string :answer
      t.string :explanation
      t.boolean :is_correct, default: false
      t.timestamps
    end
  end
end
