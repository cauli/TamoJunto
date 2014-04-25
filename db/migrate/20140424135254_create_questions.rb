class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :question_text
      t.string :good_answer
      t.string :bad_answer
      t.references :topic, index: true
      t.references :theme, index: true
      t.integer :row_order

      t.timestamps
    end
  end
end
