class FixQuizInteractionColumnName < ActiveRecord::Migration
  def change
    rename_column :quiz_interactions, :question_id, :quiz_id
  end
end
