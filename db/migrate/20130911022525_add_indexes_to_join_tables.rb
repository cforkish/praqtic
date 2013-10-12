class AddIndexesToJoinTables < ActiveRecord::Migration
  def change
    add_index :category_friendships, :category_id
    add_index :category_friendships, :friend_id
    add_index :category_friendships, [:category_id, :friend_id], unique: true

    add_index :category_relations, :parent_id
    add_index :category_relations, :child_id
    add_index :category_relations, [:parent_id, :child_id], unique: true

    add_index :classifications, :category_id
    add_index :classifications, :concept_id
    add_index :classifications, [:category_id, :concept_id], unique: true

    add_index :dependencies, :prereq_id
    add_index :dependencies, :postreq_id
    add_index :dependencies, [:prereq_id, :postreq_id], unique: true
  end
end
