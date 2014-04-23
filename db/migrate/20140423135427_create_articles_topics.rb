class CreateArticlesTopics < ActiveRecord::Migration
  def change
    create_table :articles_topics do |t|
      t.references :article, index: true
      t.references :topic, index: true
    end
  end
end
