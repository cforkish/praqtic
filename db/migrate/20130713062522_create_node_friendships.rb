class CreateNodeFriendships < ActiveRecord::Migration
  def change
    enable_extension "uuid-ossp"

    create_table :node_friendships, id: :uuid do |t|
      t.uuid :structure_node_id
      t.uuid :friend_id

      t.timestamps
    end
  end
end
