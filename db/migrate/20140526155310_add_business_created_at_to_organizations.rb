class AddBusinessCreatedAtToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :business_created_at, :date
  end
end
