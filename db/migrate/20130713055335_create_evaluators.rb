class CreateEvaluators < ActiveRecord::Migration
  def change
    create_table :evaluators do |t|
      t.timestamps
    end
  end
end
