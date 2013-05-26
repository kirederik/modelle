class AddProductBaseToProducts < ActiveRecord::Migration
  def change
    add_column :products, :product_base_id, :integer
  end
end
