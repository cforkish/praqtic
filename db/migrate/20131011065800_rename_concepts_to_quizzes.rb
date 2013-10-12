class RenameConceptsToQuizzes < ActiveRecord::Migration
  def change
    rename_table :concepts, :quizzes

    change_table :classifications do |t|
      t.rename :concept_id, :quiz_id
    end

    change_table :evaluators do |t|
      t.rename :concept_id, :quiz_id
    end

    change_table :lessons do |t|
      t.rename :concept_id, :quiz_id
    end
  end
end
