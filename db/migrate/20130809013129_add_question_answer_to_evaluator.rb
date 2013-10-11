class AddEvaluatorAnswerToEvaluator < ActiveRecord::Migration
  def change
    add_column :evaluators, :evaluator, :string
    add_column :evaluators, :answer, :string
  end
end
