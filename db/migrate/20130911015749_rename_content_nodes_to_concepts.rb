class RenameContentNodesToQuizes < ActiveRecord::Migration
  def change
    rename_table :content_nodes, :quizes

    change_table :content_classifications do |t|
      t.rename :content_node_id, :quiz_id
    end

    change_table :questions do |t|
      t.rename :content_node_id, :quiz_id
    end

    change_table :lessons do |t|
      t.rename :content_node_id, :quiz_id
    end
  end
end
