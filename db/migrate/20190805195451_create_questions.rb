class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.references :subject, foreign_key: true
      t.references :question_type, foreign_key: true
      t.string :data_json

      t.timestamps
    end
  end
end
