class CreateFeedstockByProducts < ActiveRecord::Migration
  def change
    create_table :feedstock_by_products do |t|
      t.belongs_to :feedstock
      t.belongs_to :product
      t.integer :quantity

      t.timestamps
    end
    add_index :feedstock_by_products, :feedstock_id
    add_index :feedstock_by_products, :product_id
  end
end
