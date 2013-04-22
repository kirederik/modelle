class AddOrderTypeToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :order_type_id, :integer
    add_index :orders, :order_type_id, :unique => true
  end
end
