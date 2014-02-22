class AddFieldsToOrganization < ActiveRecord::Migration
  def change
    add_column :organizations, :name, :string
    add_column :organizations, :kind, :string
    add_column :organizations, :about, :text
    add_column :organizations, :image_uid, :string
    add_column :organizations, :phone, :string
    add_column :organizations, :city, :string
  end
end
