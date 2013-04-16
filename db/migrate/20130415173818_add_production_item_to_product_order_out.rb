class AddProductionItemToProductOrderOut < ActiveRecord::Migration
  def change
    add_column :product_order_outs, :production_item_id, :integer
    add_index :product_order_outs, :production_item_id
  end
end
