class AddLinkToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :link, :string
  end
end
