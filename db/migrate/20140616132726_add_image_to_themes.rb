class AddImageToThemes < ActiveRecord::Migration
  def change
    add_column :themes, :image_uid, :string
  end
end
