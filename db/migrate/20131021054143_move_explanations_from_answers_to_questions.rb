class MoveExplanationsFromAnswersToQuestions < ActiveRecord::Migration
  def change
    remove_column :question_answers, :explanation
    add_column :questions, :explanation, :string
  end
end
