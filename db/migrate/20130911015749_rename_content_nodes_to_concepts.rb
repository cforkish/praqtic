class RenameContentNodesToConcepts < ActiveRecord::Migration
  def change
    rename_table :content_nodes, :concepts

    change_table :content_classifications do |t|
      t.rename :content_node_id, :concept_id
    end

    change_table :evaluators do |t|
      t.rename :content_node_id, :concept_id
    end

    change_table :lessons do |t|
      t.rename :content_node_id, :concept_id
    end
  end
end
