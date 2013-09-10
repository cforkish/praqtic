class RenameContentClassificationTable < ActiveRecord::Migration
  def change
    rename_table :structure_content, :content_classifications
  end
end
