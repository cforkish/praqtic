class CreateStructureNodes < ActiveRecord::Migration
  def change
    enable_extension "uuid-ossp"

    create_table :structure_nodes, id: :uuid  do |t|
      t.string :name

      t.timestamps
    end

    create_table :structure_parent_child, id: :uuid do |t|
      t.uuid :parent_id
      t.uuid :child_id

      t.timestamps
    end

    create_table :structure_content, id: :uuid do |t|
      t.uuid :parent_structure_node_id
      t.uuid :child_content_node_id

      t.timestamps
    end

  end
end
