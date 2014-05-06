class AddRelatedThemeToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :related_theme_id, :integer
  end
end
