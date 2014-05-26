class AddStateToOrganizations < ActiveRecord::Migration
  def change
    add_reference :organizations, :state, index: true
  end
end
