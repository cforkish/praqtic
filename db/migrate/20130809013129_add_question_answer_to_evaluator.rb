class AddQuestionAnswerToEvaluator < ActiveRecord::Migration
  def change
    add_column :evaluators, :question, :string
    add_column :evaluators, :answer, :string
  end
end
