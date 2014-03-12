class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :image_uid
      t.text :local
      t.date :starts_at
      t.date :ends_at
      t.string :time
      t.string :external_link
      t.float :value
      t.string :state

      t.timestamps
    end
  end
end
