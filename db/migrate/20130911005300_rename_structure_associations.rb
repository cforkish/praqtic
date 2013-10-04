class RenameStructureAssociations < ActiveRecord::Migration
  def change
    rename_table :structure_relations, :category_relations
    rename_table :structure_friendships, :category_friendships
  end
end
