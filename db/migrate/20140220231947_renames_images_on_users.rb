class RenamesImagesOnUsers < ActiveRecord::Migration
  def change
    rename_column :users, :image, :image_uid
  end
end
