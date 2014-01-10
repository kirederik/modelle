class AddDeliveryDateAndAddresToOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :delivery_address, :string
  	add_column :orders, :delivery_date, :date
  end
end
