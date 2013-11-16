class AddCreatorToQuiz < ActiveRecord::Migration
  def change
    add_column :quizzes, :creator_id, :uuid
    add_index :quizzes, :creator_id
  end
end
