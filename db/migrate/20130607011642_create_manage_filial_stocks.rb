class CreateManageFilialStocks < ActiveRecord::Migration
  def change
    create_table :manage_filial_stocks do |t|
      t.integer :quantity
      t.belongs_to :product
      t.belongs_to :filial
      t.string :action_type

      t.timestamps
    end
    add_index :manage_filial_stocks, :product_id
    add_index :manage_filial_stocks, :filial_id
  end
end
