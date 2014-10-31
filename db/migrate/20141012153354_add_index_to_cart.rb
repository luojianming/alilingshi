class AddIndexToCart < ActiveRecord::Migration
  def change
    add_index :carts, :cart_id
  end
end
