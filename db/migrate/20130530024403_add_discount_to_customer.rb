class AddDiscountToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :discount, :float
  end
end
