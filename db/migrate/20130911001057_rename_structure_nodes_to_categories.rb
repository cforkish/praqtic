class RenameStructureNodesToCategories < ActiveRecord::Migration
  def change
    rename_table :structure_nodes, :categories

    change_table :structure_friendships do |t|
      t.rename :structure_node_id, :category_id
    end

    change_table :content_classifications do |t|
      t.rename :structure_node_id, :category_id
    end
  end
end
