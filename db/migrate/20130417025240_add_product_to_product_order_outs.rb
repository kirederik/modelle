class AddProductToProductOrderOuts < ActiveRecord::Migration
  def change
    add_column :product_order_outs, :product_id, :integer
    add_index :product_order_outs, :product_id
  end
end
