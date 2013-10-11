class RenameEvaluatorsToQuestions < ActiveRecord::Migration
  def change
    rename_table :evaluators, :questions
  end
end
