class CreateFilialStocks < ActiveRecord::Migration
  def change
    create_table :filial_stocks do |t|
      t.belongs_to :filial
      t.belongs_to :product
      t.integer :quantity

      t.timestamps
    end
    add_index :filial_stocks, :filial_id
    add_index :filial_stocks, :product_id
  end
end
