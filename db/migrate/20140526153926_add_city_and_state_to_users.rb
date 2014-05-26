class AddCityAndStateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :city, :string
    add_reference :users, :state, index: true
  end
end
