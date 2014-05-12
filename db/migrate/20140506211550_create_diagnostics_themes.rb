class CreateDiagnosticsThemes < ActiveRecord::Migration
  def change
    create_table :diagnostics_themes do |t|
      t.references :diagnostic, index: true
      t.references :theme, index: true
    end
  end
end
