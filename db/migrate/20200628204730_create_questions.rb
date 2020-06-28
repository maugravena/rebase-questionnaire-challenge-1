class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :description
      t.integer :points
      t.references :questionnaire, foreign_key: true

      t.timestamps
    end
  end
end
