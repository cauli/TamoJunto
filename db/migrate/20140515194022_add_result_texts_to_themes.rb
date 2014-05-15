class AddResultTextsToThemes < ActiveRecord::Migration
  def change
    add_column :themes, :good_text, :text
    add_column :themes, :bad_text, :text
  end
end
