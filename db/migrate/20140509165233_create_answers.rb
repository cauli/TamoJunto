class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :diagnostic, index: true
      t.references :question, index: true
      t.boolean :option

      t.timestamps
    end
  end
end
