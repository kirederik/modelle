class AddQuantityStockQuantityProductionToProductOrder < ActiveRecord::Migration
  def change
    add_column :product_orders, :quantity_stock, :integer
    add_column :product_orders, :quantity_production, :integer
  end
end
