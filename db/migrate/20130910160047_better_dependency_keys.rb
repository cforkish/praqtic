class BetterDependencyKeys < ActiveRecord::Migration
  def change
    change_table :dependencies do |t|
      t.rename :need_id, :prereq_id
      t.rename :enable_id, :postreq_id
    end
  end
end
