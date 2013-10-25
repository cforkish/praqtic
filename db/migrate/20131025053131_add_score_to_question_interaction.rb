class AddScoreToQuestionInteraction < ActiveRecord::Migration
  def change
    add_column :question_interactions, :score, :float
  end
end
