class AddCartIdToCart < ActiveRecord::Migration
  def change
    add_column :carts, :cart_id, :string
  end
end
