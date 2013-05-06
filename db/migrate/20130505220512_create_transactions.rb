class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :customer_stock
      t.integer :quantity
      t.integer :value
      t.boolean :is_devolution
      t.datetime :create_at

      t.timestamps
    end
    add_index :transactions, :customer_stock_id
  end
end
