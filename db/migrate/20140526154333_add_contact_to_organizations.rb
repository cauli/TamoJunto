class AddContactToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :contact, :text
  end
end
