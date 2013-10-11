class AddQuestionAnswerToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :question, :string
    add_column :questions, :answer, :string
  end
end
