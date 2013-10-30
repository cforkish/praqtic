class AddTimestapToUserTrackedQuestions < ActiveRecord::Migration
  def change
    add_column :user_tracked_questions, :created_at, :datetime
    add_column :user_tracked_questions, :updated_at, :datetime
  end
end
