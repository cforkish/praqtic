class CreateUserTrackedQuestions < ActiveRecord::Migration
  def change
    create_table :user_tracked_questions, id: :uuid  do |t|
      t.uuid :user_id
      t.uuid :question_id
    end
  end
end
