class RenameStructureRelationsTable < ActiveRecord::Migration
  def change
    rename_table :structure_parent_child, :structure_relations
  end
end
