class AddDescriptionAndCaptionToQuiz < ActiveRecord::Migration
  def change
    add_column :quizzes, :description, :string
    add_column :quizzes, :caption, :string
  end
end
