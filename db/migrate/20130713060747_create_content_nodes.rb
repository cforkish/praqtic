class CreateContentNodes < ActiveRecord::Migration
  def change
    enable_extension "uuid-ossp"

    create_table :content_nodes, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
    
    create_table :dependencies do |t|
      t.uuid :enable_id
      t.uuid :need_id

      t.timestamps
    end

  end
end
