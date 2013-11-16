class AddQuizInteractionToQuestionInteractions < ActiveRecord::Migration
  def change
    add_column :question_interactions, :quiz_interaction_id, :uuid
  end
end
