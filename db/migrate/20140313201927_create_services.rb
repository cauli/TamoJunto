class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.references :organization, index: true
      t.string :name
      t.text :description
      t.string :image_uid
      t.text :local
      t.string :external_link
      t.float :value

      t.timestamps
    end
  end
end
