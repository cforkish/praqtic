class AddExplanationToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :explanation, :string
    add_column :questions, :lesson_id, :uuid
  end
end
