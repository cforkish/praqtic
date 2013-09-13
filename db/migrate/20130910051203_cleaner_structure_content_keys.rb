class CleanerStructureContentKeys < ActiveRecord::Migration
  def change
    change_table :structure_content do |t|
      t.rename :parent_structure_node_id, :structure_node_id
      t.rename :child_content_node_id, :content_node_id
    end
  end
end
