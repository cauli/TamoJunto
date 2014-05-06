class CreateDiagnostics < ActiveRecord::Migration
  def change
    create_table :diagnostics do |t|
      t.references :user, index: true

      t.timestamps
    end
  end
end
