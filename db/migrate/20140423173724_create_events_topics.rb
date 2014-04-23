class CreateEventsTopics < ActiveRecord::Migration
  def change
    create_table :events_topics do |t|
      t.references :event, index: true
      t.references :topic, index: true
    end
  end
end
