class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.belongs_to :customer
      t.belongs_to :user
      t.belongs_to :order_status
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
    add_index :orders, :customer_id
    add_index :orders, :user_id
    add_index :orders, :order_status_id
  end
end
