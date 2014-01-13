class AddQuantityStockQuantityProductionToProductStock < ActiveRecord::Migration
  def change
    add_column :product_stocks, :quantity_stock, :integer
    add_column :product_stocks, :quantity_production, :integer
  end
end
