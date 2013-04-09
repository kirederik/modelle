class AddStatusToProductOrders < ActiveRecord::Migration
  def change
    add_column :product_orders, :status, :string
  end
end
