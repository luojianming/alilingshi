class AddOrderIdToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :order_id, :string
    add_index :orders, :order_id
  end
end
