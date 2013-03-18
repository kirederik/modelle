class CreateCustomerPrices < ActiveRecord::Migration
  def change
    create_table :customer_prices do |t|
      t.belongs_to :customer
      t.belongs_to :product
      t.float :price

      t.timestamps
    end
    add_index :customer_prices, :customer_id
    add_index :customer_prices, :product_id
  end
end
