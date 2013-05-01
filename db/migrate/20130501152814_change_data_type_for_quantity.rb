class ChangeDataTypeForQuantity < ActiveRecord::Migration
  def up
    change_table :feedstock_by_products do |t|
      t.change :quantity, :decimal, :precision => 3, :scale => 2
    end
  end

  def down
  end
end
