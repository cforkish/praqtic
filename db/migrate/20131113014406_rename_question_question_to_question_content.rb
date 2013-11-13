class RenameQuestionQuestionToQuestionContent < ActiveRecord::Migration
  def change
    rename_column :questions, :question, :content
  end
end
