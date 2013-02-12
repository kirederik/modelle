class CreateProductStocks < ActiveRecord::Migration
  def change
    create_table :product_stocks do |t|
      t.belongs_to :product
      t.integer :quantity

      t.timestamps
    end
    add_index :product_stocks, :product_id
  end
end
