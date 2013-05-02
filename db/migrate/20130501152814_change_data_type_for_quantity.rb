class ChangeDataTypeForQuantity < ActiveRecord::Migration
  def up
    change_table :feedstock_by_products do |t|
      t.change :quantity, :decimal
    end
  end

  def down
  end
end
