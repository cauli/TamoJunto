class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.string :url
      t.string :embed_url

      t.timestamps
    end
  end
end
