class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :image_uid
      t.text :content
      t.text :content_html

      t.timestamps
    end
  end
end
