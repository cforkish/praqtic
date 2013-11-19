class RenameQuizPrivateToQuizIsPrivate < ActiveRecord::Migration
  def change
    rename_column :quizzes, :private, :is_private
  end
end
