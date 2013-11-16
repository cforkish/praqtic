class RenameClassifications < ActiveRecord::Migration
  def change
    rename_table :content_classifications, :classifications
  end
end
