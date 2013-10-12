class AddAlternativesToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :alt1, :string
    add_column :questions, :alt2, :string
    add_column :questions, :alt3, :string
    add_column :questions, :alt4, :string
  end
end
