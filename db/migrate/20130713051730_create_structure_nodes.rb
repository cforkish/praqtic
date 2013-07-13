class CreateStructureNodes < ActiveRecord::Migration
  def change
    create_table :structure_nodes do |t|
      t.string :name

      t.timestamps
    end
  end
end
