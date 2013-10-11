class AddCreatorToEvaluator < ActiveRecord::Migration
  def change
    add_column :evaluators, :creator_id, :uuid
    add_index :evaluators, :creator_id
  end
end
