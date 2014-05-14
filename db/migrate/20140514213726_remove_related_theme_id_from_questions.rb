class RemoveRelatedThemeIdFromQuestions < ActiveRecord::Migration
  def change
    remove_column :questions, :related_theme_id, :integer
  end
end
