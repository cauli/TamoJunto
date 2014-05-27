class AddRowOrderToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :row_order, :integer
  end
end
