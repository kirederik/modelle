class AddPriceToProductBase < ActiveRecord::Migration
  def change
    add_column :product_bases, :price, :float
  end
end
