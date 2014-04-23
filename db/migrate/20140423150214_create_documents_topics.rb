class CreateDocumentsTopics < ActiveRecord::Migration
  def change
    create_table :documents_topics do |t|
      t.references :document, index: true
      t.references :topic, index: true
    end
  end
end
