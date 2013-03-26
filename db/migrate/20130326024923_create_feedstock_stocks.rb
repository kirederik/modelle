class CreateFeedstockStocks < ActiveRecord::Migration
  def change
    create_table :feedstock_stocks do |t|
      t.belongs_to :feedstock
      t.integer :quantity

      t.timestamps
    end
    add_index :feedstock_stocks, :feedstock_id
  end
end
