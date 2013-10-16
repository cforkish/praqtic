class AddQuestionAnswersToLessons < ActiveRecord::Migration
  def change
    create_table :lessons_question_answers, id: :uuid  do |t|
      t.belongs_to :lesson
      t.belongs_to :question_answer
    end
  end
end
