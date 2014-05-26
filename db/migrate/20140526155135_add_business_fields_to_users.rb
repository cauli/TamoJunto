class AddBusinessFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :business_name, :string
    add_column :users, :business_type, :string
    add_column :users, :about_business, :text
    add_column :users, :business_created_at, :date
  end
end
