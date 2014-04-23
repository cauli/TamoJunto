class CreateTopicsVideos < ActiveRecord::Migration
  def change
    create_table :topics_videos do |t|
      t.references :video, index: true
      t.references :topic, index: true
    end
  end
end
