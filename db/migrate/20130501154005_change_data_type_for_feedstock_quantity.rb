class ChangeDataTypeForFeedstockQuantity < ActiveRecord::Migration
  def up
    change_table :feedstock_stocks do |t|
      t.change :quantity, :decimal, :precision => 3, :scale => 2
    end
  end

  def down
  end
end
