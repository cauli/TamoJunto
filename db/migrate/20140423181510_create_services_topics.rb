class CreateServicesTopics < ActiveRecord::Migration
  def change
    create_table :services_topics do |t|
      t.references :service, index: true
      t.references :topic, index: true
    end
  end
end
