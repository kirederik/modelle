class CreateCustomerStocks < ActiveRecord::Migration
  def change
    create_table :customer_stocks do |t|
      t.belongs_to :customer
      t.belongs_to :product
      t.integer :quantity

      t.timestamps
    end
    add_index :customer_stocks, :customer_id
    add_index :customer_stocks, :product_id
  end
end
