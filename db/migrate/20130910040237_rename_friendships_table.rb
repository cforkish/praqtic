class RenameFriendshipsTable < ActiveRecord::Migration
  def change
    rename_table :node_friendships, :structure_friendships
  end
end
