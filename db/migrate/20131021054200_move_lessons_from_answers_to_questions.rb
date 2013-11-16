class MoveLessonsFromAnswersToQuestions < ActiveRecord::Migration
  def change
    drop_table :lessons_question_answers

    create_table :lessons_questions, id: :uuid  do |t|
      t.uuid :lesson_id
      t.uuid :question_id
    end
  end
end
