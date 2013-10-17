class AddQuestionAnswersToLessons < ActiveRecord::Migration
  def change
    create_table :lessons_question_answers, id: :uuid  do |t|
      t.uuid :lesson_id
      t.uuid :question_answer_id
    end
  end
end
