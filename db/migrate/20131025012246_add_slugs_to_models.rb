class AddSlugsToModels < ActiveRecord::Migration
  def change
    add_column :categories, :slug, :string
    add_index :categories, :slug, unique: true

    add_column :lessons, :slug, :string
    add_index :lessons, :slug, unique: true

    add_column :questions, :slug, :string
    add_index :questions, :slug, unique: true

    add_column :question_answers, :slug, :string
    add_index :question_answers, :slug, unique: true

    add_column :quizzes, :slug, :string
    add_index :quizzes, :slug, unique: true
  end
end
