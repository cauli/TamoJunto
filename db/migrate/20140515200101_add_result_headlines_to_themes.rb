class AddResultHeadlinesToThemes < ActiveRecord::Migration
  def change
    add_column :themes, :good_headline, :text
    add_column :themes, :bad_headline, :text
  end
end
