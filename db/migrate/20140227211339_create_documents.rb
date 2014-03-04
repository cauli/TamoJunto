class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :title
      t.string :description
      t.string :file_uid
      t.string :file_name

      t.timestamps
    end
  end
end
