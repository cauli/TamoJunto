class DropRelatedThemes < ActiveRecord::Migration
  def change
    drop_table :related_themes
  end
end
