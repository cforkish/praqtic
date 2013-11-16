class AddNumbersToQuestions < ActiveRecord::Migration
  def change
    add_column :question_answers, :number, :integer
  end
end
