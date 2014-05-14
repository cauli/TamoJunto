class CreateQuestionsThemes < ActiveRecord::Migration
  def change
    create_table :questions_themes do |t|
      t.references :question, index: true
      t.references :theme, index: true
    end
  end
end
