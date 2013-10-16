class RemoveAnswersFromQuestions < ActiveRecord::Migration
  def change
    remove_column :questions, :alt1
    remove_column :questions, :alt2
    remove_column :questions, :alt3
    remove_column :questions, :alt4
    remove_column :questions, :answer
    remove_column :questions, :explanation
    remove_column :questions, :lesson_id
  end
end
