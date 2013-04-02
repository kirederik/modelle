class CreateProductOrderOuts < ActiveRecord::Migration
  def change
    create_table :product_order_outs do |t|
      t.belongs_to :product_order
      t.integer :quantity

      t.timestamps
    end
    add_index :product_order_outs, :product_order_id
  end
end
