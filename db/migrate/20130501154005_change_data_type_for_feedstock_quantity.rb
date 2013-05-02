class ChangeDataTypeForFeedstockQuantity < ActiveRecord::Migration
  def up
    change_table :feedstock_stocks do |t|
      t.change :quantity, :decimal
    end
  end

  def down
  end
end
