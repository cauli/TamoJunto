class CreateRelatedThemes < ActiveRecord::Migration
  def change
    create_table :related_themes do |t|
      t.integer :theme_id
      t.integer :related_theme_id
    end

    add_index(:related_themes, [:theme_id, :related_theme_id], :unique => true)
    add_index(:related_themes, [:related_theme_id, :theme_id], :unique => true)
  end
end
